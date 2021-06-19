import 'package:get/get.dart';

import 'package:vaitality/app/modules/home/bindings/home_binding.dart';
import 'package:vaitality/app/modules/home/login/bindings/login_binding.dart';
import 'package:vaitality/app/modules/home/login/views/login_view.dart';
import 'package:vaitality/app/modules/home/registration/bindings/registration_binding.dart';
import 'package:vaitality/app/modules/home/registration/views/registration_view.dart';
import 'package:vaitality/app/modules/home/views/home_view.dart';
import 'package:vaitality/app/modules/main_page/bindings/main_page_binding.dart';
import 'package:vaitality/app/modules/main_page/health_scan/bindings/health_scan_binding.dart';
import 'package:vaitality/app/modules/main_page/health_scan/views/health_scan_view.dart';
import 'package:vaitality/app/modules/main_page/pill_page/bindings/pill_page_binding.dart';
import 'package:vaitality/app/modules/main_page/pill_page/views/pill_page_view.dart';
import 'package:vaitality/app/modules/main_page/settings_page/bindings/settings_page_binding.dart';
import 'package:vaitality/app/modules/main_page/settings_page/views/settings_page_view.dart';
import 'package:vaitality/app/modules/main_page/views/main_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.REGISTRATION,
          page: () => RegistrationView(),
          binding: RegistrationBinding(),
        ),
        GetPage(
          name: _Paths.LOGIN,
          page: () => LoginView(),
          binding: LoginBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => MainPageView(),
      binding: MainPageBinding(),
      children: [
        GetPage(
          name: _Paths.HEALTH_SCAN,
          page: () => HealthScanView(),
          binding: HealthScanBinding(),
        ),
        GetPage(
          name: _Paths.PILL_PAGE,
          page: () => PillPageView(),
          binding: PillPageBinding(),
        ),
        GetPage(
          name: _Paths.SETTINGS_PAGE,
          page: () => SettingsPageView(),
          binding: SettingsPageBinding(),
        ),
      ],
    ),
  ];
}
