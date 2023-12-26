import '../../resources/exports/index.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        appBar: _buildAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildNavigator().expanded()],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Navigator _buildNavigator() {
    return Navigator(
      key: Get.nestedKey(Strings.GET_NESTED_KEY_1),
      onGenerateRoute: Pages.onGenerateRoute,
      initialRoute: Routes.HOME,
    );
  }

  CustomShadow _buildBottomNavigationBar(BuildContext context) {
    return CustomShadow(
      offset: const Offset(0.0, -2.0),
      color: AppColors.black.withOpacity(0.2),
      child: ClipPath(
        clipper: NavBarClipper(),
        child: Container(
          width: double.maxFinite,
          height: 100.0,
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              controller.navbarItems.length,
              (index) => controller.navbarItems[index].title == Strings.CART
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            controller.navbarItems[index].icon,
                            color: AppColors.white,
                            size: 40,
                          ),
                        ),
                        const SpaceH4(),
                        Text(
                          controller.navbarItems[index].title,
                          style: context.bodyMedium,
                        ),
                        const SpaceH8(),
                      ],
                    )
                  : _buildNavbarItem(context, controller.navbarItems[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavbarItem(BuildContext context, NavbarModel item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(item.icon, color: AppColors.black, size: 30),
        Text(item.title, style: context.bodyMedium),
        const SpaceH8(),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leadingWidth: 150.0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Image.asset(Assets.LOGO),
      ),
      actions: const [
        Icon(
          EneftyIcons.search_normal_outline,
          color: AppColors.black,
          size: 35.0,
        ),
        SpaceW10(),
        Icon(
          Icons.menu,
          color: AppColors.black,
          size: 35.0,
        ),
        SpaceW10(),
      ],
    );
  }
}
