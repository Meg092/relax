import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:relax_tools/utils/index.dart';

class RelaxToolsRelaxPlayerLogic extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  final isPlaying = false.obs;
  final currentTime = '00:00:00'.obs;
  final progress = 0.0.obs;
  final totalDuration = Duration.zero.obs;
  final currentPosition = Duration.zero.obs;
  
  String? audioPath;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _stateSubscription;

  @override
  void onInit() {
    super.onInit();
    
    final sound = Get.arguments as Map<String, String>?;
    if (sound != null) {
      audioPath = _getAudioPath(sound['name'] ?? 'Frog');
    }
    
    _setupAudioPlayer();
  }

  @override
  void onReady() {
    super.onReady();
    if (audioPath != null) {
      _loadAndPlay();
    }
  }

  @override
  void onClose() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _stateSubscription?.cancel();
    
    try {
      _audioPlayer.stop();
    } catch (e) {
    }
    
    _audioPlayer.dispose();
    super.onClose();
  }

  String _getAudioPath(String name) {
    switch (name.toLowerCase()) {
      case 'frog':
        return 'audio/frog.wav';
      case 'bird':
        return 'audio/birds_chirping.wav';
      case 'lake':
        return 'audio/water_waves.wav';
      case 'insect':
        return 'audio/crickets.wav';
      default:
        return 'audio/frog.wav';
    }
  }

  void _setupAudioPlayer() {
    _positionSubscription = _audioPlayer.onPositionChanged.listen((position) {
      currentPosition.value = position;
      _updateTimeDisplay(position);
      _updateProgress(position);
    });

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      totalDuration.value = duration;
    });

    _stateSubscription = _audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      _loadAndPlay();
    });

    _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> _loadAndPlay() async {
    if (audioPath == null) return;

    try {
      await _audioPlayer.play(AssetSource(audioPath!));
      isPlaying.value = true;
    } catch (e) {
      errorToast('Failed to load audio: ${e.toString()}');
    }
  }

  void togglePlayPause() async {
    try {
      if (isPlaying.value) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
    } catch (e) {
      errorToast('Playback error');
    }
  }

  Future<void> seekToPosition(double value) async {
    try {
      progress.value = value;
      final duration = totalDuration.value;
      final position = Duration(milliseconds: (duration.inMilliseconds * value).toInt());
      await _audioPlayer.seek(position);
    } catch (e) {
      errorToast('Failed to seek');
    }
  }

  void _updateTimeDisplay(Duration position) {
    final hours = position.inHours.toString().padLeft(2, '0');
    final minutes = (position.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (position.inSeconds % 60).toString().padLeft(2, '0');
    currentTime.value = '$hours:$minutes:$seconds';
  }

  void _updateProgress(Duration position) {
    if (totalDuration.value.inMilliseconds > 0) {
      progress.value = position.inMilliseconds / totalDuration.value.inMilliseconds;
    }
  }
}

