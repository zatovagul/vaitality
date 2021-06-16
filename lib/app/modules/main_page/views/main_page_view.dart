import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

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
          ), SizedBox(height: 10,),
            Obx(()=>Center(child: Text("${controller.blStatus}"),)),
          Obx(()=>Column(
              children: [
                ...controller.deviceMap.keys.map((e) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){controller.connect(e);},
                      child: Text("${controller.deviceMap[e]} \n\n ${controller.connectingInfo[e]}")
                  ),
                ))
              ],
            )
            ,)

        ],
      ),
    );
  }
}
