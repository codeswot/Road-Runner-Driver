import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:road_runner_rider/shared/shared.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile(
      {required this.address,
      required this.date,
      required this.price,
      this.onTap,
      Key? key})
      : super(key: key);
  final VoidCallback? onTap;
  final String address;
  final String date;
  final String price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: AdaptiveTheme.of(context).mode.isDark
            ? AppColors.navyBlue
            : AppColors.tangoOrange,
        child: SvgPicture.asset(AppIllustrations.bike,
            width: 22 * ScreenRatio.widthRatio),
      ),
      title: Text(address),
      subtitle: Text(date),
      trailing: SizedBox(
        width: 80 * ScreenRatio.widthRatio,
        height: 30 * ScreenRatio.heightRatio,
        child: AppTextChip(
          price,
          padH: 2 * ScreenRatio.widthRatio,
          padV: 2 * ScreenRatio.heightRatio,
        ),
      ),
    );
  }
}
