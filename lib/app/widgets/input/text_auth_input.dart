import 'package:flutter/material.dart';
import 'package:vaitality/app/widgets/input/input_frame.dart';
import 'package:vaitality/app/widgets/input/text_input.dart';

class TextAuthInput extends InputFrame {
  final TextEditingController? controller;
  final String? hint;

  TextAuthInput({this.controller, this.hint})
      : super(child:  Center(
          child: TextInput(
            hint: hint,
            controller: controller,
          ),
        ));
}
