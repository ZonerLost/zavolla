import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
import 'package:zavolla/view/widget/custom_scaffold_widget.dart';
import 'package:zavolla/view/widget/headings_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
              title: 'New Password',
              subTitle: 'Set a new password for your account.',
            ),
            LayoutLocker(
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyTextField(
                      labelText: 'New Password',
                      hintText: 'Password',
                      isObSecure: true,
                    ),
                    MyTextField(
                      labelText: 'Confirm Password',
                      hintText: 'Password',
                      isObSecure: true,
                      marginBottom: 25,
                    ),
                    MyBorderButton(buttonText: 'Done', onTap: () {}),
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
