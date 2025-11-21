import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'relax_tools_relax_move_logic.dart';

class RelaxToolsRelaxMoveView extends GetView<RelaxToolsRelaxMoveLogic> {
  const RelaxToolsRelaxMoveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.gaed.value
              ? const CircularProgressIndicator(color: Colors.blueAccent)
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
              controller.bcqtre();
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
