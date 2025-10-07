import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/screens/auth/forgot_password/verification_code.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
import 'package:zavolla/view/widget/custom_scaffold_widget.dart';
import 'package:zavolla/view/widget/headings_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
              title: 'Forgot Password',
              subTitle:
                  "Enter your email. We'll send a verification code to reset your password.",
            ),

            LayoutLocker(
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyTextField(
                      labelText: 'Mail Address',
                      hintText: 'Your email',
                      marginBottom: 25,
                    ),
                    MyBorderButton(
                      buttonText: 'Send',
                      onTap: () {
                        Get.to(() => VerificationCode());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
