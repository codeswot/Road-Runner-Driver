import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:road_runner_driver/shared/shared.dart';

class AppMediaService {
  Future<File?> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: supportedFiles, type: FileType.custom);
    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      return null;
    }
  }

  Future<File?> takePicture(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? result = await _picker.pickImage(source: ImageSource.camera);
    if (result != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: result.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                      ? AppColors.navyBlue
                      : AppColors.tangoOrange,
              toolbarWidgetColor:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                      ? AppColors.payGrey
                      : AppColors.faintGrey,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Crop Image',
          ),
        ],
      );
      if (croppedFile != null) return File(croppedFile.path);
      return null;
    } else {
      return null;
    }
  }

  pickPicture() {}
}
