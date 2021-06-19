import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';
import 'package:vaitality/app/widgets/custom_appbar.dart';
import 'package:vaitality/app/widgets/page/pill_page/pill_item_widget.dart';

import '../controllers/pill_page_controller.dart';

class PillPageView extends GetView<PillPageController> {
  final PillPageController controller =Get.put(PillPageController())!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueGrey,
      appBar: CustomAppBar(
        text: 'Прием препаратов',
        actions: [Obx(()=>
            controller.isEdit.value ?
              TextButton(onPressed: ()=>controller.isEdit.value = false, child: Text("Готово", style: AppTextStyles.pink17_w400,))
            : IconButton(onPressed: showModalPopUp, icon: SvgPicture.asset("assets/images/circle_dots.svg", width: AppSizes.w1 * 16,)))
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: Obx(()=>ListView(
                  children: [
                    ...controller.pillItemModels.map((element) =>
                        PillItemWidget(
                          onPressed: ()=>controller.pillPressed(controller.pillItemModels.indexOf(element)),
                          model: element, isEdit: controller.isEdit.value,
                          checked: controller.checkedPills[controller.pillItemModels.indexOf(element)],))
                  ],
                )),
          ),
          Obx(()=>controller.isEdit.value ?
              Positioned(
                bottom: AppSizes.w1 * 14,
                right: AppSizes.w1 * 16,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){controller.addTaped.value=false;},
                  onTapCancel: (){controller.addTaped.value=false;},
                  onTapDown: (d){controller.addTaped.value=true;},
                  child: Opacity(
                    opacity: controller.addTaped.value ? 0.4 : 1,
                      child: Text("Удалить", style: AppTextStyles.pink17_w400,)
                  ),
                ),
              )
              :Positioned(
            bottom: AppSizes.w1 * 14,
            left: AppSizes.w1 * 32,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){controller.addTaped.value=false;controller.addTap();},
              onTapCancel: (){controller.addTaped.value=false;},
              onTapDown: (d){controller.addTaped.value=true;},
              child: Opacity(
                opacity: controller.addTaped.value ? 0.4 : 1,
                child: Row(
                  children: [
                    Container(
                      height: AppSizes.w1 * 18,
                      width: AppSizes.w1 * 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        border: Border.all(width: AppSizes.w1 * 1.5, color: AppColors.pink)
                      ),
                      child: Center(child: SvgPicture.asset("assets/images/plus_icon.svg", width: AppSizes.w1 * 8,),),
                    ),SizedBox(width: AppSizes.w1 * 12,),
                    Text("Добавить препарат", style: AppTextStyles.black16_w500,)
                  ],
                ),
              ),
            )
          ))
        ],
      ),
    );
  }

  showModalPopUp(){
    final actions = [
      CupertinoActionSheetAction(onPressed: (){
        controller.isEdit.value = true;Get.back();
      }, child: Text("Выбрать препараты...", style: AppTextStyles.pink17_w400,)),
      CupertinoActionSheetAction(onPressed: (){}, child: Text("Показать завершенные", style: AppTextStyles.pink17_w400,)),
    ];
    showCupertinoModalPopup(context: Get.context!, builder: (context){
      return CupertinoActionSheet(
        actions: actions,
        cancelButton: CupertinoActionSheetAction(onPressed: Get.back, child: Text("Отменить", style: AppTextStyles.pink17_w500,)),
      );
    });
  }
}
