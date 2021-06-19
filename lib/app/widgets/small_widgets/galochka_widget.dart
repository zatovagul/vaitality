import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';

class GalochkaWidget extends StatelessWidget {
  final double radiusx;
  final bool checked;

  const GalochkaWidget({Key? key, this.radiusx : 24, this.checked:false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.w1 * radiusx,
      width: AppSizes.w1 * radiusx,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        border: Border.all(width: AppSizes.w1 * 1, color: AppColors.pink)
      ),
      child:checked ? Center(
        child: SvgPicture.asset("assets/images/galochka.svg", width: AppSizes.w1 * (radiusx - 10),),
      ) : SizedBox(),
    );
  }
}

class CustomRadioWidget extends StatelessWidget {
  final bool checked;

  const CustomRadioWidget({Key? key, this.checked:false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.w1 * 18,
      width: AppSizes.w1 * 18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          border: Border.all(width: AppSizes.w1 * 1, color: AppColors.pink)
      ),
      child:checked ? Center(
        child: Container(
          height: AppSizes.w1 * 12,
          width: AppSizes.w1 * 12,
          decoration: BoxDecoration(color: AppColors.pink, borderRadius: BorderRadius.circular(90)),
        ),
      ) : SizedBox(),
    );
  }
}

