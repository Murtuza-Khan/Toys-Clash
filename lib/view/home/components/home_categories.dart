import '../../../resources/exports/index.dart';

class HomeCategories extends GetView<HomeController> {
  final List<HomeCategoriesModel> items;
  const HomeCategories({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      itemCount: items.length > 8 ? 8 : items.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => _buildCategory(context, items[index]),
      separatorBuilder: (_, __) => const SpaceW12(),
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
        ),
      ],
    );
  }
}
