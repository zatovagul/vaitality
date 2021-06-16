import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    _blueTooth();
  }
  _blueTooth()async{
    final available = await flutterBlue.isAvailable;
    print("available $available");
    blScan();
  }
  blScan()async{
    print("START SCAN");
    flutterBlue.scan(scanMode: ScanMode.lowLatency);
    await Future.delayed(Duration(seconds: 10));
    flutterBlue.stopScan();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
