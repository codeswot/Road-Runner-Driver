import 'package:flutter/material.dart';
import 'package:road_runner_driver/profile/profile.dart';
import 'package:road_runner_driver/shared/shared.dart';

import '../widgets/widgets.dart';

class HomeScreenDashboard extends StatefulWidget {
  const HomeScreenDashboard({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute(
        builder: (_) => const HomeScreenDashboard(),
      );

  @override
  State<HomeScreenDashboard> createState() => _HomeScreenDashboardState();
}

class _HomeScreenDashboardState extends State<HomeScreenDashboard> {
  bool online = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DashboardProfileCard(
            userName: 'Musa A. Dams',
            userPhoto: defaultPhoto,
            onNotification: () {},
            onTap: () {
              context.push(Profile.route());
            },
          ),
          DashboardContainerCard(
            context,
            balance: 5000,
            onWithdraw: (start, stop, state) {},
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(24 * ScreenRatio.widthRatio),
                child: Column(
                  children: [
                    ContentCard(
                      title: 'Earnings',
                      description: 'Take a look at all your earnings',
                      illustration: AppIllustrations.bike,
                      isBordered: true,
                      buttonText: 'View Earnings',
                      color: AppColors.tangoOrange,
                      borderColor: AppColors.solidOrange,
                      buttonOnTap: (_, __, ___) {},
                    ),
                    SizedBox(height: 24 * ScreenRatio.heightRatio),
                    ContentCard(
                      title: 'Ride History',
                      description: 'View all rides',
                      illustration: AppIllustrations.trackDelivery,
                      isBordered: true,
                      buttonText: 'View History',
                      color: AppColors.aseeyBlue,
                      borderColor: AppColors.bagsBlue,
                      buttonOnTap: (_, __, ___) {},
                    ),
                    SizedBox(height: 34 * ScreenRatio.heightRatio),
                    if (online)
                      Center(
                          child: PrimaryButton(
                        title: 'Go Offline',
                        onTap: (_, __, ___) {
                          setState(() {
                            online = false;
                          });
                        },
                      )),
                    if (!online)
                      Center(
                        child: SecondaryButton(
                          context,
                          title: 'Go Online',
                          color: AppColors.justGreen,
                          bgColor: AppColors.mintGreen.withOpacity(0.08),
                          onTap: (_, __, ___) {
                            setState(() {
                              online = true;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
