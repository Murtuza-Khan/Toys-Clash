import '../../resources/exports/index.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceH16(),
            CustomCarouselSlider(sliderData: controller.sliderData),
            const SpaceH16(),
            _buildTitleAndSeeAll(
              context,
              title: Strings.SPORTS_OUTDOOR,
              onTap: () => Get.toNamed(Routes.CATEGORIES),
            ),
            const SpaceH16(),
            CustomFutureBuilder(
              future: controller.getHomeCategories(),
              customLoader: const HomeCategoriesShimmer(),
              hasDataBuilder: (context, snapshot) => HomeCategories(
                items: snapshot.data ?? [],
              ),
            ).constrainedBox(maxHeight: 130.0),
            const SpaceH16(),
            _buildTitleAndSeeAll(
              context,
              title: Strings.ALL_PRODUCTS,
              onTap: () => Get.toNamed(Routes.ALL_PRODUCTS),
            ),
            const HomeAllProducts(),
            const SpaceH40(),
            _buildTitleAndSeeAll(
              context,
              title: Strings.DAILY_DEALS,
              onTap: () => Get.toNamed(Routes.DAILY_DEALS),
            ),
            const HomeDailyDeals(),
            const SpaceH80(),
          ],
        ),
      ),
    );
  }

  Row _buildTitleAndSeeAll(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            title,
            style: context.headlineSmall,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                Strings.SEE_ALL,
                style: context.titleMedium.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
