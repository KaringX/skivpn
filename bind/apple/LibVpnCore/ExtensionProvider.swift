import Foundation
import System
import Libclash

import NetworkExtension

#if os(iOS)
import WidgetKit
#endif
// #if os(iOS)
// import UIKit
// #elseif os(macOS)
// import AppKit
// #endif

class VpnServiceConfig: Codable {
    var base_dir: String = ""
    var work_dir: String = ""
    var cache_dir: String = ""
    var core_path: String = ""
    var core_path_patch: String = ""
    var core_path_patch_final: String = ""
    var log_path: String = ""
    var err_path: String = ""
    var id: String = ""
    var version: String = ""
    var name: String = ""
}

struct ProviderMessage: Codable {
    var messageId: String = ""
    var messageParams: String = ""
}

struct ProviderMessageResponse: Codable {
    var err: String?
    var data: String? 
    var extra: [String: String] = [:]
}

enum VpnError: Error {
    case Error(String)
}

open class ExtensionProvider: NEPacketTunnelProvider {
    private static let systemExtension = true
    private static let controlKind = "com.nebula.ski.skiWidget.ControlCenterToggle"
    private var config: VpnServiceConfig?

    override open func startTunnel(
        options: [String: NSObject]?
    ) async throws {
        // if options != nil && options!["fromApp"] is NSString {
        //
        // }
        
        do {
            try await start()
        }
        catch let VpnError.Error(err) {
            throw NSError(domain: "VpnError:\(err),", code: 0)
        }
        catch let err {
            throw err
        }
#if os(iOS)
        if #available(iOS 18.0, *) {
            ControlCenter.shared.reloadControls(ofKind: ExtensionProvider.controlKind)
        }
#endif
    }

    override open func stopTunnel(
        with reason: NEProviderStopReason, completionHandler: @escaping () -> Void
    ) {
#if os(iOS)
        if #available(iOS 18.0, *) {
            ControlCenter.shared.reloadControls(ofKind: ExtensionProvider.controlKind)
        }
#endif
        completionHandler() // completionHandler faster than syn
        exit(EXIT_FAILURE)
    }

    override open func handleAppMessage(_ messageData: Data) async -> Data? {
        var messageResponse = ProviderMessageResponse()
        do {
            let message = try! JSONDecoder().decode(ProviderMessage.self, from: messageData)
            if message.messageId == "restart" {
                try await restartService(extra: &messageResponse.extra)
            } else if message.messageId == "clashiApiConnections"{
                let content = LibclashGetConnections(message.messageParams == "true")
                let data: Data = content.data(using: String.Encoding.utf8)!
                return data
            } else if message.messageId == "clashiApiTraffic"{
                let content = LibclashGetTraffic()
                let data: Data = content.data(using: String.Encoding.utf8)!
                return data
            } else {
                messageResponse.err = "unsupport \(message.messageId)"
            }
        }
        catch let VpnError.Error(err) {
            messageResponse.err = err
        }
        catch let err {
            messageResponse.err = err.localizedDescription
        }
#if os(iOS)
        if #available(iOS 18.0, *) {
           ControlCenter.shared.reloadControls(ofKind: ExtensionProvider.controlKind)
        }
#endif
        if messageResponse.err != nil {
            let body: Data = try! JSONEncoder().encode(messageResponse)
            DispatchQueue.global().async {
                exit(EXIT_FAILURE)
            }
            return body
        }

        return nil
    }

    override open func sleep(completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    override open func wake() {
    }
}

extension ExtensionProvider {
    fileprivate func setupService() async throws {
        guard let conf = (protocolConfiguration as! NETunnelProviderProtocol).providerConfiguration
        else {
            throw VpnError.Error("providerConfiguration invalid")
        }
        let configFilePath = conf["configFilePath"] as! String
#if os(macOS) 
        if !FileManager.default.isReadableFile(atPath: configFilePath) {
            try await Task.sleep(nanoseconds: NSEC_PER_MSEC * 100)
            throw VpnError.Error("FullDiskAccessPermissionRequired")
        }
#endif
        if !FileManager.default.fileExists(atPath: configFilePath) {
            throw VpnError.Error("file not exist \(configFilePath)")
        }
        let text = try! String(contentsOfFile: configFilePath, encoding: String.Encoding.utf8)
        let jsonData: Data = text.data(using: String.Encoding.utf8)!
        config = try! JSONDecoder().decode(VpnServiceConfig.self, from: jsonData)
        if config == nil {
            throw VpnError.Error("decode VpnServiceConfig failed: \(configFilePath)")
        }
        let setupOptions = LibclashSetupOptions()
        setupOptions.homeDir = config!.base_dir
        setupOptions.logFile = config!.log_path

        var error: NSError?
        LibclashSetup(setupOptions, &error)
        if error != nil {
            throw VpnError.Error("LibclashSetup failed: \(error!.localizedDescription)")
        }
    }

    fileprivate func writeError(_ message: String) {
        NSLog(message)
        if config != nil && !config!.err_path.isEmpty {
            do {
                let fileUrl = URL(fileURLWithPath: config!.err_path)
                try message.write(to: fileUrl, atomically: true, encoding: String.Encoding.utf8)
            } catch {
            }
        }
    }

    fileprivate func start() async throws {
        try await setupService()
        try await startService()
    }

    fileprivate func startService() async throws {
        let startOptions = LibclashStartOptions()
        startOptions.configFile = config!.core_path
        startOptions.configFilePatch = config!.core_path_patch
        startOptions.configFilePatchFinal = config!.core_path_patch_final

        let tunInterface = ExtensionPlatformInterface(self)
        var error: NSError?
        LibclashStart(startOptions, tunInterface, &error)
        if error != nil {
            throw VpnError.Error("LibclashStart failed: \(error!.localizedDescription)")
        }
    }

    fileprivate func stopService() async throws {
        var error: NSError?
        LibclashStop(&error)
    }

    func restartService(extra: inout [String: String]) async throws {
        if reasserting {
            extra["is_close_error"] = "true"
            throw VpnError.Error("reasserting")
        }
        reasserting = true
        defer {
            reasserting = false
        }
        do {
            try await stopService()
        }
        catch let err {
            extra["is_close_error"] = "true"
            throw err
        }
        try await setupService()
        try await startService()
    }

    func postServiceClose() {
       
    }
}
