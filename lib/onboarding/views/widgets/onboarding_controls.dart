import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter/material.dart';
import 'package:road_runner_driver/shared/shared.dart';
import 'package:road_runner_driver/shared/widgets/bare_argon.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingControls extends StatelessWidget {
  const OnboardingControls(this.pageController,
      {Key? key,
      this.onNext,
      this.onSkip,
      this.onTap,
      required this.currentIndex,
      required this.lastIndex})
      : super(key: key);
  final Function(Function, Function, ButtonState)? onNext;
  final Function(Function, Function, ButtonState)? onSkip;
  final Function(Function, Function, ButtonState)? onTap;

  final int currentIndex;
  final int lastIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmoothPageIndicator(
          controller: pageController,
          count: 4,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
            spacing: 8.0,
            radius: 100 * ScreenRatio.widthRatio,
            dotWidth: 10 * ScreenRatio.widthRatio,
            dotHeight: 10 * ScreenRatio.heightRatio,
            paintStyle: PaintingStyle.fill,
            strokeWidth: 1.5,
            dotColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.hopingBlue
                : AppColors.midnightBlue,
            activeDotColor:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                    ? AppColors.solidOrange
                    : AppColors.navyBlue,
          ),
        ),
        const SizedBox(height: 56),
        currentIndex != lastIndex
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SecondaryButton2(
                    context,
                    title: 'Skip',
                    width: 100,
                    onTap: onSkip,
                  ),
                  SecondaryButton(
                    context,
                    title: 'Next',
                    width: 120,
                    color: AppColors.solidOrange,
                    onTap: onNext,
                  ),
                ],
              )
            : PrimaryButton(title: 'Get Started', onTap: onTap),
      ],
    );
  }
}
