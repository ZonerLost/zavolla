import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/screens/auth/signup/email_verification.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
import 'package:zavolla/view/widget/custom_scaffold_widget.dart';
import 'package:zavolla/view/widget/headings_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';
import 'package:zavolla/view/widget/social_login_%20widget.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            AuthHeading(
              mT: 100,
              title: 'Create Account',
              subTitle: 'Sign up to manage your business with BizPoint.',
            ),
            LayoutLocker(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Sign Up',
                          size: 24,
                          textAlign: TextAlign.center,
                          weight: FontWeight.w700,
                          paddingBottom: 30,
                        ),
                        MyTextField(
                          labelText: 'Full Name',
                          hintText: 'Your full name',
                        ),
                        MyTextField(
                          labelText: 'Mail Address',
                          hintText: 'Your email',
                        ),
                        MyTextField(
                          labelText: 'Password',
                          hintText: 'Password',
                          isObSecure: true,
                        ),
                        MyTextField(
                          labelText: 'Confirm Password',
                          hintText: 'Password',
                          isObSecure: true,
                          marginBottom: 25,
                        ),

                        MyBorderButton(
                          buttonText: 'Next',
                          onTap: () {
                            Get.to(() => EmailVerification());
                          },
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              textAlign: TextAlign.center,
                              text: 'Already have an Account? ',
                              size: 16,
                              color: kQuaternaryColor,
                            ),
                            MyText(
                              onTap: () {
                                Get.back();
                              },
                              textAlign: TextAlign.center,
                              text: 'Login',
                              size: 16,
                              color: kBlueColor,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SocialLogin(
                          icon: Assets.imagesEmail,
                          title: 'Mail',
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SocialLogin(
                          icon: Assets.imagesApple,
                          title: 'Continue with Apple',
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SocialLogin(
                          icon: Assets.imagesGoogle,
                          title: 'Continue with Google',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
