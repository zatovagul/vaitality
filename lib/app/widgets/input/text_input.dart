import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final MaskTextInputFormatter? maskFormatter;
  final Function(String n)? onChanged;

  TextInput({Key? key, this.controller, this.hint, this.obscureText:false, this.keyboardType:TextInputType.text, this.maskFormatter, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: AppTextStyles.black17_w400,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters:maskFormatter!=null ? [maskFormatter!]:[],
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.lightGrey17_w400,
        border: InputBorder.none,
        isDense: true,
      ),
    );
  }
}
