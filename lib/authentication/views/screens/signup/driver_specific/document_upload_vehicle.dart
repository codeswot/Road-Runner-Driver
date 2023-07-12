import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:road_runner_rider/authentication/views/views.dart';
import 'package:road_runner_rider/shared/shared.dart';

class DocumentUploadVehicle extends StatefulWidget {
  const DocumentUploadVehicle({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute(
        builder: (_) => const DocumentUploadVehicle(),
      );

  @override
  State<DocumentUploadVehicle> createState() => _DocumentUploadVehicleState();
}

class _DocumentUploadVehicleState extends State<DocumentUploadVehicle> {
  String vehicleType = vehicleTypes.first;
  File? frontView;
  File? backView;
  File? interiorView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.navyBlue
          : AppColors.tangoOrange,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 24 * ScreenRatio.widthRatio,
                vertical: 32 * ScreenRatio.heightRatio),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32 * ScreenRatio.widthRatio,
                  ),
                )),
                SizedBox(height: 32 * ScreenRatio.widthRatio),
                Text(
                  'Vehicle Verification',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.flimsyGrey
                            : AppColors.ashlyGrey,
                    fontSize: 24 * ScreenRatio.fontRatio,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Document upload',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.flimsyGrey
                            : AppColors.ashlyGrey,
                    fontSize: 14 * ScreenRatio.fontRatio,
                  ),
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppDropdownField(
                  title: 'Vehicle Type',
                  value: vehicleType,
                  items: vehicleTypes
                      .map(
                        (item) => DropdownMenuItem<String>(
                          child: Text(item),
                          value: item,
                        ),
                      )
                      .toList(),
                  onChanged: (String? val) {
                    setState(() {
                      vehicleType = val!;
                    });
                  },
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppTextField(title: 'Brand Name', onChanged: (String? val) {}),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppTextField(
                    title: 'Model & Year', onChanged: (String? val) {}),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppTextField(
                    title: 'Plate Number', onChanged: (String? val) {}),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppTextField(
                    title: 'Vehicle Color', onChanged: (String? val) {}),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                const AppDocumentField(title: 'Vehicle License'),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                Text(
                  'Vehicle images',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.fluentBlue
                            : AppColors.faintGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16 * ScreenRatio.heightRatio),
                AppImageField2(
                  title: 'Front view',
                  pickedFile: frontView,
                  onCameraTap: () async {
                    frontView = null;
                    final pickedImage =
                        await AppMediaService().takePicture(context);
                    setState(() {
                      frontView = pickedImage;
                    });
                  },
                  onDocumentTap: () async {
                    frontView = null;
                    final pickedDocument =
                        await AppMediaService().pickDocument();

                    setState(() {
                      frontView = pickedDocument;
                    });
                  },
                  onClose: () {
                    setState(() {
                      frontView = null;
                    });
                  },
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppImageField2(
                  title: 'Back view',
                  pickedFile: backView,
                  onCameraTap: () async {
                    backView = null;
                    final pickedImage =
                        await AppMediaService().takePicture(context);
                    setState(() {
                      backView = pickedImage;
                    });
                  },
                  onDocumentTap: () async {
                    backView = null;
                    final pickedDocument =
                        await AppMediaService().pickDocument();

                    setState(() {
                      backView = pickedDocument;
                    });
                  },
                  onClose: () {
                    setState(() {
                      backView = null;
                    });
                  },
                ),
                SizedBox(height: 24 * ScreenRatio.heightRatio),
                AppImageField2(
                  title: 'Interior view',
                  pickedFile: interiorView,
                  onCameraTap: () async {
                    interiorView = null;
                    final pickedImage =
                        await AppMediaService().takePicture(context);
                    setState(() {
                      interiorView = pickedImage;
                    });
                  },
                  onDocumentTap: () async {
                    interiorView = null;
                    final pickedDocument =
                        await AppMediaService().pickDocument();

                    setState(() {
                      interiorView = pickedDocument;
                    });
                  },
                  onClose: () {
                    setState(() {
                      interiorView = null;
                    });
                  },
                ),
                SizedBox(height: 60 * ScreenRatio.heightRatio),
                Center(
                  child: PrimaryButton(
                    title: 'Continue',
                    onTap: (load, stop, state) async {
                      load();
                      await Future.delayed(const Duration(seconds: 2));
                      context.pushAndRemoveUntil(LogIn.route(),
                          rootNavigator: true);

                      stop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
