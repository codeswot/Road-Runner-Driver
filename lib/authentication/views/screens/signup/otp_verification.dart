import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import 'driver_specific/driver_specific.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({Key? key, required this.isEmail}) : super(key: key);

  final bool isEmail;
  static Route route({required bool isEmail}) => MaterialPageRoute(
        builder: (_) => OtpVerification(isEmail: isEmail),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.navyBlue
          : AppColors.tangoOrange,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 24 * ScreenRatio.widthRatio,
                vertical: 32 * ScreenRatio.heightRatio),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32 * ScreenRatio.widthRatio,
                  ),
                )),
                SizedBox(height: 32 * ScreenRatio.widthRatio),
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.flimsyGrey
                            : AppColors.ashlyGrey,
                    fontSize: 24 * ScreenRatio.heightRatio,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'A code has just been sent to your ${isEmail ? 'email address' : 'phone number'}',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.flimsyGrey
                            : AppColors.ashlyGrey,
                    fontSize: 14 * ScreenRatio.heightRatio,
                  ),
                ),
                SizedBox(height: 24 * ScreenRatio.widthRatio),
                AppTextField(
                  title: 'OTP',
                  onChanged: (String? val) {},
                ),
                SizedBox(height: 24 * ScreenRatio.widthRatio),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Didn’t receive a code?'),
                    SizedBox(width: 8 * ScreenRatio.widthRatio),
                    Center(
                      child: SizedBox(
                        width: 150 * ScreenRatio.widthRatio,
                        child: SecondaryButton2(
                          context,
                          title: 'Resend OTP',
                          width: 150 * ScreenRatio.widthRatio,
                          color: AppColors.solidOrange,
                          onTap: (start, stop, stare) async {
                            start();
                            await Future.delayed(const Duration(seconds: 2));
                            stop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 300 * ScreenRatio.widthRatio),
                Center(
                  child: PrimaryButton(
                    title: 'Continue',
                    onTap: (load, stop, state) async {
                      load();
                      await Future.delayed(const Duration(seconds: 2));
                      stop();
                      context.push(DocumentUploadDriver.route());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
