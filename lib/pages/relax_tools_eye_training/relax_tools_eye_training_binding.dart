import 'package:get/get.dart';
import 'relax_tools_eye_training_logic.dart';

class RelaxToolsEyeTrainingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelaxToolsEyeTrainingLogic());
  }
}

