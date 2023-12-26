import 'package:moyen_express/resources/exports/index.dart';

class Pages {
  static Transition get _routeTransition => Transition.rightToLeft;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Get.routing.args = settings.arguments;
    switch (settings.name) {
      case Routes.OFFLINE:
        return GetPageRoute(
          page: () => const OfflineScreen(),
          transition: _routeTransition,
        );
      case Routes.ONBOARDING:
        return GetPageRoute(
          page: () => const OnBoarding(),
          binding: OnBoardingBinding(),
          transition: _routeTransition,
        );
      case Routes.DASHBOARD:
        return GetPageRoute(
          page: () => const Dashboard(),
          binding: DashboardBinding(),
          transition: _routeTransition,
        );
      case Routes.LOGIN:
        return GetPageRoute(
          page: () => const Login(),
          binding: LoginBinding(),
          transition: _routeTransition,
        );
      case Routes.SIGN_UP:
        return GetPageRoute(
          page: () => const SignUp(),
          binding: SignUpBinding(),
          transition: _routeTransition,
        );
      case Routes.HOME:
        return GetPageRoute(
          page: () => const Home(),
          binding: HomeBinding(),
          transition: _routeTransition,
        );
      case Routes.CATEGORIES:
        return GetPageRoute(
          page: () => const Categories(),
          binding: HomeBinding(),
          transition: _routeTransition,
        );
      case Routes.ALL_PRODUCTS:
        return GetPageRoute(
          page: () => const AllProducts(),
          binding: HomeBinding(),
          transition: _routeTransition,
        );
      case Routes.DAILY_DEALS:
        return GetPageRoute(
          page: () => const DailyDeals(),
          binding: HomeBinding(),
          transition: _routeTransition,
        );

      default:
        return null;
    }
  }
}
