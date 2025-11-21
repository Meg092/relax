import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'relax_tools_magnifier_view_logic.dart';

class RelaxToolsMagnifierViewView extends StatelessWidget {
  RelaxToolsMagnifierViewView({super.key});

  final logic = Get.put(RelaxToolsMagnifierViewLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(child: _buildCameraPreview()),
            _buildControls(),
          ],
        ),
      ),
    );
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
              'Magnifier',
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

  Widget _buildCameraPreview() {
    return Obx(() {
      if (logic.isLoading.value) {
        return Container(
          color: const Color(0xFF1C1C1C),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.white,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Initializing camera...',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
        );
      }

      if (!logic.isInitialized.value || logic.cameraController == null) {
        return Container(
          color: const Color(0xFF1C1C1C),
          child: Center(
            child: Text(
              'Camera unavailable',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white54,
              ),
            ),
          ),
        );
      }

      return Stack(
        fit: StackFit.expand,
        children: [
          CameraPreview(logic.cameraController!),
          Positioned(
            top: 20.h,
            right: 20.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Obx(() => Text(
                    '${logic.currentZoomDisplay}x',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildControls() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: const Color(0xFF3C3C3C),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icon_plus.png',
              width: 32.w,
              height: 32.w,
              color: Colors.white,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Obx(() => SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 4.h,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.r),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.r),
                      activeTrackColor: const Color(0xFFFF9800),
                      inactiveTrackColor: const Color(0xFF666666),
                      thumbColor: const Color(0xFFFF9800),
                      overlayColor: const Color(0x29FF9800),
                    ),
                    child: Slider(
                      value: logic.zoomLevel.value,
                      onChanged: (value) => logic.updateZoom(value),
                      min: 0.0,
                      max: 1.0,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

