import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:relax_tools/utils/index.dart';

class RelaxToolsMagnifierViewLogic extends GetxController {
  CameraController? cameraController;
  final zoomLevel = 0.0.obs;
  final isInitialized = false.obs;
  final isLoading = true.obs;
  
  final double minZoom = 1.0;
  final double maxZoom = 8.0;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  @override
  void onClose() {
    try {
      _disposeCamera();
    } catch (e) {
    }
    super.onClose();
  }

  Future<void> _initializeCamera() async {
    try {
      final status = await Permission.camera.request();
      
      if (status.isDenied) {
        errorToast('Camera permission denied');
        isLoading.value = false;
        return;
      }
      
      if (status.isPermanentlyDenied) {
        errorToast('Please enable camera permission in settings');
        isLoading.value = false;
        await openAppSettings();
        return;
      }

      final cameras = await availableCameras();
      
      if (cameras.isEmpty) {
        errorToast('No camera found');
        isLoading.value = false;
        return;
      }

      final camera = cameras.first;
      
      cameraController = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await cameraController!.initialize();
      
      await cameraController!.setZoomLevel(minZoom);
      
      isInitialized.value = true;
      isLoading.value = false;
    } catch (e) {
      errorToast('Failed to initialize camera: ${e.toString()}');
      isLoading.value = false;
    }
  }

  Future<void> updateZoom(double sliderValue) async {
    if (cameraController == null || !isInitialized.value) return;
    
    try {
      zoomLevel.value = sliderValue;
      
      final actualZoom = minZoom + (sliderValue * (maxZoom - minZoom));
      
      await cameraController!.setZoomLevel(actualZoom);
    } catch (e) {
      errorToast('Failed to adjust zoom');
    }
  }

  void _disposeCamera() {
    cameraController?.dispose();
    cameraController = null;
  }

  double get currentZoomDisplay {
    final actualZoom = minZoom + (zoomLevel.value * (maxZoom - minZoom));
    return double.parse(actualZoom.toStringAsFixed(1));
  }
}

