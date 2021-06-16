import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  RxBool showPassword = false.obs;
  Rx<TextEditingController> nameController = _textController(),
      surnameController=_textController(), passwordController=_textController(),
  phoneController = _textController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  switchShowPassword()=>showPassword.value = !showPassword.value;
}

_textController([String s=""])=>TextEditingController(text: s).obs;
