import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';
import 'package:vaitality/app/routes/app_pages.dart';
import 'package:vaitality/app/widgets/buttons/custom_elevatedbutton.dart';
import 'package:vaitality/app/widgets/buttons/custom_text_button.dart';
import 'package:vaitality/app/widgets/custom_appbar.dart';
import 'package:vaitality/app/widgets/input/password_auth_input.dart';
import 'package:vaitality/app/widgets/input/phone_auth_input.dart';
import 'package:vaitality/app/widgets/input/text_auth_input.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Регистрация",),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w1 * 16),
        child: ListView(
          children: [
            SizedBox(height: AppSizes.w1 * 29,),
            TextAuthInput(hint: "Имя",controller: controller.nameController.value,),
            SizedBox(height: AppSizes.w1 * 16,),
            TextAuthInput(hint: "Фамилия",controller: controller.surnameController.value,),
            SizedBox(height: AppSizes.w1 * 16,),
            PhoneAuthInput(phoneController: controller.phoneController.value),
            SizedBox(height: AppSizes.w1 * 16,),
            Obx(()=>PasswordAuthInput(controller: controller.passwordController.value,onEyePressed:controller.switchShowPassword,showPassword: controller.showPassword.value,)),
            Padding(
                padding: EdgeInsets.only(left: AppSizes.w1 * 19, top: AppSizes.w1 * 8),
              child: Text("Минимум 5 символов", style: AppTextStyles.grey15_w300,),
            ),
            SizedBox(height: AppSizes.w1 * 10,),
            CustomElevatedButton(
              onPressed: (){},
              text: "зарегистрироваться".toUpperCase(),
            ),SizedBox(height: AppSizes.w1 * 15,),
            Column(
              children: [
                Text("Регистрируясь, вы соглашаетесь", style: AppTextStyles.grey15_w300,),
                InkWell(
                  onTap: (){},
                    child: Text("с условиями использования", style: AppTextStyles.black15_w300,)
                )
              ],
            ),SizedBox(height: AppSizes.w1 * 15,),
            Container(height: AppSizes.w1 * 1, width: double.infinity, color: AppColors.lightGrey,),
            SizedBox(height: AppSizes.w1 * 19,),
            CustomTextButton(onPressed: ()=>Get.offNamed(Routes.LOGIN), text: "Вход".toUpperCase(),)
          ],
        ),
      ),
    );
  }
}
