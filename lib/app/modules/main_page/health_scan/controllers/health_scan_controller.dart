import 'dart:math';

import 'package:get/get.dart';

class HealthScanController extends GetxController {
  RxDouble healthValue = 0.0.obs;
  RxBool connected = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _health();
  }
  _health()async{
    await Future.delayed(Duration(seconds: 5));
    connected.value = true;
    final ran = Random();
    for(int i =0;i<=10;i++){
      await Future.delayed(Duration(milliseconds: 400));
      healthValue.value = i * 10;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
