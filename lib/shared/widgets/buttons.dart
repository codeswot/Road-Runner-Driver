import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter/material.dart';
import 'package:road_runner_driver/shared/shared.dart';

import 'bare_argon.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onTap,
    required this.title,
    this.height,
    this.width,
  }) : super(key: key);
  final Function(Function, Function, ButtonState)? onTap;
  final String title;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: height != null ? height! * ScreenRatio.heightRatio : 55,
      width: width != null
          ? width! * ScreenRatio.widthRatio
          : ScreenRatio.absoluteWidth,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      minWidth: 100,
      borderRadius: 7 * ScreenRatio.heightRatio,
      color: AppColors.solidOrange,
      loader: const CircularProgressIndicator(color: AppColors.fairlyWhite),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.tangoOrange,
            fontSize: 18 * ScreenRatio.fontRatio,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
    this.context, {
    Key? key,
    this.onTap,
    required this.title,
    this.height,
    this.width,
    this.color,
    this.bgColor,
  }) : super(key: key);
  final Function(Function, Function, ButtonState)? onTap;
  final String title;
  final double? width;
  final double? height;
  final Color? color;
  final Color? bgColor;

  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: height != null ? height! * ScreenRatio.heightRatio : 55,
      width: width != null
          ? width! * ScreenRatio.widthRatio
          : ScreenRatio.absoluteWidth,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      minWidth: 200,
      borderRadius: 8 * ScreenRatio.heightRatio,
      color: bgColor ?? Colors.transparent,
      borderSide: BorderSide(
        color: AdaptiveTheme.of(context).mode.isDark
            ? color ?? AppColors.fairlyWhite
            : color ?? AppColors.solidOrange,
      ),
      loader: const CircularProgressIndicator(color: AppColors.fairlyWhite),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? color ?? AppColors.fairlyWhite
                : color ?? AppColors.solidOrange,
            fontSize: 17 * ScreenRatio.fontRatio,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

class SecondaryButton2 extends StatelessWidget {
  const SecondaryButton2(
    this.context, {
    Key? key,
    this.onTap,
    required this.title,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);
  final Function(Function, Function, ButtonState)? onTap;
  final String title;
  final double? width;
  final double? height;
  final Color? color;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: height != null ? height! * ScreenRatio.heightRatio : 55,
      width: width != null
          ? width! * ScreenRatio.widthRatio
          : ScreenRatio.absoluteWidth,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      minWidth: 200,
      borderRadius: 8 * ScreenRatio.heightRatio,
      color: Colors.transparent,
      loader: SizedBox(
          width: 25 * ScreenRatio.widthRatio,
          height: 25 * ScreenRatio.heightRatio,
          child: CircularProgressIndicator(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? color ?? AppColors.fairlyWhite
                : color ?? AppColors.ashlyGrey,
          )),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? color ?? AppColors.flimsyGrey
                : color ?? AppColors.ashlyGrey,
            fontSize: 18 * ScreenRatio.fontRatio,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({Key? key, required this.icon, this.onTap, this.toolTip})
      : super(key: key);
  final IconData icon;
  final String? toolTip;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100 * ScreenRatio.widthRatio),
      radius: 100 * ScreenRatio.widthRatio,
      onTap: onTap,
      child: Tooltip(
        message: toolTip ?? '',
        child: Container(
          padding: EdgeInsets.all(8 * ScreenRatio.widthRatio),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AdaptiveTheme.of(context).mode.isDark
                ? AppColors.navyBlue
                : AppColors.white,
          ),
          child: Icon(
            icon,
            color: AdaptiveTheme.of(context).mode.isDark
                ? AppColors.white
                : AppColors.navyBlue,
          ),
        ),
      ),
    );
  }
}

class AppIconButton2 extends StatelessWidget {
  const AppIconButton2({Key? key, required this.icon, this.onTap, this.toolTip})
      : super(key: key);
  final IconData icon;
  final String? toolTip;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100 * ScreenRatio.widthRatio),
      radius: 100 * ScreenRatio.widthRatio,
      onTap: onTap,
      child: Tooltip(
        message: toolTip ?? '',
        child: Container(
          padding: EdgeInsets.all(10 * ScreenRatio.heightRatio),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AdaptiveTheme.of(context).mode.isDark
                  ? AppColors.transparent
                  : AppColors.faintGrey,
            ),
            color: AdaptiveTheme.of(context).mode.isDark
                ? AppColors.tribeIndigo
                : AppColors.transparent,
          ),
          child: Center(
            child: Icon(
              icon,
              size: 18 * ScreenRatio.fontRatio,
              color: AdaptiveTheme.of(context).mode.isDark
                  ? AppColors.white
                  : AppColors.faintGrey,
            ),
          ),
        ),
      ),
    );
  }
}
