import 'package:flutter/material.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';

class InputFrame extends StatelessWidget{
  final Widget? child;

  const InputFrame({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.w1 * 44,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w1 * 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12 * AppSizes.w1),
        border: Border.all(width: AppSizes.w1, color: AppColors.grey)
      ),
      child: child ?? SizedBox(),
    );
  }
}
