import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:road_runner_driver/app.dart';
import 'package:road_runner_driver/home/home.dart';
import 'package:road_runner_driver/shared/shared.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute(
        builder: (_) => const LogIn(),
      );

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool visibility = false;
  bool rememberMe = true;
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
              children: [
                Center(
                    child: Text(
                  'Log In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32 * ScreenRatio.widthRatio,
                  ),
                )),
                SizedBox(height: 32 * ScreenRatio.heightRatio),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.fluentBlue
                            : AppColors.faintGrey,
                    fontSize: 18 * ScreenRatio.widthRatio,
                  ),
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppTextField(
                  title: 'Email Address or Phone Number',
                  isSecured: false,
                  onChanged: (String val) {},
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppTextField(
                  title: 'Password',
                  isSecured: true,
                  visibility: visibility,
                  onChanged: (String val) {},
                  toggleVisibility: () {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                ),
                SizedBox(height: 16 * ScreenRatio.heightRatio),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SecondaryButton2(
                      context,
                      title: 'Forgot Password?',
                      width: 180 * ScreenRatio.widthRatio,
                      onTap: (_, __, ___) {
                        context.showAppDialog(
                            AppTextInputDialog(
                              title: 'Reset Password',
                              subTitle:
                                  'Enter email address to receive reset link',
                              inputTitle: 'Email Address',
                              buttonTitle: 'Send Link',
                              onTap: (start, stop, state) async {
                                start();
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                context.pop();

                                context.showAppDialog(
                                    AppInformationDialog(
                                      title: 'Link Sent To Your Email Address',
                                      subTitle:
                                          'You will receive a link shortly',
                                      illustration: AppIllustrations.mail,
                                      onClose: () {
                                        context.pop();
                                      },
                                    ),
                                    context: context);
                                stop();
                              },
                              onClose: () {
                                context.pop();
                              },
                            ),
                            context: context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 64 * ScreenRatio.heightRatio),
                AppCheckField(
                  title: 'Remember Me',
                  selected: rememberMe,
                  onSelected: (bool? val) {
                    setState(() {
                      rememberMe = !rememberMe;
                    });
                  },
                ),
                SizedBox(height: 150 * ScreenRatio.heightRatio),
                Center(
                  child: PrimaryButton(
                    title: 'Log In',
                    onTap: (load, stop, state) async {
                      load();
                      await Future.delayed(const Duration(seconds: 2));
                      context.pushAndRemoveUntil(SignUpPersonalDetails.route());
                      stop();
                    },
                  ),
                ),
                SizedBox(height: 16 * ScreenRatio.heightRatio),
                Center(
                  child: SecondaryButton(
                    context,
                    title: 'Sign Up',
                    onTap: (load, stop, state) async {
                      load();
                      await Future.delayed(const Duration(seconds: 2));
                      context.pushAndRemoveUntil(SignUpPersonalDetails.route());
                      stop();
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
