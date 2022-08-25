import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_runner_driver/shared/shared.dart';

class AppMediaPickerBottomSheet extends StatelessWidget {
  const AppMediaPickerBottomSheet({Key? key, this.onCameraTap, this.onFileTap})
      : super(key: key);
  final VoidCallback? onFileTap;
  final VoidCallback? onCameraTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      height: 5 * ScreenRatio.heightRatio + ScreenRatio.absoluteHeight / 6,
      child: Column(children: [
        SizedBox(height: 10 * ScreenRatio.heightRatio),
        ListTile(
          leading: const Icon(Icons.file_copy),
          title: const Text('Pick from device'),
          onTap: onFileTap,
        ),
        SizedBox(height: 10 * ScreenRatio.heightRatio),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Use camera'),
          onTap: onCameraTap,
        ),
      ]),
    ));
  }
}

class AppInformationDialog extends StatelessWidget {
  const AppInformationDialog(
      {Key? key,
      this.onClose,
      this.illustration,
      this.subTitle,
      required this.title})
      : super(key: key);
  final VoidCallback? onClose;
  final String title;
  final String? subTitle;
  final String? illustration;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 16 * ScreenRatio.widthRatio,
            vertical: ScreenRatio.screenHeight / 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(100),
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.ashlyGrey
                            : AppColors.fairlyWhite,
                  ),
                  child: const Icon(Icons.close)),
            ),
            SizedBox(height: 3 * ScreenRatio.heightRatio),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 48 * ScreenRatio.widthRatio,
                  vertical: 30 * ScreenRatio.heightRatio),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8 * ScreenRatio.widthRatio),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 31 * ScreenRatio.fontRatio,
                    ),
                  ),
                  SizedBox(height: 4 * ScreenRatio.heightRatio),
                  Text(
                    subTitle ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14 * ScreenRatio.fontRatio,
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? AppColors.fluentBlue
                          : AppColors.fineGrey,
                    ),
                  ),
                  SizedBox(height: 30 * ScreenRatio.heightRatio),
                  if (illustration != null)
                    SvgPicture.asset(illustration ?? ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTextInputDialog extends StatelessWidget {
  const AppTextInputDialog({
    Key? key,
    this.onClose,
    this.illustration,
    this.subTitle,
    required this.title,
    required this.inputTitle,
    required this.buttonTitle,
    this.onTap,
  }) : super(key: key);
  final VoidCallback? onClose;
  final Function(Function, Function, ButtonState)? onTap;

  final String title;
  final String? subTitle;
  final String? illustration;
  final String inputTitle;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 16 * ScreenRatio.widthRatio,
            vertical: ScreenRatio.screenHeight / 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(100),
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.ashlyGrey
                            : AppColors.fairlyWhite,
                  ),
                  child: const Icon(Icons.close)),
            ),
            SizedBox(height: 3 * ScreenRatio.heightRatio),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 48 * ScreenRatio.widthRatio,
                  vertical: 30 * ScreenRatio.heightRatio),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8 * ScreenRatio.widthRatio),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 31 * ScreenRatio.fontRatio,
                    ),
                  ),
                  SizedBox(height: 4 * ScreenRatio.heightRatio),
                  Text(
                    subTitle ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14 * ScreenRatio.fontRatio,
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? AppColors.fluentBlue
                          : AppColors.fineGrey,
                    ),
                  ),
                  SizedBox(height: 32 * ScreenRatio.heightRatio),
                  AppTextField(
                    title: inputTitle,
                  ),
                  SizedBox(height: 60 * ScreenRatio.heightRatio),
                  PrimaryButton(
                    title: buttonTitle,
                    onTap: onTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
