import 'package:flutter/material.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';

class CustomAppBar extends AppBar {
  final String text;
  final List<Widget>? actions;

  CustomAppBar({Key? key,required this.text, this.actions}) : super(
      key: key,
    title: Text(text, style: AppTextStyles.black17_w500,),
    centerTitle: true,
    actions: actions
  );
}
