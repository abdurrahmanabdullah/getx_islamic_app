import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/firebase_crud/bindings/firebase_crud_binding.dart';
import '../modules/firebase_crud/views/firebase_crud_view.dart';
import '../modules/music_player/bindings/music_player_binding.dart';
import '../modules/music_player/views/music_view.dart';
import '../modules/notelist_sqlite/bindings/notelist_sqlite_binding.dart';
import '../modules/notelist_sqlite/views/note_details_view.dart';
import '../modules/notelist_sqlite/views/notelist_sqlite_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/sqlite_database_crud/bindings/sqlite_database_crud_binding.dart';
import '../modules/sqlite_database_crud/views/sqlite_database_crud_view.dart';
import '../modules/theme/bindings/theme_binding.dart';
import '../modules/theme/views/theme_view.dart';
import '../modules/user_api/bindings/user_api_binding.dart';
import '../modules/user_api/views/user_api_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SQLITE_DATABASE_CRUD;

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
    GetPage(
      name: _Paths.FIREBASE_CRUD,
      page: () => const FirebaseCrudView(),
      binding: FirebaseCrudBinding(),
    ),
    GetPage(
      name: _Paths.SQLITE_DATABASE_CRUD,
      page: () => const SqliteDatabaseCrudView(),
      binding: SqliteDatabaseCrudBinding(),
    ),
    GetPage(
      name: _Paths.NOTELIST_SQLITE,
      page: () => const NotelistSqliteView(),
      binding: NotelistSqliteBinding(),
    ),
    GetPage(
      name: _Paths.NOTE_DETAILS,
      page: () => NoteDetailsView(),
      binding: NotelistSqliteBinding(),
    ),
  ];
}
