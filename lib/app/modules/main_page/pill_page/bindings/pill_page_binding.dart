import 'package:get/get.dart';

import '../controllers/pill_page_controller.dart';

class PillPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PillPageController>(
      () => PillPageController(),
    );
  }
}
