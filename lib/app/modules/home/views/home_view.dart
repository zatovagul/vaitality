import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';
import 'package:vaitality/app/routes/app_pages.dart';
import 'package:vaitality/app/widgets/buttons/custom_elevatedbutton.dart';
import 'package:vaitality/app/widgets/buttons/custom_text_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/images/vaitality_icon.svg', width: AppSizes.w1*191,height: AppSizes.h1*152,),
                    SizedBox(height: AppSizes.h1*15,),
                    SvgPicture.asset('assets/images/vaitality_text.svg', width: AppSizes.w1*170,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.w1 * 16),
              child: Column(
                children: [
                  CustomElevatedButton(
                    onPressed: ()=>Get.toNamed(Routes.LOGIN),
                    text: "ВХОД",
                  ),
                  SizedBox(height: AppSizes.h1*15,),
                  CustomTextButton(
                      onPressed: ()=>Get.toNamed(Routes.REGISTRATION),
                    text: "РЕГИСТРАЦИЯ",
                    color: AppColors.lightGrey,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
