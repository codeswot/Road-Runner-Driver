import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import 'otp_verification.dart';

class OtpTypeSelect extends StatefulWidget {
  const OtpTypeSelect({Key? key, required this.userType}) : super(key: key);

  final UserType userType;
  static Route route({required UserType userType}) => MaterialPageRoute(
        builder: (_) => OtpTypeSelect(userType: userType),
      );

  @override
  State<OtpTypeSelect> createState() => _OtpTypeSelectState();
}

class _OtpTypeSelectState extends State<OtpTypeSelect> {
  bool isEmail = true;
  bool isPhone = false;
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark
                            ? AppColors.flimsyGrey
                            : AppColors.ashlyGrey,
                        fontSize: 24 * ScreenRatio.heightRatio,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Choose where you want to receive a code.',
                      style: TextStyle(
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark
                            ? AppColors.flimsyGrey
                            : AppColors.ashlyGrey,
                        fontSize: 14 * ScreenRatio.heightRatio,
                      ),
                    ),
                    SizedBox(height: 24 * ScreenRatio.widthRatio),
                    AppRadioField(
                      selected: isEmail,
                      icon: Icons.email_outlined,
                      title: 'Email Address',
                      onSelected: (bool? val) {
                        setState(() {
                          val = true;
                          isEmail = val!;
                          isPhone = false;
                        });
                      },
                    ),
                    SizedBox(height: 24 * ScreenRatio.widthRatio),
                    AppRadioField(
                      icon: Icons.phone_android_sharp,
                      title: 'Text Message',
                      selected: isPhone,
                      onSelected: (bool? val) {
                        setState(() {
                          val = true;
                          isPhone = val!;
                          isEmail = false;
                        });
                      },
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
                      //send to valid type use (isEmail)
                      stop();

                      context.push(OtpVerification.route(
                          userType: widget.userType, isEmail: isEmail));
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
