import 'package:get/get.dart';

import '../controllers/health_scan_controller.dart';

class HealthScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthScanController>(
      () => HealthScanController(),
    );
  }
}
