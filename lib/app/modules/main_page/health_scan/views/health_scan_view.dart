import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';
import 'package:vaitality/app/widgets/cardiogram/cardiogram_widget.dart';
import 'package:vaitality/app/widgets/custom_painters/background_paint.dart';
import 'package:vaitality/app/widgets/custom_progress_indicator.dart';

import '../controllers/health_scan_controller.dart';

class HealthScanView extends GetView<HealthScanController> {
  final controller = Get.put(HealthScanController())!;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPaint(),
      child: Column(
        children: [
          Material(
            color: AppColors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppSizes.h1 * 16))),
            elevation: 5,
            child: Column(
              children: [
                AppBar(
                  title: Row(
                    children: [
                      SvgPicture.asset("assets/images/vaitality_icon.svg",width: AppSizes.w1 * 36, height: AppSizes.h1 * 28,),
                      SizedBox(width: AppSizes.w1 * 9,),
                      SvgPicture.asset("assets/images/vaitality_text.svg",width: AppSizes.w1 * 97,)
                    ],
                  ),
                  actions: [
                    IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/images/share_icon.svg', width: AppSizes.w1 * 16,)),

                  ],
                  centerTitle: false,elevation: 0,
                ),
                Container(
                  height: AppSizes.w1 * 100,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.only(left: AppSizes.w1 * 16, right: AppSizes.w1 * 5),
                    child: Row(
                      children: [
                        Obx(()=>Opacity(
                          opacity: controller.connected.value ? 1 : 0.5,
                          child: TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: controller.healthValue.value),
                            duration: Duration(milliseconds: 200),
                            builder:(context,double value, _) => SizedBox(
                                width: AppSizes.w1 * 82,
                                height: AppSizes.w1 * 82,
                                child: CustomProgressIndicator(
                                  value: value,
                                )),
                          ),
                        )),
                        SizedBox(width: AppSizes.w1 * 20),
                        Expanded(
                          child: Obx(()=>Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.connected.value ? "Уровень состояния здоровья" : needConnect, style: AppTextStyles.black13_w400),
                              if(controller.connected.value)
                                Text("${getStatusName(controller.healthValue.value)}", style: AppTextStyles.black24_w400.copyWith(fontWeight: FontWeight.w500),)
                            ],)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: CardiogramWidget())
        ],
      ),
    );
  }
}


String getStatusName(double a){
  if(a>=70) return "Хороший";
  if(a>=30) return "Средний";
  return "Низкий";
}
String get needConnect=>"Необходимо подключиться к аппарату по сети Bluetooth для доступа к его функциям";