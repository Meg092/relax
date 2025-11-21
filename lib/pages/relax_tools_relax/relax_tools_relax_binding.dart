import 'package:get/get.dart';
import 'relax_tools_relax_logic.dart';

class RelaxToolsRelaxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelaxToolsRelaxLogic());
  }
}

