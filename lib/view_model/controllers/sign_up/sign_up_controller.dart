import '../../../resources/exports/index.dart';

class SignUpController extends GetxController {
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController passwordCtrl;
  late TextEditingController confirmPassCtrl;
  late GlobalKey<FormState> signUpFormKey;

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPassword() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  @override
  void onInit() {
    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    confirmPassCtrl = TextEditingController();
    signUpFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    confirmPassCtrl.dispose();
    super.onClose();
  }
}
