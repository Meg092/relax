import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'relax_tools_eye_care_logic.dart';

class RelaxToolsEyeCareView extends StatelessWidget {
  RelaxToolsEyeCareView({super.key});

  final logic = Get.put(RelaxToolsEyeCareLogic());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildIllustration(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 46.h),
                _buildHeader(),
                SizedBox(height: 100.h),
                _buildContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Text(
        'Eye Care\nSecrets',
        style: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF333333),
          height: 1.2,
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        width: double.infinity,
        child: Image.asset(
          'assets/bg/illustration_privacy_security.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'As we age, our eyes face many health challenges, such as cataracts, macular degeneration, and blue light damage.',
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF333333),
              height: 1.6,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'These eye conditions not only affect vision, but can also lead to a decline in quality of life. Therefore, understanding the importance of eye health is the first step in caring for the eyes of the elderly.',
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF333333),
              height: 1.6,
            ),
          ),
          SizedBox(height: 30.h),
          _buildActionButton(),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return GestureDetector(
      onTap: () => Get.toNamed('/relax_tools_eye_care_training'),
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: const Color(0xFF3D4A7A),
          borderRadius: BorderRadius.circular(28.r),
        ),
        alignment: Alignment.center,
        child: Text(
          'Start Eye Training',
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
