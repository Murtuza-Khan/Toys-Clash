import '../../../resources/exports/index.dart';

class OnBoardingController extends GetxController {
  late PageController pageCtrl;

  void onNext() {
    if (pageCtrl.page == 2) {
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      pageCtrl.nextPage(
        duration: Durations.medium3,
        curve: Curves.linear,
      );
      update(["update_on_boarding_screen"]);
    }
  }

  void onSkip() {}

  @override
  void onInit() {
    pageCtrl = PageController(initialPage: 0);
    super.onInit();
  }
}
