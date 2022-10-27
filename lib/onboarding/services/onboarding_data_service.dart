import 'package:road_runner_driver/onboarding/onboarding.dart';
import 'package:road_runner_driver/shared/shared.dart';

class OnboardingDataService {
  List<OnboardingDataModel> buildOnboardingData() {
    final List<OnboardingDataModel> _onboardingData = [
      const OnboardingDataModel(
        title: 'Make deliveries across your city',
        description:
            'Request for bikes, tricycles, cars, mini-vans, and trucks.',
        illustration: AppIllustrations.bike,
      ),
      const OnboardingDataModel(
        title: 'Track your delivery',
        description: 'Know exactly where your items are in real time.',
        illustration: AppIllustrations.trackDelivery,
      ),
      const OnboardingDataModel(
        title: 'Earn money as a ride',
        description: 'Become a Road runner and earn. ',
        illustration: AppIllustrations.orders,
      ),
      const OnboardingDataModel(
        title: 'Swift & easy payment',
        description: 'Swift & easy in-app payment for service.',
        illustration: AppIllustrations.easyPay,
      ),
    ];
    return _onboardingData;
  }
}
