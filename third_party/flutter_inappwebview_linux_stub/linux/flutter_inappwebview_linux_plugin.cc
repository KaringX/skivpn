#include "include/flutter_inappwebview_linux/flutter_inappwebview_linux_plugin.h"

struct _FlutterInappwebviewLinuxPlugin {
  GObject parent_instance;
};

G_DEFINE_TYPE(FlutterInappwebviewLinuxPlugin,
              flutter_inappwebview_linux_plugin,
              g_object_get_type())

static void flutter_inappwebview_linux_plugin_class_init(
    FlutterInappwebviewLinuxPluginClass* klass) {}

static void flutter_inappwebview_linux_plugin_init(
    FlutterInappwebviewLinuxPlugin* self) {}

void flutter_inappwebview_linux_plugin_register_with_registrar(
    FlPluginRegistrar* registrar) {
  FlutterInappwebviewLinuxPlugin* plugin = FLUTTER_INAPPWEBVIEW_LINUX_PLUGIN(
      g_object_new(flutter_inappwebview_linux_plugin_get_type(), nullptr));

  g_object_unref(plugin);
}
