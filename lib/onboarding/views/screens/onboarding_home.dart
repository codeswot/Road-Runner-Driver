import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:road_runner_driver/onboarding/onboarding.dart';
import 'package:road_runner_driver/shared/shared.dart';

import '../../../authentication/authentication.dart';

class OnboardingHome extends StatefulWidget {
  const OnboardingHome({Key? key}) : super(key: key);

  @override
  State<OnboardingHome> createState() => _OnboardingHomeState();
}

class _OnboardingHomeState extends State<OnboardingHome> {
  final PageController _pageController = PageController();
  final onboardingDataService = OnboardingDataService();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.navyBlue
          : AppColors.tangoOrange,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 36 * ScreenRatio.heightRatio,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {
                  final OnboardingDataModel onboardingData =
                      onboardingDataService
                          .buildOnboardingData()
                          .elementAt(index);
                  currentIndex = index + 1;
                  return SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(16 * ScreenRatio.widthRatio),
                      child: OnboardingDataView(onboardingData),
                    ),
                  );
                },
                onPageChanged: (index) {
                  currentIndex = index + 1;
                  setState(() {});
                },
                itemCount: onboardingDataService.buildOnboardingData().length,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 26 * ScreenRatio.heightRatio,
                horizontal: 24 * ScreenRatio.widthRatio,
              ),
              child: OnboardingControls(
                _pageController,
                currentIndex: currentIndex,
                lastIndex: onboardingDataService.buildOnboardingData().length,
                onSkip: (_, __, ___) {
                  _pageController.animateToPage(4,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeOut);
                },
                onNext: (_, __, ___) {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeOut);
                },
                onTap: (_, __, ___) {
                  context.push(LogIn.route());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
