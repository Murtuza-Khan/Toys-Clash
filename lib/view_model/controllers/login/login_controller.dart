import '../../../resources/exports/index.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> loginFormKey;
  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;
  RxBool isPasswordVisible = false.obs;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onInit() {
    loginFormKey = GlobalKey<FormState>();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }
}
