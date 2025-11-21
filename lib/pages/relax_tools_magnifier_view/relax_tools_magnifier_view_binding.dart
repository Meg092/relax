import 'package:get/get.dart';
import 'relax_tools_magnifier_view_logic.dart';

class RelaxToolsMagnifierViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelaxToolsMagnifierViewLogic());
  }
}

