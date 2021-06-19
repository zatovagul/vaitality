import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vaitality/app/modules/main_page/health_scan/views/health_scan_view.dart';
import 'package:vaitality/app/modules/main_page/pill_page/views/pill_page_view.dart';
import 'package:vaitality/app/modules/main_page/settings_page/views/settings_page_view.dart';

class MainPageController extends GetxController {
  RxInt page = 1.obs;

  GetView healthScan = HealthScanView(), settingsPage = SettingsPageView(), pillPage = PillPageView();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    //_blueTooth();
  }
  getPage(){
    if(page==0) return pillPage;
    if(page==2) return settingsPage;
    return healthScan;
  }



  final reactiveBle = FlutterReactiveBle();
  RxMap<String, DiscoveredDevice> deviceMap = RxMap();
  StreamSubscription<DiscoveredDevice>? subscription = null;
  Rx<BleStatus> blStatus=BleStatus.poweredOff.obs;
  RxMap<String, String> connectingInfo = RxMap();
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
        final stream = reactiveBle.scanForDevices(withServices: [], scanMode: ScanMode.lowPower);
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
    },
    onError: (err){
      print(err);
    });
    QualifiedCharacteristic charac = QualifiedCharacteristic(characteristicId: Uuid(utf8.encode("SEX")), serviceId: deviceMap[deviceId]!.serviceUuids[0], deviceId: deviceId);
    reactiveBle.readCharacteristic(charac);

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
