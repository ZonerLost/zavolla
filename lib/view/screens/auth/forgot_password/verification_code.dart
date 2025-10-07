import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_fonts.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/screens/auth/forgot_password/reset_password.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
import 'package:zavolla/view/widget/custom_scaffold_widget.dart';
import 'package:zavolla/view/widget/headings_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

import 'dart:async';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  Timer? _timer;
  int _seconds = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _seconds = 5);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds <= 1) {
        timer.cancel();
        setState(() => _seconds = 0);
      } else {
        setState(() => _seconds -= 1);
      }
    });
  }

  void _onResend() {
    Get.snackbar(
      'Verification',
      'Code resent',
      snackPosition: SnackPosition.BOTTOM,
      margin: AppSizes.DEFAULT,
    );
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final DEFAULT_THEME = PinTheme(
      width: 52,
      height: 52,
      margin: EdgeInsets.zero,
      textStyle: TextStyle(
        fontSize: 24,
        height: 0.0,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.CABIN,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kFillColor,
        border: Border.all(width: 1.0, color: kBorderColor),
      ),
    );
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
                  'Enter verification code that you received at hel***@gmail.com',
            ),
            LayoutLocker(
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Pinput(
                      length: 4,
                      separatorBuilder: (index) {
                        return SizedBox(width: 10);
                      },
                      onChanged: (value) {},
                      pinContentAlignment: Alignment.center,
                      defaultPinTheme: DEFAULT_THEME,
                      focusedPinTheme: DEFAULT_THEME.copyWith(
                        decoration: BoxDecoration(
                          color: kSecondaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1.0),
                        ),
                      ),
                      submittedPinTheme: DEFAULT_THEME.copyWith(
                        decoration: BoxDecoration(
                          color: kSecondaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1.0),
                        ),
                      ),
                      mainAxisAlignment: MainAxisAlignment.center,
                      onCompleted: (pin) => print(pin),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          textAlign: TextAlign.center,
                          text: 'Didn’t receive the code? ',
                          size: 16,
                          color: kQuaternaryColor,
                        ),
                        MyText(
                          onTap: _seconds == 0 ? _onResend : null,
                          textAlign: TextAlign.center,
                          text: _seconds == 0 ? 'Resend' : '(${_seconds}s)',
                          size: 16,
                          color: _seconds == 0 ? kBlueColor : kQuaternaryColor,
                          decoration:
                              _seconds == 0
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    MyBorderButton(
                      buttonText: 'Verify',
                      onTap: () {
                        Get.to(() => ResetPassword());
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
