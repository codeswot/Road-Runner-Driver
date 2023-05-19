import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:road_runner_driver/authentication/views/views.dart';
import 'package:road_runner_driver/shared/shared.dart';

class SignUpPersonalDetails extends StatefulWidget {
  const SignUpPersonalDetails({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const SignUpPersonalDetails(),
      );

  @override
  State<SignUpPersonalDetails> createState() => _SignUpPersonalDetailsState();
}

class _SignUpPersonalDetailsState extends State<SignUpPersonalDetails> {
  bool visibility = false;
  String value = stateOfResidence.first;
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
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32 * ScreenRatio.widthRatio,
                  ),
                )),
                SizedBox(height: 32 * ScreenRatio.heightRatio),
                Text(
                  'Personal Details',
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
                  title: 'Full Name',
                  isSecured: false,
                  onChanged: (String val) {},
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppTextField(
                  title: 'Email Address',
                  isSecured: false,
                  onChanged: (String val) {},
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppTextField(
                  title: 'Phone Number',
                  isSecured: false,
                  textInputType: TextInputType.phone,
                  onChanged: (String val) {},
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppDropdownField(
                  title: 'State Of Residence',
                  items: stateOfResidence
                      .map((e) => DropdownMenuItem<String>(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      value = value;
                    });
                  },
                  value: value,
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppTextField(
                  title: 'Password',
                  isSecured: true,
                  visibility: visibility,
                  toggleVisibility: () {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                  onChanged: (String val) {},
                ),
                SizedBox(height: 40 * ScreenRatio.heightRatio),
                Center(
                  child: PrimaryButton(
                    title: 'Continue',
                    onTap: (load, stop, state) async {
                      load();
                      await Future.delayed(const Duration(seconds: 2));
                      stop();

                      context.push(OtpTypeSelect.route());
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
