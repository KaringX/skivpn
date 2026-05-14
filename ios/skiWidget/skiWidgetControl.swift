//
//  skiWidgetControl.swift
//  skiWidget
//
//  Created by user on 2026/1/19.
//

import AppIntents
import SwiftUI
import WidgetKit

import NetworkExtension

struct skiWidgetControl: ControlWidget {
    public static let controlKind: String = "com.nebula.ski.skiWidget.ControlCenterToggle"
    private static let bundleIdentifier = "com.nebula.ski.skiService"
    private static let groupIdentifier = "group.com.nebula.ski"
    private static let defaultSharedDirectory: URL! = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupIdentifier)!
    public static let configFile = defaultSharedDirectory.appendingPathComponent("service.json", isDirectory: false)
    public init(){
        VpnServiceHandler.shared.controlKind = skiWidgetControl.controlKind
        VpnServiceHandler.shared.bundleIdentifier = skiWidgetControl.bundleIdentifier
        VpnServiceHandler.shared.configFilePath = skiWidgetControl.configFile.path()
        VpnServiceHandler.shared.uiServerAddress = "SkiVPN"
        VpnServiceHandler.shared.uiLocalizedDescription = "SkiVPN"
        VpnServiceHandler.shared.getState(result: {_ in })
    }
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: Self.controlKind,
            provider: Provider()
        ) { value in
             ControlWidgetToggle(
                "SkiVPN",
                isOn: value,
                action: StartVPNServiceIntent()
            ) { isRunning in
                Label(isRunning ? "ON" : "OFF", image: "control_widget")
            }
        }
        .displayName("ON/OFF")
        .description("Start or Stop SkiVPN VPN service")
    }
}

extension skiWidgetControl {
    struct Provider: ControlValueProvider {
         var previewValue: Bool {
            let runing = isRunning()
            return runing
        }

        func currentValue() async throws -> Bool {
            let runing = await isRunning()
            return runing
        }

        func isRunning() async -> Bool {
            let status = await VpnServiceHandler.shared.getCurrentState()
            return status == NEVPNStatus.connecting || status == NEVPNStatus.connected || status == NEVPNStatus.reasserting
        }
    }
}

struct StartVPNServiceIntent: SetValueIntent {
    static let title: LocalizedStringResource = "ON/OFF"

    @Parameter(title: "ON")
    var value: Bool

    func perform() async throws -> some IntentResult {
        if await FileManager.default.fileExists(atPath: skiWidgetControl.configFile.path()) {
            let controlKind = await skiWidgetControl.controlKind
            if value {
                VpnServiceHandler.shared.start(timeoutInSeconds: 30) { err in
#if os(iOS)
                    if #available(iOS 18.0, *) {
                        ControlCenter.shared.reloadControls(ofKind: controlKind)
                    }
#endif
                }
            } else {
                VpnServiceHandler.shared.stop { err in
#if os(iOS)
                    if #available(iOS 18.0, *) {
                        ControlCenter.shared.reloadControls(ofKind: controlKind)
                    }
#endif
                }
            }
        }
        
        return .result()
    }
}
