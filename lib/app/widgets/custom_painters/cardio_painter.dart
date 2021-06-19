import 'package:flutter/material.dart';
import 'package:vaitality/app/constants/app_colors.dart';

class CardioPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.pink
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var path = Path();
    final h = size.height, w = size.width;
    final h1 = h/40, w1 = w/40;
    path.moveTo(0, size.height / 2);

    int i=0;
    movePath(path, w1, h1, i);
    i=20;movePath(path, w1, h1, i);



   // path.lineTo(size.width/2, size.height / 2);
    canvas.drawPath(path, paint);
  }
  movePath(path, w1, h1, i){
    path.lineTo(w1*(i+3), h1*20);
    path.lineTo(w1*(i+4), h1*18);
    path.lineTo(w1*(i+5), h1*20);
    path.lineTo(w1*(i+6.5),h1*20.2);
    path.lineTo(w1*(i+7), h1*22);
    path.lineTo(w1*(i+8), h1*10);
    path.lineTo(w1*(i+9), h1*23);
    path.lineTo(w1*(i+10), h1*20);
    path.lineTo(w1*(i+12), h1*20);
    path.lineTo(w1*(i+13.5), h1*15);
    path.lineTo(w1*(i+14), h1*22);
    path.lineTo(w1*(i+15.5), h1*20);
    path.lineTo(w1*(i+20), h1*20);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate!=this;
  }

}