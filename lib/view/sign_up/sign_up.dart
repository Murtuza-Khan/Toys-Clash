import '../../resources/exports/index.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Get.back,
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.LETS_GET,
                style: context.titleLarge.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                Strings.STARTED,
                style: context.headlineLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                Strings.SIGN_UP_SUBTITLE,
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SpaceH30(),
              const SignUpForm(),
              const SpaceH20(),
              CustomButton.solid(
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
                text: Strings.SIGN_UP,
                onTap: Get.back,
                radius: Sizes.RADIUS_12,
                constraints: const BoxConstraints(minHeight: 55),
              ),
              SizedBox(height: Get.height * 0.1),
              Align(
                alignment: Alignment.bottomCenter,
                child: SocialLoginButtons(
                  socialLoginBtns: AuthenticationHelper.socialLoginBtns,
                ),
              ),
              const SpaceH30(),
            ],
          ),
        ),
      ),
    );
  }
}
