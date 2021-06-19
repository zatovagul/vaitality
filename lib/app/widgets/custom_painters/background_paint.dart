import 'package:flutter/material.dart';
import 'package:vaitality/app/constants/app_colors.dart';

class BackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = AppColors.backgroundLineColor;

    final heightLine = height ~/ 30; // your Horizontal line
    final widthLine = (width ~/ 15); // your Vertical line

    for(int i = 1 ; i < height ; i++){
      if(i % heightLine == 0){
        Path linePath = Path();
        linePath.addRect(Rect.fromLTRB(0, i.toDouble(), width, (i+1).toDouble()));
        canvas.drawPath(linePath, paint);
      }
    }
    for(int i = 1 ; i < width ; i++){
      if(i % widthLine == 0){
        Path linePath = Path();
        linePath.addRect(Rect.fromLTRB(i.toDouble(), 0 , (i+1).toDouble(), height));
        canvas.drawPath(linePath, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}