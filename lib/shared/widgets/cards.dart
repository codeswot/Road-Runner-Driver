import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_runner_driver/shared/shared.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    Key? key,
    this.color,
    this.borderColor,
    required this.illustration,
    required this.title,
    required this.description,
    required this.buttonText,
    this.buttonOnTap,
    this.isBordered = false,
  }) : super(key: key);
  final Color? color;
  final Color? borderColor;

  final String title;
  final String description;

  final String illustration;
  final String buttonText;
  final Function(Function, Function, ButtonState)? buttonOnTap;
  final bool isBordered;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 22 * ScreenRatio.heightRatio,
        horizontal: 24 * ScreenRatio.widthRatio,
      ),
      decoration: BoxDecoration(
        color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
            ? AppColors.royalBlue.withOpacity(0.07)
            : color ?? AppColors.tangoOrange,
        borderRadius: BorderRadius.circular(8),
        border: isBordered
            ? Border.all(color: borderColor ?? AppColors.solidOrange)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22 * ScreenRatio.fontRatio,
                  color: isBordered
                      ? borderColor ?? AppColors.solidOrange
                      : AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .bodyText2!
                          .color,
                ),
              ),
              SizedBox(height: 4 * ScreenRatio.widthRatio),
              SizedBox(
                width: 153 * ScreenRatio.widthRatio,
                child: Text(
                  description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: isBordered
                        ? borderColor ?? AppColors.solidOrange
                        : AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .bodyText2!
                            .color,
                    fontSize: 16 * ScreenRatio.fontRatio,
                  ),
                ),
              ),
              SizedBox(height: 16 * ScreenRatio.heightRatio),
              SecondaryButton(
                context,
                title: buttonText,
                onTap: buttonOnTap,
                width: 130 * ScreenRatio.widthRatio,
                color: isBordered
                    ? borderColor
                    : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                        ? AppColors.royalBlue
                        : AppColors.navyBlue,
                bgColor:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                        ? Colors.transparent
                        : AppColors.fairlyWhite,
              ),
            ],
          ),
          SizedBox(width: 40 * ScreenRatio.widthRatio),
          Expanded(
            child: SvgPicture.asset(
              illustration,
              width: 130 * ScreenRatio.widthRatio,
              height: 130 * ScreenRatio.heightRatio,
              //color:
            ),
          ),
        ],
      ),
    );
  }
}

class PickedFileHolder extends StatelessWidget {
  const PickedFileHolder(this.fileName,
      {Key? key, required this.onClose, required this.fileSize, this.boxSize})
      : super(key: key);
  final String fileName;
  final int fileSize;
  final VoidCallback onClose;
  final double? boxSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                vertical: 8 * ScreenRatio.heightRatio,
                horizontal: 7 * ScreenRatio.widthRatio),
            padding: EdgeInsets.symmetric(
              horizontal: 6 * ScreenRatio.widthRatio,
              vertical: 20 * ScreenRatio.heightRatio,
            ),
            decoration: BoxDecoration(
              color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? AppColors.hopingBlue.withOpacity(0.5)
                  : AppColors.solidOrange.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_copy_outlined,
                      size: 16 * ScreenRatio.fontRatio,
                    ),
                    SizedBox(width: 4 * ScreenRatio.widthRatio),
                    SizedBox(
                      width: boxSize ?? 218 * ScreenRatio.widthRatio,
                      child: Text(
                        fileName.contains('image_cropper_')
                            ? fileName
                                .replaceAll('image_cropper_', 'camera_')
                                .split('/')
                                .last
                            : fileName.split('/').last,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12 * ScreenRatio.fontRatio),
                      ),
                    ),
                  ],
                ),
                Text(
                  (fileSize).toString() + 'KB',
                  style: TextStyle(fontSize: 9 * ScreenRatio.fontRatio),
                ),
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: InkWell(
                onTap: onClose,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? AppColors.ashlyGrey
                          : AppColors.fairlyWhite,
                    ),
                    child: const Icon(Icons.close)),
              )),
          // Align(
          //     alignment: Alignment.topRight,
          //     child: Container(child: Icon(Icons.close))),
        ],
      ),
    );
  }
}

class PickedImageHolder extends StatelessWidget {
  const PickedImageHolder(this.imageName, {Key? key, required this.onClose})
      : super(key: key);
  final String imageName;
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                vertical: 8 * ScreenRatio.heightRatio,
                horizontal: 7 * ScreenRatio.widthRatio),
            decoration: BoxDecoration(
              color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? AppColors.hopingBlue.withOpacity(0.5)
                  : AppColors.solidOrange.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.file(File(imageName))),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: InkWell(
                onTap: onClose,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? AppColors.ashlyGrey
                          : AppColors.fairlyWhite,
                    ),
                    child: const Icon(Icons.close)),
              )),
          // Align(
          //     alignment: Alignment.topRight,
          //     child: Container(child: Icon(Icons.close))),
        ],
      ),
    );
  }
}
