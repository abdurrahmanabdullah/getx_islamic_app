import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/music_player/bindings/music_player_binding.dart';
import '../modules/music_player/views/music_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/theme/bindings/theme_binding.dart';
import '../modules/theme/views/theme_view.dart';
import '../modules/user_api/bindings/user_api_binding.dart';
import '../modules/user_api/views/user_api_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

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
        name: _Paths.USER_API,
        page: () => const UserApiView(),
        binding: UserApiBinding()),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.THEME,
      page: () => const ThemeView(),
      binding: ThemeBinding(),
    ),
  ];
}
