import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:road_runner_rider/profile/profile.dart';
import 'package:road_runner_rider/shared/shared.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../../../home/home.dart';

//fetch profile details
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute(
        builder: (_) => const Profile(),
      );

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool kyCVerified = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        onBack: () {
          context.pushAndRemoveUntil(HomeScreenDashboard.route());
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 24 * ScreenRatio.widthRatio,
              vertical: 32 * ScreenRatio.heightRatio),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 16 * ScreenRatio.widthRatio,
                    vertical: 24 * ScreenRatio.heightRatio),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(8 * ScreenRatio.widthRatio),
                  color: AdaptiveTheme.of(context).mode.isDark
                      ? AppColors.navyBlue
                      : AppColors.tangoOrange,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Personal Details',
                          style: TextStyle(
                            fontSize: 24 * ScreenRatio.fontRatio,
                            color: AdaptiveTheme.of(context).mode.isDark
                                ? AppColors.fluentBlue
                                : AppColors.ashlyGrey,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // context.push(PersonalDetails.route());
                          },
                          child: Icon(
                            Icons.edit_outlined,
                            color: AdaptiveTheme.of(context).mode.isDark
                                ? AppColors.fluentBlue
                                : AppColors.ashlyGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24 * ScreenRatio.heightRatio),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 33,
                          backgroundImage: NetworkImage(''),
                        ),
                        SizedBox(width: 8 * ScreenRatio.widthRatio),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ali Usman',
                              style: TextStyle(
                                color: AdaptiveTheme.of(context).mode.isDark
                                    ? AppColors.fairlyWhite
                                    : AppColors.navyBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18 * ScreenRatio.fontRatio,
                              ),
                            ),
                            SizedBox(height: 8 * ScreenRatio.heightRatio),
                            Text(
                              '08013449588',
                              style: TextStyle(
                                color: AdaptiveTheme.of(context).mode.isDark
                                    ? AppColors.midnightBlue
                                    : AppColors.faintGrey,
                                fontSize: 14 * ScreenRatio.fontRatio,
                              ),
                            ),
                            SizedBox(height: 8 * ScreenRatio.heightRatio),
                            Text(
                              'ali.usman@gmail.com',
                              style: TextStyle(
                                color: AdaptiveTheme.of(context).mode.isDark
                                    ? AppColors.midnightBlue
                                    : AppColors.faintGrey,
                                fontSize: 14 * ScreenRatio.fontRatio,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32 * ScreenRatio.heightRatio),
              Text(
                'System Settings',
                style: TextStyle(
                  color: AdaptiveTheme.of(context).mode.isDark
                      ? AppColors.midnightBlue
                      : AppColors.ashlyGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 24 * ScreenRatio.fontRatio,
                ),
              ),
              SizedBox(height: 25 * ScreenRatio.heightRatio),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.file_copy_outlined,
                          color: AdaptiveTheme.of(context).mode.isDark
                              ? AppColors.fairlyWhite
                              : AppColors.fairlyBlack,
                        ),
                        SizedBox(width: 4 * ScreenRatio.widthRatio),
                        Text(
                          'KYC',
                          style: TextStyle(
                            color: AdaptiveTheme.of(context).mode.isDark
                                ? AppColors.fairlyWhite
                                : AppColors.fairlyBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 16 * ScreenRatio.fontRatio,
                          ),
                        )
                      ],
                    ),
                    AppTextChip(
                      kyCVerified ? 'Verified' : 'Unverified',
                      color: kyCVerified
                          ? AdaptiveTheme.of(context).mode.isDark
                              ? AppColors.mintWhite
                              : AppColors.mintGreen
                          : AdaptiveTheme.of(context).mode.isDark
                              ? AppColors.rageRed.withOpacity(0.09)
                              : AppColors.rageRed.withOpacity(0.04),
                      textColor:
                          kyCVerified ? AppColors.justGreen : AppColors.rageRed,
                      fontSize: 13 * ScreenRatio.fontRatio,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25 * ScreenRatio.heightRatio),
              GestureDetector(
                onTap: () {
                  context.push(ChangePassword.route());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.password,
                      color: AdaptiveTheme.of(context).mode.isDark
                          ? AppColors.fairlyWhite
                          : AppColors.fairlyBlack,
                    ),
                    SizedBox(width: 10 * ScreenRatio.widthRatio),
                    Text(
                      'Change Password',
                      style: TextStyle(
                        color: AdaptiveTheme.of(context).mode.isDark
                            ? AppColors.fairlyWhite
                            : AppColors.fairlyBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 16 * ScreenRatio.fontRatio,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25 * ScreenRatio.heightRatio),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(AdaptiveTheme.of(context).mode.isDark
                    ? Icons.nightlight_outlined
                    : Icons.wb_sunny_outlined),
                title: Text(
                  'Switch to ${AdaptiveTheme.of(context).mode.isDark ? "Light" : "Dark"} mode',
                  style: TextStyle(
                    color: AdaptiveTheme.of(context).mode.isDark
                        ? AppColors.midnightBlue
                        : AppColors.ashlyGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14 * ScreenRatio.fontRatio,
                  ),
                ),
                trailing: SizedBox(
                  width: 120 * ScreenRatio.widthRatio,
                  child: RollingSwitch.icon(
                    initialState: AdaptiveTheme.of(context).mode.isDark,
                    innerSize: 45 * ScreenRatio.widthRatio,
                    onChanged: (bool state) {
                      if (AdaptiveTheme.of(context).mode.isDark) {
                        setState(() {
                          AdaptiveTheme.of(context).setLight();
                        });
                      } else {
                        setState(() {
                          AdaptiveTheme.of(context).setDark();
                        });
                      }
                    },
                    rollingInfoRight: const RollingIconInfo(
                        icon: Icons.nightlight_outlined,
                        backgroundColor: AppColors.navyBlue),
                    rollingInfoLeft: const RollingIconInfo(
                        icon: Icons.wb_sunny_outlined,
                        backgroundColor: AppColors.faintGrey),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
