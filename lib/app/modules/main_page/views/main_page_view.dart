import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';
import 'package:vaitality/app/modules/main_page/health_scan/views/health_scan_view.dart';
import 'package:vaitality/app/widgets/custom_painters/background_paint.dart';
import 'package:vaitality/app/widgets/custom_progress_indicator.dart';

import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Obx(()=>controller.getPage()),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.lightGrey,
          ),
          Material(
            color: AppColors.white,
            child: Container(
              height: AppSizes.w1 *  50 + MediaQuery.of(context).padding.bottom,
              decoration: BoxDecoration(
                boxShadow: [
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    height: AppSizes.w1 *  50,
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w1 * 50),
                    child: Obx(() {
                      int page = controller.page.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: () => controller.page.value = 0,
                              icon: SvgPicture.asset(
                                "assets/images/pill_icon${page==0?"":"_na"}.svg",
                                width: AppSizes.w1 * 26,)),
                          IconButton(onPressed: () => controller.page.value = 1,
                              icon: SvgPicture.asset(
                                "assets/images/fav_icon${page==1?"":"_na"}.svg",
                                width: AppSizes.w1 * 26,)),
                          IconButton(onPressed: () => controller.page.value = 2,
                              icon: SvgPicture.asset(
                                "assets/images/set_icon${page==2?"":"_na"}.svg",
                                width: AppSizes.w1 * 25,)),
                        ],
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  getColor(col){
    if(col) return AppColors.black;
    return AppColors.grey;
  }
}


class BluetoothTest extends StatelessWidget {
  final MainPageController controller = Get.put(MainPageController())!;
  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}

