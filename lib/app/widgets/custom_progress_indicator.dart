import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double value;

  CustomProgressIndicator({Key? key,this.value : 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
    enableLoadingAnimation: true,
      axes: [
        RadialAxis(
          showLabels: false,
          showTicks: false,
          startAngle: 140,
          endAngle: 40,
          radiusFactor: 1,
          canScaleToFit: true,
          axisLineStyle: AxisLineStyle(
            thickness: 0.17,
            color: AppColors.progressBackgroundColor,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              color: value>=70 ? AppColors.progressGood : value>=30 ? AppColors.progressMedium : AppColors.progressBad,
                value: value,
                width: 0.17,
                sizeUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.bothCurve)
          ],
          annotations: [
            GaugeAnnotation(
              widget: SvgPicture.asset("assets/images/person_icon.svg", height: AppSizes.w1 * 32,),
              angle: 270,
              positionFactor: 0.1
            )
          ]
        )
      ],
    );
  }
}
