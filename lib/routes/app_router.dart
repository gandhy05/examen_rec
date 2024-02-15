import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/pages/calendar_page.dart';
import 'package:movil_wrc_app/pages/dashboard_page.dart';
import 'package:movil_wrc_app/pages/drivers_page.dart';
import 'package:movil_wrc_app/pages/home_page.dart';

class AppRoutes {
  static String home = '/';
  static String calendar = '/calendar';
  static String dashboard = '/dashboard';
  static String drivers = '/drivers';
}

final routerProv = Provider((ref) => routerConfig);

final routerConfig = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: AppRoutes.home,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/calendar',
    name: AppRoutes.calendar,
    builder: (context, state) => const CalendarPage(),
  ),
  GoRoute(
    path: '/dashboard',
    name: AppRoutes.dashboard,
    builder: (context, state) => const DashboardPage(),
  ),
  GoRoute(
    path: '/drivers',
    name: AppRoutes.drivers,
    builder: (context, state) => const DriversPage(),
  ),
]);
