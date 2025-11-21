import 'package:get/get.dart';
import 'relax_tools_main_logic.dart';

class RelaxToolsMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelaxToolsMainLogic());
  }
}

