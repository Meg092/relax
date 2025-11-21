import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'relax_tools_eye_training_logic.dart';

class RelaxToolsEyeTrainingView extends StatelessWidget {
  RelaxToolsEyeTrainingView({super.key});

  final logic = Get.put(RelaxToolsEyeTrainingLogic());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final backgroundColor = logic.isEyeOpen.value 
          ? const Color(0xFF4A5D8C)
          : const Color(0xFF2D3654);
      
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: backgroundColor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(child: _buildContent()),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildAppBar() {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24.w,
            ),
          ),
          Expanded(
            child: Text(
              'Eye Training',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 24.w),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        SizedBox(height: 40.h),
        _buildPromptBox(),
        SizedBox(height: 100.h),
        _buildEyeIcons(),
      ],
    );
  }

  Widget _buildPromptBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: const Color(0xFF5A6A9A),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Text(
        'Follow voice prompts to open and close eyes',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildEyeIcons() {
    return Obx(() {
      final isOpen = logic.isEyeOpen.value;
      return Column(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              isOpen ? 'assets/icon_eye_open.png' : 'assets/icon_eye_closed.png',
              key: ValueKey(isOpen),
              width: 180.w,
              height: 180.w,
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            isOpen ? 'Open Eyes' : 'Close Eyes',
            style: TextStyle(
              fontSize: 24.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    });
  }
}

