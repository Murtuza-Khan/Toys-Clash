import '../../resources/exports/index.dart';

class AllProducts extends GetView<HomeController> {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Strings.ALL_PRODUCTS),
      body: PaginatedListView(
        dummyData: controller.allProducts,
        onCardTap: (id) => log.f(id),
      ),
    );
  }
}
