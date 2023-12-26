import '../../../resources/exports/index.dart';

class DashboardController extends GetxController {
  List<NavbarModel> navbarItems = [
    NavbarModel(icon: Icons.home_outlined, title: Strings.HOME),
    NavbarModel(icon: Icons.list, title: Strings.CATEGORIES),
    NavbarModel(icon: Icons.shopping_bag_outlined, title: Strings.CART),
    NavbarModel(icon: Icons.notifications_none, title: Strings.NOTIFICATION),
    NavbarModel(icon: Icons.person_outline, title: Strings.SIGN_IN),
  ];
}
