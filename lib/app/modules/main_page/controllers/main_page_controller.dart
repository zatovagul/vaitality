import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class MainPageController extends GetxController {
  final reactiveBle = FlutterReactiveBle();
  RxMap<String, DiscoveredDevice> deviceMap = RxMap();
  StreamSubscription<DiscoveredDevice>? subscription = null;
  Rx<BleStatus> blStatus=BleStatus.poweredOff.obs;
  RxMap<String, String> connectingInfo = RxMap();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    _blueTooth();
  }
  _blueTooth()async{
    final stat = await Permission.bluetooth.status;
    print(stat);

    reactiveBle.statusStream.listen((event) {
      blStatus.value =event;
    });

    if(await Permission.bluetooth.request().isGranted)
      if( await Permission.location.request().isGranted)
        blScan();
  }
  blScan()async{
    deviceMap.value = {};

      if (subscription == null) {
        final stream = reactiveBle.scanForDevices(withServices: []);
        subscription = stream.listen((event) {
          if (event.name.isNotEmpty) {
            deviceMap[event.id] = event;
            if(!connectingInfo.containsKey(event.id))
            connectingInfo[event.id] = "NOT CONNECTED";
          }
        });
        subscription!.pause();
      }
      if (subscription!.isPaused) {
        print("START");
        subscription!.resume();
        await Future.delayed(Duration(seconds: 10));
        subscription!.pause();
      }
  }
  connect(deviceId){
    final subscription = reactiveBle.connectToDevice(id: deviceId).listen((event) {
      connectingInfo[deviceId] = event.connectionState.toString();
      print(event);
    },
    onError: (err){
      print(err);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
