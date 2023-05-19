import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter/material.dart';
import 'package:road_runner_driver/shared/shared.dart';
import 'package:road_runner_driver/shared/widgets/bare_argon.dart';

class DashboardContainerCard extends StatelessWidget {
  const DashboardContainerCard(this.context,
      {Key? key, required this.balance, this.onWithdraw})
      : super(key: key);
  final double balance;
  final Function(Function start, Function stop, ButtonState state)? onWithdraw;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
            ? AppColors.navyBlue
            : AppColors.zeeGrey,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 40 * ScreenRatio.widthRatio,
          vertical: 15 * ScreenRatio.heightRatio),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wallet Balance',
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? AppColors.midnightBlue
                          : AppColors.faintGrey,
                  fontSize: 14 * ScreenRatio.fontRatio,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 4 * ScreenRatio.heightRatio,
              ),
              Text(
                '₦${balance.toString()}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? AppColors.fairlyWhite
                          : AppColors.navyBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 32 * ScreenRatio.fontRatio,
                ),
              ),
            ],
          ),
          SecondaryButton(
            context,
            title: 'Withdraw',
            onTap: onWithdraw,
            width: 120,
          ),
        ],
      ),
    );
  }
}

class DashboardProfileCard extends StatelessWidget {
  const DashboardProfileCard(
      {Key? key,
      this.onNotification,
      this.onTap,
      this.userName,
      this.userPhoto})
      : super(key: key);
  final VoidCallback? onNotification;
  final VoidCallback? onTap;

  final String? userName;
  final String? userPhoto;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24 * ScreenRatio.widthRatio,
      ),
      decoration: BoxDecoration(
        color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
            ? AppColors.navyBlue
            : AppColors.zeeGrey,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8 * ScreenRatio.heightRatio),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.fairlyWhite,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          userPhoto ?? defaultPhoto,
                        ),
                      ),
                    ),
                    SizedBox(width: 6 * ScreenRatio.widthRatio),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            color: AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.dark
                                ? AppColors.maeBlue
                                : AppColors.ashlyGrey,
                            fontSize: 14 * ScreenRatio.fontRatio,
                          ),
                        ),
                        SizedBox(height: 6 * ScreenRatio.heightRatio),
                        SizedBox(
                          width: 100 * ScreenRatio.widthRatio,
                          child: Text(
                            userName ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.dark
                                  ? AppColors.midnightBlue
                                  : AppColors.faintGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * ScreenRatio.fontRatio,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: onNotification,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? AppColors.midnightBlue
                          : AppColors.faintGrey,
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    size: 35 * ScreenRatio.fontRatio,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
