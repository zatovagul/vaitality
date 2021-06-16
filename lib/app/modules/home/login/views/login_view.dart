import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';
import 'package:vaitality/app/routes/app_pages.dart';
import 'package:vaitality/app/widgets/buttons/custom_elevatedbutton.dart';
import 'package:vaitality/app/widgets/buttons/custom_text_button.dart';
import 'package:vaitality/app/widgets/custom_appbar.dart';
import 'package:vaitality/app/widgets/input/input_frame.dart';
import 'package:vaitality/app/widgets/input/password_auth_input.dart';
import 'package:vaitality/app/widgets/input/phone_auth_input.dart';
import 'package:vaitality/app/widgets/input/text_auth_input.dart';
import 'package:vaitality/app/widgets/input/text_input.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Вход",),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w1 * 16),
        child: ListView(
          children: [
            SizedBox(height: AppSizes.w1 * 29,),
            PhoneAuthInput(phoneController: controller.phoneController.value),
            SizedBox(height: AppSizes.w1 * 16,),
            Obx(()=>PasswordAuthInput(onEyePressed: controller.switchPassword, showPassword: controller.showPassword.value,)),
            SizedBox(height: AppSizes.w1 * 16,),
            CustomElevatedButton(onPressed: (){}, text: "ВОЙТИ",),
            SizedBox(height: AppSizes.w1 * 15),
            Center(child: InkWell(onTap:(){},child: Text("Забыли пароль?", style: AppTextStyles.black15_w300,)),),
            SizedBox(height: AppSizes.w1 * 15),
            Container(height: AppSizes.w1 * 1, width: double.infinity, color: AppColors.lightGrey,),
            SizedBox(height: AppSizes.w1 * 25),
            CustomTextButton(onPressed: ()=>Get.offNamed(Routes.REGISTRATION),text: "РЕГИСТРАЦИЯ",)
          ],
        ),
      ),
    );
  }
}
