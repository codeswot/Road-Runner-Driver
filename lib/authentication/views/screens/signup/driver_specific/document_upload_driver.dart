import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:road_runner_driver/authentication/views/views.dart';
import 'package:road_runner_driver/shared/shared.dart';

class DocumentUploadDriver extends StatelessWidget {
  const DocumentUploadDriver({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute(
        builder: (_) => const DocumentUploadDriver(),
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
                  'Driver Verification',
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
                  'Document upload',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.flimsyGrey
                            : AppColors.ashlyGrey,
                    fontSize: 14 * ScreenRatio.heightRatio,
                  ),
                ),
                SizedBox(height: 24 * ScreenRatio.widthRatio),
                const AppDocumentField(title: 'Drivers License'),
                SizedBox(height: 49 * ScreenRatio.widthRatio),
                const AppImageField(),
                SizedBox(height: 200 * ScreenRatio.widthRatio),
                Center(
                  child: PrimaryButton(
                    title: 'Continue',
                    onTap: (load, stop, state) async {
                      load();
                      await Future.delayed(const Duration(seconds: 2));
                      context.push(DocumentUploadVehicle.route());
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
