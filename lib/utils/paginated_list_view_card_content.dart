// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../resources/exports/index.dart';

class PaginatedListViewCardContent extends StatelessWidget {
  final ListViewModel item;
  final OnCardTap? onCardTap;
  final BoxFit? fit;
  final bool showRating;

  const PaginatedListViewCardContent({
    Key? key,
    required this.item,
    this.onCardTap,
    this.fit,
    required this.showRating,
  }) : super(key: key);

  String covertIntoKFormat(double amount) {
    return NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCardTap?.call(item.id ?? -1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              offset: const Offset(0.0, 4.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CustomImageWidget(
                        borderRadius: 0.0,
                        imageSize: double.maxFinite,
                        fit: fit,
                        imageUrl: item.image ?? "",
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Divider(
                        color: Colors.grey.shade100,
                        indent: 0,
                        endIndent: 0,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.PADDING_6,
                  vertical: 2.0,
                ),
                child: Text(
                  item.title ?? "-",
                  style: context.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "\$${covertIntoKFormat(item.price ?? 0.0)}",
                      style: context.labelMedium.copyWith(
                        color: item.discountPer != null
                            ? AppColors.disabled
                            : AppColors.primaryColor,
                        decoration: item.discountPer != null
                            ? TextDecoration.lineThrough
                            : null,
                        decorationColor: item.discountPer != null
                            ? AppColors.disabled
                            : null,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SpaceW12(),
                    if (item.discountPer != null) ...[
                      Text(
                        "\$${covertIntoKFormat(GlobalHelper.getDiscountPice(item.price ?? 0.0, item.discountPer ?? 0))}",
                        style: context.labelMedium.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (item.rating != null && showRating) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: StarRating(rating: item.rating ?? 0.0, iconSize: 15),
                ),
              ],
              const SpaceH4(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                child: Row(
                  children: [
                    CustomButton.solid(
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      text: Strings.ADD_TO_CART,
                      onTap: () => onCardTap?.call(item.id ?? -1),
                      radius: Sizes.RADIUS_4,
                      constraints: const BoxConstraints(minHeight: 55),
                    ).expanded(flex: 3),
                    const SpaceW4(),
                    CustomButton.solid(
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      onTap: Get.back,
                      radius: Sizes.RADIUS_6,
                      constraints: const BoxConstraints(minHeight: 55),
                      child: const Icon(
                        Icons.favorite_outline,
                        color: AppColors.white,
                      ),
                    ).expanded(),
                  ],
                ),
              ).flexible(),
              const SpaceH4(),
            ],
          ),
        ),
      ),
    );
  }
}
