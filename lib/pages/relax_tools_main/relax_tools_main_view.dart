import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relax_tools/pages/relax_tools_eye_care/relax_tools_eye_care_view.dart';
import 'package:relax_tools/pages/relax_tools_magnifier/relax_tools_magnifier_view.dart';
import 'package:relax_tools/pages/relax_tools_relax/relax_tools_relax_view.dart';
import 'package:relax_tools/pages/relax_tools_settings/relax_tools_settings_view.dart';
import 'relax_tools_main_logic.dart';

class RelaxToolsMainView extends StatelessWidget {
  RelaxToolsMainView({super.key});

  final logic = Get.put(RelaxToolsMainLogic());

  final List<Widget> _pages = [
    RelaxToolsEyeCareView(),
    RelaxToolsMagnifierView(),
    RelaxToolsRelaxView(),
    RelaxToolsSettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[logic.currentIndex.value]),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10.r,
                offset: Offset(0, -2.h),
              ),
            ],
          ),
          child: SafeArea(
            child: SizedBox(
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabItem(0, 'Eye Care', 'assets/tabs/icon_favorite_inactive.png',
                      'assets/tabs/icon_favorite_active.png'),
                  _buildTabItem(1, 'Magnifier', 'assets/tabs/icon_zoom_in_inactive.png',
                      'assets/tabs/icon_zoom_in_active.png'),
                  _buildTabItem(2, 'Relax', 'assets/tabs/icon_location_inactive.png',
                      'assets/tabs/icon_location_active.png'),
                  _buildTabItem(3, 'Settings', 'assets/tabs/icon_tools_inactive.png',
                      'assets/tabs/icon_tools_active.png'),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildTabItem(
      int index, String label, String inactiveIcon, String activeIcon) {
    final isSelected = logic.currentIndex.value == index;
    return GestureDetector(
      onTap: () => logic.changeTab(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              isSelected ? activeIcon : inactiveIcon,
              width: 28.w,
              height: 28.w,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: isSelected ? const Color(0xFF3D4A7A) : const Color(0xFF999999),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

