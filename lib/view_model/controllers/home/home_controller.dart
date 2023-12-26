import '../../../dummy/all_products_data.dart';
import '../../../dummy/home_categories_data.dart';
import '../../../resources/exports/index.dart';

class HomeController extends GetxController {
  List<HomeCategoriesModel> homeCategories = [];
  List<ListViewModel> allProducts = ListViewModel.listFromJson(allProductsData);

  List<ListViewModel> dailyDeals = ListViewModel.listFromJson(allProductsData);
  CustomCarouselModel sliderData = CustomCarouselModel(
    data: [
      Image.asset(Assets.HOME_SLIDER, fit: BoxFit.cover),
      Image.asset(Assets.HOME_SLIDER, fit: BoxFit.cover),
      Image.asset(Assets.HOME_SLIDER, fit: BoxFit.cover),
    ],
  );

  Future<List<HomeCategoriesModel>> getHomeCategories() {
    return Future.delayed(const Duration(seconds: 3), () {
      return HomeCategoriesModel.listFromJson(homeCategoriesData);
    });
  }

  Future<List<ListViewModel>> getAllProducts() {
    return Future.delayed(const Duration(seconds: 3), () {
      return ListViewModel.listFromJson(allProductsData);
    });
  }

  Future<List<ListViewModel>> getDailyDeals() {
    return Future.delayed(const Duration(seconds: 3), () {
      return ListViewModel.listFromJson(allProductsData);
    });
  }
}
