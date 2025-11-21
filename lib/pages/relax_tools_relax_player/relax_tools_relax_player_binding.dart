import 'package:get/get.dart';
import 'relax_tools_relax_player_logic.dart';

class RelaxToolsRelaxPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelaxToolsRelaxPlayerLogic());
  }
}

