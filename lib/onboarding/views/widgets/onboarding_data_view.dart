import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_runner_driver/onboarding/models/models.dart';
import 'package:road_runner_driver/shared/shared.dart';

class OnboardingDataView extends StatelessWidget {
  const OnboardingDataView(this.onboardingDataModel, {Key? key})
      : super(key: key);
  final OnboardingDataModel onboardingDataModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          onboardingDataModel.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 29 * ScreenRatio.fontRatio,
          ),
        ),
        SvgPicture.asset(onboardingDataModel.illustration),
        Text(
          onboardingDataModel.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.fluentBlue
                : AppColors.faintGrey,
            fontSize: 16 * ScreenRatio.fontRatio,
          ),
        ),
      ],
    );
  }
}
