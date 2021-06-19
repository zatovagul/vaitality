import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_page_controller.dart';

class SettingsPageView extends GetView<SettingsPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
