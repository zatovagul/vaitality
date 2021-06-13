import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
