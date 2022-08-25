import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_runner_driver/history/models/history_model.dart';
import 'package:road_runner_driver/shared/shared.dart';

class HistoryDetail extends StatelessWidget {
  const HistoryDetail(this.history, {Key? key}) : super(key: key);
  final HistoryModel history;
  static Route route(HistoryModel history) => MaterialPageRoute(
        builder: (_) => HistoryDetail(history),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'History Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 29 * ScreenRatio.heightRatio,
              horizontal: 24 * ScreenRatio.widthRatio),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 29,
                    backgroundImage: NetworkImage(history.order.driver!.image),
                  ),
                  SizedBox(width: 7 * ScreenRatio.widthRatio),
                  Text(history.order.driver!.name),
                  const Spacer(),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AdaptiveTheme.of(context).mode.isDark
                        ? AppColors.navyBlue
                        : AppColors.midnightBlue,
                    child: SvgPicture.asset(AppIllustrations.bike,
                        width: 22 * ScreenRatio.widthRatio),
                  ),
                ],
              ),
              SizedBox(height: 24 * ScreenRatio.heightRatio),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(8 * ScreenRatio.widthRatio),
                  color: AdaptiveTheme.of(context).mode.isDark
                      ? AppColors.navyBlue
                      : AppColors.midnightBlue.withOpacity(0.5),
                ),
                child: AppOrderTimeLine(
                  pickUpLocation: history.order.package.pickUpLocation,
                  dropOff: history.order.package.dropOffs,
                  isExpanded: false,
                ),
              ),
              SizedBox(height: 24 * ScreenRatio.heightRatio),
              DottedBorder(
                radius: Radius.circular(12.0 * ScreenRatio.widthRatio),
                borderType: BorderType.RRect,
                dashPattern: const [8, 4],
                color: AppColors.justGreen,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16 * ScreenRatio.widthRatio,
                      vertical: 24 * ScreenRatio.heightRatio),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(12.0 * ScreenRatio.widthRatio),
                    color: AppColors.mintGreen,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 18 * ScreenRatio.fontRatio,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 24 * ScreenRatio.heightRatio),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //payment type
                            Text(
                              'Cash',
                              style: TextStyle(
                                fontSize: 18 * ScreenRatio.fontRatio,
                                fontWeight: FontWeight.bold,
                                color: AppColors.faintGrey,
                              ),
                            ),
                            Text(
                              '₦5,000',
                              style: TextStyle(
                                fontSize: 16 * ScreenRatio.fontRatio,
                                fontWeight: FontWeight.bold,
                                color: AppColors.justGreen,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
