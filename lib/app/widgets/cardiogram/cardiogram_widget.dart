import 'package:flutter/material.dart';
import 'package:vaitality/app/widgets/custom_painters/cardio_painter.dart';

class CardiogramWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CardioPainter(),
      child: Container(
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
