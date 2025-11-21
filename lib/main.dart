import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relax_tools/pages/relax_tools_eye_care/relax_tools_eye_care_binding.dart';
import 'package:relax_tools/pages/relax_tools_eye_care/relax_tools_eye_care_view.dart';
import 'package:relax_tools/pages/relax_tools_eye_training/relax_tools_eye_training_binding.dart';
import 'package:relax_tools/pages/relax_tools_eye_training/relax_tools_eye_training_view.dart';
import 'package:relax_tools/pages/relax_tools_magnifier/relax_tools_magnifier_binding.dart';
import 'package:relax_tools/pages/relax_tools_magnifier/relax_tools_magnifier_view.dart';
import 'package:relax_tools/pages/relax_tools_magnifier_view/relax_tools_magnifier_view_binding.dart';
import 'package:relax_tools/pages/relax_tools_magnifier_view/relax_tools_magnifier_view_view.dart';
import 'package:relax_tools/pages/relax_tools_main/relax_tools_main_binding.dart';
import 'package:relax_tools/pages/relax_tools_main/relax_tools_main_view.dart';
import 'package:relax_tools/pages/relax_tools_relax/relax_tools_relax_binding.dart';
import 'package:relax_tools/pages/relax_tools_relax/relax_tools_relax_view.dart';
import 'package:relax_tools/pages/relax_tools_relax_move/relax_tools_relax_move_binding.dart';
import 'package:relax_tools/pages/relax_tools_relax_move/relax_tools_relax_move_view.dart';
import 'package:relax_tools/pages/relax_tools_relax_player/relax_tools_relax_player_binding.dart';
import 'package:relax_tools/pages/relax_tools_relax_player/relax_tools_relax_player_kin.dart';
import 'package:relax_tools/pages/relax_tools_relax_player/relax_tools_relax_player_view.dart';
import 'package:relax_tools/pages/relax_tools_settings/relax_tools_settings_binding.dart';
import 'package:relax_tools/pages/relax_tools_settings/relax_tools_settings_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'RelaxTools',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF3D4A7A),
            ),
            useMaterial3: true,
            fontFamily: 'System',
          ),
          initialRoute: '/',
          getPages: Relax,
        );
      },
    );
  }
}
List<GetPage<dynamic>> Relax = [
  GetPage(
    name: '/',
    page: () => RelaxToolsRelaxMoveView(),
    binding: RelaxToolsRelaxMoveBinding(),
  ),
  GetPage(
    name: '/relax_tools_main',
    page: () => RelaxToolsMainView(),
    binding: RelaxToolsMainBinding(),
  ),
  GetPage(
    name: '/relax_tools_eye_care',
    page: () => RelaxToolsEyeCareView(),
    binding: RelaxToolsEyeCareBinding(),
  ),
  GetPage(
    name: '/relax_tools_eye_care_training',
    page: () => RelaxToolsEyeTrainingView(),
    binding: RelaxToolsEyeTrainingBinding(),
  ),
  GetPage(
    name: '/relax_tools_magnifier',
    page: () => RelaxToolsMagnifierView(),
    binding: RelaxToolsMagnifierBinding(),
  ),
  GetPage(
    name: '/relax_tools_magnifier_view',
    page: () => RelaxToolsMagnifierViewView(),
    binding: RelaxToolsMagnifierViewBinding(),
  ),
  GetPage(
    name: '/relax_tools_relax',
    page: () => RelaxToolsRelaxView(),
    binding: RelaxToolsRelaxBinding(),
  ),
  GetPage(
    name: '/relax_tools_relax_player',
    page: () => RelaxToolsRelaxPlayerView(),
    binding: RelaxToolsRelaxPlayerBinding(),
  ),
  GetPage(
    name: '/relax_tools_relax_king',
    page: () => RelaxToolsRelaxPlayerKin(),
  ),
  GetPage(
    name: '/relax_tools_settings',
    page: () => RelaxToolsSettingsView(),
    binding: RelaxToolsSettingsBinding(),
  ),
];