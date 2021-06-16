import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:get/get.dart';

import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    controller.increment();
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPageView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 40, width: double.infinity,
            child: TextButton(onPressed: controller.blScan,child: Text("SCAN"),),
          ),
          if(1==2)
          StreamBuilder(
              stream: controller.flutterBlue.scanResults,
              builder: (context, AsyncSnapshot<List<ScanResult>> snapshot){
                print(snapshot.data);
                if(snapshot.data==null) return SizedBox();
            return Column(
              children: [
                ...snapshot.data!.where((element) => element.device.name.isNotEmpty).map((e) =>
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("ScanResult{\ndevice: ${e.device},\n advertisementData: ${e.advertisementData},\n rssi: ${e.rssi}\n}"),
                    )
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
