import '../../resources/exports/index.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: kToolbarHeight,
          left: 12,
          right: 12,
        ),
        child: Column(
          children: [
            Center(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.WELCOME_BACK_TO,
                      style: context.titleLarge.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      Strings.MOYENXPRESS,
                      style: context.headlineLarge.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SpaceH20(),
                    Text(
                      Strings.LOGIN_SUBTITLE,
                      style: context.titleLarge.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SpaceH40(),
                    const LoginForm(),
                    const SpaceH10(),
                    _buildSignUpAndForgotPassText(context),
                    const SpaceH20(),
                    CustomButton.solid(
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      text: Strings.SIGN_IN,
                      onTap: Get.back,
                      radius: Sizes.RADIUS_12,
                      constraints: const BoxConstraints(minHeight: 55),
                    ),
                    const SpaceH30(),
                  ],
                ),
              ),
            ).expanded(),
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
    );
  }

  Widget _buildSignUpAndForgotPassText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(Routes.SIGN_UP),
          child: Text(
            Strings.DO_NOT_HAVE_AN_ACCOUNT,
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.w300,
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ),
        Text(
          Strings.FORGOT_PASSWORD,
          style: context.titleLarge.copyWith(
            fontWeight: FontWeight.w300,
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryColor,
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
