import 'package:flutter/material.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color color;
  final double radius;
  final VoidCallback onPressed;
  final bool isBorder;

  CustomTextButton({Key? key, this.text:'', this.color:AppColors.lightGrey, this.radius:12, required this.onPressed, this.isBorder:true, this.textStyle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.w1 * 44,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius * AppSizes.w1),
        color: !isBorder ? color : null,
        border:isBorder ? Border.all(color: color, width: AppSizes.w1) : null,
      ),
      child: TextButton(
        style: TextButton.styleFrom(primary: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        onPressed: onPressed,
        child: Text(text,style:textStyle?? AppTextStyles.lightGrey14_w500,),
      ),
    );
  }
}
