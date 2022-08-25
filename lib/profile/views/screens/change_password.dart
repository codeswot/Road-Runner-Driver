import 'package:flutter/material.dart';
import 'package:road_runner_driver/shared/shared.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute(
        builder: (_) => const ChangePassword(),
      );

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isVisible = false;
  bool isNewVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Change Password',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50 * ScreenRatio.heightRatio,
            horizontal: 24 * ScreenRatio.heightRatio,
          ),
          child: Column(
            children: [
              AppTextField(
                title: 'Old Password',
                onChanged: (String? val) {},
                isSecured: true,
                visibility: isVisible,
                toggleVisibility: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              ),
              SizedBox(height: 24 * ScreenRatio.heightRatio),
              AppTextField(
                title: 'New Password',
                isSecured: true,
                visibility: isNewVisible,
                toggleVisibility: () {
                  setState(() {
                    isNewVisible = !isNewVisible;
                  });
                },
                onChanged: (String? val) {},
              ),
              SizedBox(height: 24 * ScreenRatio.heightRatio),
              AppTextField(
                title: 'Repeat New Password',
                isSecured: true,
                visibility: isNewVisible,
                onChanged: (String? val) {},
              ),
              SizedBox(height: 44 * ScreenRatio.heightRatio),
              Center(
                child: PrimaryButton(
                  title: 'Save Changes',
                  onTap: (start, stop, state) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
