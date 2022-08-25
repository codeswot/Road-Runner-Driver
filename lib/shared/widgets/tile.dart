import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:road_runner_driver/shared/shared.dart';
import 'package:timelines/timelines.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.illustration,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String illustration;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 30 * ScreenRatio.heightRatio,
            horizontal: 20 * ScreenRatio.widthRatio),
        decoration: BoxDecoration(
          color: AdaptiveTheme.of(context).mode.isDark
              ? AppColors.navyBlue
              : AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24 * ScreenRatio.fontRatio,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              fontSize: 16 * ScreenRatio.fontRatio,
            ),
          ),
          trailing: SizedBox(
            width: 100,
            height: 100,
            child: SvgPicture.asset(illustration),
          ),
        ),
      ),
    );
  }
}

class DriverTile extends StatelessWidget {
  const DriverTile(
      {Key? key,
      required this.rating,
      required this.name,
      required this.vendor,
      required this.price,
      required this.image,
      this.onTap,
      this.secondaryTap})
      : super(key: key);
  final double rating;
  final String name;
  final String vendor;
  final double price;
  final String image;
  final VoidCallback? onTap;
  final VoidCallback? secondaryTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 16 * ScreenRatio.heightRatio,
            horizontal: 14 * ScreenRatio.widthRatio),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8 * ScreenRatio.widthRatio),
          color: AdaptiveTheme.of(context).mode.isDark
              ? AppColors.tribeIndigo
              : AppColors.white,
          border: Border.all(
            color: AdaptiveTheme.of(context).mode.isDark
                ? AppColors.midnightBlue
                : AppColors.flimsyGrey,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 37,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(width: 16 * ScreenRatio.widthRatio),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18 * ScreenRatio.fontRatio,
                  ),
                ),
                SizedBox(height: 8 * ScreenRatio.heightRatio),
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 11 * ScreenRatio.fontRatio,
                    ),
                    SizedBox(width: 5 * ScreenRatio.widthRatio),
                    Text(
                      '${rating.toString()} rating',
                      style: TextStyle(
                        fontSize: 14 * ScreenRatio.fontRatio,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17 * ScreenRatio.heightRatio),
                InkWell(
                    onTap: secondaryTap,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5 * ScreenRatio.widthRatio,
                          vertical: 3 * ScreenRatio.heightRatio),
                      child: Text(
                        'Full Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18 * ScreenRatio.fontRatio,
                          color: AdaptiveTheme.of(context).mode.isDark
                              ? AppColors.midnightBlue
                              : AppColors.solidOrange,
                        ),
                      ),
                    )),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  vendor,
                  style: TextStyle(
                    fontSize: 12 * ScreenRatio.fontRatio,
                    color: AdaptiveTheme.of(context).mode.isDark
                        ? AppColors.aseeyBlue
                        : AppColors.navyBlue,
                  ),
                ),
                //for now
                SizedBox(height: 44 * ScreenRatio.heightRatio),
                AppTextChip(price.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppTextChip extends StatelessWidget {
  const AppTextChip(this.text,
      {Key? key,
      this.padH,
      this.padV,
      this.fontSize,
      this.color,
      this.textColor})
      : super(key: key);
  final String text;
  final double? padV;
  final double? padH;
  final double? fontSize;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: padH ?? 18 * ScreenRatio.widthRatio,
            vertical: padV ?? 8 * ScreenRatio.heightRatio),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color ??
              (AdaptiveTheme.of(context).mode.isDark
                  ? AppColors.mintWhite
                  : AppColors.mintGreen),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? AppColors.justGreen,
              fontSize: fontSize ?? 16 * ScreenRatio.fontRatio,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ));
  }
}

class AppOrderTimeLine extends StatelessWidget {
  const AppOrderTimeLine({
    Key? key,
    required this.dropOff,
    required this.pickUpLocation,
    this.isExpanded,
  }) : super(key: key);
  final LocationModel pickUpLocation;
  final List<DropOffsModel> dropOff;
  final bool? isExpanded;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20 * ScreenRatio.widthRatio),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: AppColors.midnightBlue,
          connectorTheme: ConnectorThemeData(
            thickness: 1.9 * ScreenRatio.fontRatio,
            space: 16 * ScreenRatio.widthRatio,
            color: AppColors.royalBlue,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: dropOff.length + 1,
          contentsBuilder: (_, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pickUpLocation.address.isEmpty
                          ? ''
                          : pickUpLocation.address,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16 * ScreenRatio.fontRatio,
                      ),
                    ),
                    Text(
                      'Pick-up location',
                      style: TextStyle(
                        fontSize: 12 * ScreenRatio.fontRatio,
                        color: AdaptiveTheme.of(context).mode.isDark
                            ? AppColors.payGrey
                            : AppColors.ashlyGrey,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.topLeft,
                childrenPadding: EdgeInsets.all(5 * ScreenRatio.widthRatio),
                initiallyExpanded:
                    isExpanded ?? dropOff.indexOf(dropOff[index - 1]) == 0
                        ? true
                        : false,
                title: Text(
                  dropOff[index - 1].dropOffLocation.address,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16 * ScreenRatio.fontRatio,
                  ),
                ),
                subtitle: Text(
                  'Drop-off Location ${dropOff.indexOf(dropOff[index - 1]) + 1}',
                  style: TextStyle(
                    fontSize: 12 * ScreenRatio.fontRatio,
                    color: AdaptiveTheme.of(context).mode.isDark
                        ? AppColors.payGrey
                        : AppColors.ashlyGrey,
                  ),
                ),
                children: [
                  Container(
                    padding: EdgeInsets.all(16 * ScreenRatio.widthRatio),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AdaptiveTheme.of(context).mode.isDark
                          ? AppColors.navyBlue
                          : AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Package Category',
                          style: TextStyle(
                            fontSize: 16 * ScreenRatio.fontRatio,
                            color: AdaptiveTheme.of(context).mode.isDark
                                ? AppColors.bagsBlue
                                : AppColors.flimsyGrey,
                          ),
                        ),
                        SizedBox(height: 4 * ScreenRatio.heightRatio),
                        Text(
                          dropOff[index - 1].category,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16 * ScreenRatio.fontRatio,
                          ),
                        ),
                        SizedBox(height: 16 * ScreenRatio.heightRatio),
                        Text(
                          'Delivery Priority',
                          style: TextStyle(
                            fontSize: 16 * ScreenRatio.fontRatio,
                            color: AdaptiveTheme.of(context).mode.isDark
                                ? AppColors.bagsBlue
                                : AppColors.flimsyGrey,
                          ),
                        ),
                        SizedBox(height: 4 * ScreenRatio.heightRatio),
                        Text(
                          dropOff[index - 1].priority,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16 * ScreenRatio.fontRatio,
                          ),
                        ),
                        if (dropOff[index - 1].description != null &&
                            dropOff[index - 1].description!.isNotEmpty) ...[
                          SizedBox(height: 16 * ScreenRatio.heightRatio),
                          Text(
                            'Package Description',
                            style: TextStyle(
                              fontSize: 16 * ScreenRatio.fontRatio,
                              color: AdaptiveTheme.of(context).mode.isDark
                                  ? AppColors.bagsBlue
                                  : AppColors.flimsyGrey,
                            ),
                          ),
                          SizedBox(height: 4 * ScreenRatio.heightRatio),
                          Text(
                            dropOff[index - 1].description!,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16 * ScreenRatio.fontRatio,
                            ),
                          ),
                        ]
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          indicatorBuilder: (_, index) {
            return ContainerIndicator(
              child: Icon(
                index == 0
                    ? Icons.location_searching_outlined
                    : Icons.location_on_outlined,
                color: index == 0
                    ? (AdaptiveTheme.of(context).mode.isDark
                        ? AppColors.ashlyGrey
                        : AppColors.navyBlue)
                    : AppColors.solidOrange,
              ),
            );
          },
          connectorBuilder: (_, index, __) =>
              const DashedLineConnector(color: AppColors.royalBlue),
        ),
      ),
    );
  }
}
