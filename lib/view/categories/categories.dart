import '../../resources/exports/index.dart';

class Categories extends GetView<HomeController> {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Strings.CATEGORIES),
      body: CustomFutureBuilder(
        customLoader: const CategoriesShimmer(),
        future: controller.getHomeCategories(),
        hasDataBuilder: (context, snapshot) => _buildCategories(
          snapshot.data ?? [],
        ),
      ),
    );
  }

  Widget _buildCategories(List<HomeCategoriesModel> items) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        addRepaintBoundaries: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 150.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) => _buildCategory(context, items[index]),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, HomeCategoriesModel item) {
    return Column(
      children: [
        Container(
          height: 90.0,
          width: 90.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                offset: const Offset(0.0, 4.0),
                blurRadius: 6.0,
              )
            ],
          ),
          child: Image.asset(item.image ?? ""),
        ),
        const SpaceH12(),
        Text(
          item.title ?? "",
          style: context.titleMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ).constrainedBox(maxWidth: 90),
      ],
    );
  }
}
