import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'relax_tools_relax_player_logic.dart';

class RelaxToolsRelaxPlayerView extends StatelessWidget {
  RelaxToolsRelaxPlayerView({super.key});

  final logic = Get.put(RelaxToolsRelaxPlayerLogic());

  @override
  Widget build(BuildContext context) {
    final sound = Get.arguments as Map<String, String>? ?? {'name': 'Frog', 'image': 'assets/photo_frogs.png'};

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(sound['name']!),
            Expanded(child: _buildContent(sound)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(String title) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: const Color(0xFF333333),
              size: 24.w,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                color: const Color(0xFF333333),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 24.w),
        ],
      ),
    );
  }

  Widget _buildContent(Map<String, String> sound) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        _buildCoverImage(sound['image']!),
        SizedBox(height: 50.h),
        _buildTimeDisplay(),
        SizedBox(height: 30.h),
        _buildProgressBar(),
        SizedBox(height: 50.h),
        _buildControls(),
      ],
    );
  }

  Widget _buildCoverImage(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeDisplay() {
    return Obx(() => Text(
          logic.currentTime.value,
          style: TextStyle(
            fontSize: 56.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
            letterSpacing: 2.w,
          ),
        ));
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Obx(() => SliderTheme(
            data: SliderThemeData(
              trackHeight: 4.h,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.r),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.r),
              activeTrackColor: const Color(0xFFFF9800),
              inactiveTrackColor: const Color(0xFFE0E0E0),
              thumbColor: const Color(0xFFFF9800),
              overlayColor: const Color(0x29FF9800),
            ),
            child: Slider(
              value: logic.progress.value.clamp(0.0, 1.0),
              onChanged: (value) => logic.seekToPosition(value),
              min: 0.0,
              max: 1.0,
            ),
          )),
    );
  }

  Widget _buildControls() {
    return Column(
      children: [
        Obx(() => GestureDetector(
              onTap: () => logic.togglePlayPause(),
              child: Column(
                children: [
                  Icon(
                    logic.isPlaying.value ? Icons.pause : Icons.play_arrow,
                    size: 64.w,
                    color: const Color(0xFF333333),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    logic.isPlaying.value ? 'Pause' : 'Play',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF333333),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

