import 'package:get/get.dart';

import 'relax_tools_relax_move_logic.dart';

class RelaxToolsRelaxMoveBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      RelaxToolsRelaxMoveLogic(),
      permanent: true,
    );
  }
}
