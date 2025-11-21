import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'relax_tools_relax_move_logic.dart';

class RelaxToolsRelaxMoveView extends GetView<RelaxToolsRelaxMoveLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.bcwumh.value
              ? const CircularProgressIndicator(color: Colors.black54)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.xdsnvr();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
