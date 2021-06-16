import 'package:flutter/material.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/widgets/input/input_frame.dart';
import 'package:vaitality/app/widgets/input/text_input.dart';

class PasswordAuthInput extends InputFrame {
  final bool showPassword;
  final TextEditingController? controller;
  final VoidCallback onEyePressed;

  PasswordAuthInput({this.showPassword:false, this.controller,required this.onEyePressed}):
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextInput(
                  controller: controller,
                  hint: "Пароль",
                  obscureText: !showPassword,
                ),
              ),
              IconButton(onPressed: onEyePressed,
                  icon: Icon(
                    Icons.remove_red_eye_outlined, size: AppSizes.w1 * 22,
                    color: showPassword ? AppColors.pink : AppColors.grey,))
            ],
          )
        );
}
