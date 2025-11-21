import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelaxToolsSettingsView extends StatelessWidget {
  const RelaxToolsSettingsView({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 30.h),
          _buildHeader(),
          _buildSettingsList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 30.h),
      child: Text(
        'Settings Center',
        style: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF333333),
        ),
      ),
    );
  }

  Widget _buildSettingsList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
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
      child: _buildSettingsItem('App Version', trailing: 'V1.00'),
    );
  }

  Widget _buildSettingsItem(String title, {String? trailing}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 18.sp, color: const Color(0xFF333333)),
            ),
          ),
          if (trailing != null)
            Text(
              trailing,
              style: TextStyle(fontSize: 16.sp, color: const Color(0xFF999999)),
            ),
        ],
      ),
    );
  }
}
