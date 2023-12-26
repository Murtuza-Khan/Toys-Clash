import '../../resources/exports/index.dart';

class DailyDeals extends GetView<HomeController> {
  const DailyDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Strings.DAILY_DEALS),
      body: PaginatedListView(
        dummyData: controller.allProducts,
        onCardTap: (id) => log.f(id),
      ),
    );
  }
}
