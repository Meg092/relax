import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:relax_tools/utils/index.dart';

class RelaxToolsEyeTrainingLogic extends GetxController {
  final FlutterTts _flutterTts = FlutterTts();
  Timer? _timer;
  final isEyeOpen = true.obs;
  final isTraining = false.obs;
  final hasPlayedIntro = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeTts();
  }

  @override
  void onReady() {
    super.onReady();
    _playIntroAndStartTraining();
  }

  @override
  void onClose() {
    _stopTraining();
    _flutterTts.stop();
    super.onClose();
  }

  Future<void> _initializeTts() async {
    try {
      await _flutterTts.setLanguage('en-US');
      await _flutterTts.setSpeechRate(0.45);
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);

      _flutterTts.setCompletionHandler(() {
      });

      _flutterTts.setErrorHandler((msg) {
        errorToast('Voice function error: $msg');
      });
    } catch (e) {
      errorToast('Failed to initialize voice function');
    }
  }

  Future<void> _playIntroAndStartTraining() async {
    try {
      await _flutterTts.speak(
        'Follow the voice prompts to open and close your eyes',
      );

      await Future.delayed(const Duration(seconds: 4));

      hasPlayedIntro.value = true;

      _startTraining();
    } catch (e) {
      errorToast('Failed to start training');
      hasPlayedIntro.value = true;
      _startTraining();
    }
  }

  void _startTraining() {
    if (isTraining.value) return;

    isTraining.value = true;
    _speakAndAnimate();
  }

  void _stopTraining() {
    isTraining.value = false;
    _timer?.cancel();
    _timer = null;
    _flutterTts.stop();
  }

  Future<void> _speakAndAnimate() async {
    if (!isTraining.value) return;

    try {
      isEyeOpen.value = true;
      await _flutterTts.speak('Open your eyes');

      await Future.delayed(const Duration(seconds: 4));

      if (!isTraining.value) return;

      isEyeOpen.value = false;
      await _flutterTts.speak('Close your eyes');

      await Future.delayed(const Duration(seconds: 4));

      if (isTraining.value) {
        _speakAndAnimate();
      }
    } catch (e) {
      errorToast('Training error occurred');
      _stopTraining();
    }
  }
}
