import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'relax_tools_relax_logic.dart';

class RelaxToolsRelaxView extends StatelessWidget {
  RelaxToolsRelaxView({super.key});

  final logic = Get.put(RelaxToolsRelaxLogic());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
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
                _buildSoundGrid(),
                SizedBox(height: 30.h),
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
        'Relax\nSecrets',
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
          'assets/bg/illustration_outdoor_adventure.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildSoundGrid() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
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
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.85,
        ),
        itemCount: logic.soundCategories.length,
        itemBuilder: (context, index) {
          return _buildSoundCard(logic.soundCategories[index]);
        },
      ),
    );
  }

  Widget _buildSoundCard(Map<String, String> sound) {
    return GestureDetector(
      onTap: () => Get.toNamed('/relax_tools_relax_player', arguments: sound),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  sound['image']!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Image.asset(
                  'assets/icon_audio_wave.png',
                  width: 20.w,
                  height: 20.w,
                ),
                SizedBox(width: 6.w),
                Text(
                  sound['name']!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
