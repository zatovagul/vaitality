import 'package:flutter/material.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  CustomElevatedButton({Key? key, this.text:'', this.color:AppColors.pink, this.radius:12, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.w1 * 44,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius * AppSizes.w1))),
          onPressed: onPressed, child: Text(text, style: AppTextStyles.white14_w500,)
      ),
    );
  }
}
