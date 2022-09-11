//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <desktop_webview_auth/desktop_webview_auth_plugin.h>
#include <dynamic_color/dynamic_color_plugin_c_api.h>
#include <modal_progress_hud_nsn/modal_progress_hud_nsn_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  DesktopWebviewAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopWebviewAuthPlugin"));
  DynamicColorPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DynamicColorPluginCApi"));
  ModalProgressHudNsnPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ModalProgressHudNsnPlugin"));
}
