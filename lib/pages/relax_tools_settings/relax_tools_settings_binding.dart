import 'package:get/get.dart';
import 'relax_tools_settings_logic.dart';

class RelaxToolsSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelaxToolsSettingsLogic());
  }
}

