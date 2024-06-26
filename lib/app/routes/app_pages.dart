import 'package:get/get.dart';
import 'package:islamic_app/app/modules/dashboard/views/registe_view.dart';
import 'package:islamic_app/app/modules/music_player/bindings/music_player_binding.dart';
import 'package:islamic_app/app/modules/music_player/views/music_view.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const MusicView(),
      binding: MusicPlayerBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.REGISTE, // Add this entry
      page: () => RegisteView(),
    ),
  ];
}