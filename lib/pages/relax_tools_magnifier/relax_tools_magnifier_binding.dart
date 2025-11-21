import 'package:get/get.dart';
import 'relax_tools_magnifier_logic.dart';

class RelaxToolsMagnifierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelaxToolsMagnifierLogic());
  }
}

