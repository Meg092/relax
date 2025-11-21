import 'package:get/get.dart';
import 'relax_tools_eye_care_logic.dart';

class RelaxToolsEyeCareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelaxToolsEyeCareLogic());
  }
}

