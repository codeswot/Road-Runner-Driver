import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:road_runner_rider/shared/shared.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.title,
    this.isSecured = false,
    this.visibility = false,
    this.maxLine,
    this.minLine,
    this.toggleVisibility,
    this.onChanged,
    this.icon,
    this.controller,
    this.textInputType,
    this.textCapitalization = TextCapitalization.words,
  }) : super(key: key);
  final String title;
  final int? maxLine;
  final int? minLine;
  final bool isSecured;
  final bool visibility;
  final IconData? icon;
  final VoidCallback? toggleVisibility;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 4 * ScreenRatio.heightRatio),
        TextFormField(
          controller: controller,
          obscureText: isSecured,
          keyboardType: textInputType,
          textCapitalization: textCapitalization,
          maxLines: maxLine ?? 1,
          minLines: minLine ?? 1,
          decoration: InputDecoration(
            hintText: 'Enter ${title.toLowerCase()}',
            border: const OutlineInputBorder(),
            suffixIcon: isSecured
                ? InkWell(
                    onTap: toggleVisibility,
                    child: SizedBox(
                        child: (visibility
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined))))
                : null,
            prefixIcon: icon != null ? Icon(icon) : null,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class AppDropdownField extends StatelessWidget {
  const AppDropdownField({
    Key? key,
    required this.title,
    this.onChanged,
    this.value,
    this.items,
  }) : super(key: key);
  final String title;
  final String? value;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 4 * ScreenRatio.heightRatio),
        DropdownButtonFormField<String>(
          onChanged: onChanged,
          items: items,
          value: value,
          decoration: InputDecoration(
            hintText: 'Select ${title.toLowerCase()}',
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class AppRadioField extends StatelessWidget {
  const AppRadioField({
    Key? key,
    this.selected = false,
    this.onSelected,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final bool? selected;
  final void Function(bool?)? onSelected;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selected!
              ? AppColors.solidOrange
              : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? AppColors.payBlue
                  : AppColors.ashlyGrey,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {
            onSelected?.call(selected);
          },
          child: ListTile(
            leading: Icon(
              icon,
              color: selected!
                  ? AppColors.solidOrange
                  : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                      ? AppColors.payBlue
                      : AppColors.ashlyGrey,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: selected!
                    ? AppColors.solidOrange
                    : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                        ? AppColors.payBlue
                        : AppColors.ashlyGrey,
              ),
            ),
            trailing: SizedBox(
              width: 10,
              height: 10,
              child: Radio(
                value: selected!,
                onChanged: onSelected,
                groupValue: true,
                activeColor: AppColors.solidOrange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppRadioField2 extends StatelessWidget {
  const AppRadioField2({
    Key? key,
    this.selected = false,
    this.onSelected,
    required this.title,
    required this.icon,
    this.secondaryTitle,
    this.subTitle,
    this.isValid = false,
  }) : super(key: key);
  final bool? selected;
  final void Function(bool?)? onSelected;
  final String title;
  final String? subTitle;
  final String? secondaryTitle;
  final bool? isValid;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelected?.call(selected);
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.all(5 * ScreenRatio.widthRatio),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? AppColors.navyBlue
                  : AppColors.white),
          child: Icon(
            icon,
            color: selected!
                ? AppColors.solidOrange
                : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                    ? AppColors.fairlyWhite
                    : AppColors.ashlyGrey,
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: '$title ',
            style: TextStyle(
              color: selected!
                  ? AppColors.solidOrange
                  : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                      ? AppColors.white
                      : AppColors.black,
            ),
            children: [
              TextSpan(
                text: secondaryTitle ?? '',
                style: TextStyle(
                  color: isValid! ? AppColors.justGreen : AppColors.rageRed,
                ),
              ),
            ],
          ),
        ),
        subtitle: subTitle != null
            ? Text(
                subTitle!,
                style: TextStyle(
                  color: isValid! ? AppColors.justGreen : AppColors.rageRed,
                  fontSize: 10 * ScreenRatio.fontRatio,
                ),
              )
            : null,
        trailing: SizedBox(
          width: 10,
          height: 10,
          child: Radio(
            value: selected!,
            onChanged: onSelected,
            groupValue: true,
            activeColor: AppColors.solidOrange,
          ),
        ),
      ),
    );
  }
}

class AppRadioField3 extends StatelessWidget {
  const AppRadioField3({
    Key? key,
    this.selected = false,
    this.onSelected,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final bool? selected;
  final void Function(bool?)? onSelected;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selected!
              ? AppColors.solidOrange
              : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? AppColors.payBlue
                  : AppColors.ashlyGrey,
        ),
        color: selected!
            ? AppColors.tangoOrange
            : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.payBlue
                : AppColors.rentGrey,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {
            onSelected?.call(selected);
          },
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
                vertical: 15 * ScreenRatio.heightRatio,
                horizontal: 16 * ScreenRatio.widthRatio),
            leading: Icon(
              icon,
              color: selected!
                  ? AppColors.solidOrange
                  : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                      ? AppColors.midnightBlue
                      : AppColors.navyBlue,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: selected!
                    ? AppColors.solidOrange
                    : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                        ? AppColors.midnightBlue
                        : AppColors.navyBlue,
              ),
            ),
            trailing: SizedBox(
              width: 10,
              height: 10,
              child: Radio(
                value: selected!,
                onChanged: onSelected,
                groupValue: true,
                activeColor: AppColors.solidOrange,
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.navyBlue.withOpacity(.5);
                  }
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.solidOrange;
                  }
                  return AppColors.navyBlue;
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppDocumentField extends StatefulWidget {
  const AppDocumentField({
    Key? key,
    this.onCameraTap,
    this.onFileTap,
    required this.title,
  }) : super(key: key);
  final VoidCallback? onFileTap;
  final VoidCallback? onCameraTap;
  final String title;
  @override
  State<AppDocumentField> createState() => _AppDocumentFieldState();
}

class _AppDocumentFieldState extends State<AppDocumentField> {
  File? pickedFile;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.fairlyWhite
                : AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4 * ScreenRatio.heightRatio),
        InkWell(
          onTap: () {
            context.showAppModalBottomSheet(
                AppMediaPickerBottomSheet(
                  onCameraTap: () async {
                    pickedFile = null;
                    final file = await AppMediaService().takePicture(context);
                    if (file != null) {
                      setState(() {
                        pickedFile = file;
                      });
                    }
                    context.pop();
                  },
                  onFileTap: () async {
                    pickedFile = null;
                    final file = await AppMediaService().pickDocument();
                    if (file != null) {
                      setState(() {
                        pickedFile = file;
                      });
                    }
                    context.pop();
                  },
                ),
                context: context);
          },
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.payBlue
                : AppColors.ashlyGrey,
            dashPattern: const [9, 9],
            radius: const Radius.circular(8),
            padding: EdgeInsets.symmetric(
              horizontal: 16 * ScreenRatio.heightRatio,
              vertical: 18 * ScreenRatio.widthRatio,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: SizedBox(
                width: double.infinity,
                child: pickedFile != null
                    ? Column(
                        children: [
                          PickedFileHolder(
                            pickedFile?.path ?? '',
                            onClose: () {
                              setState(
                                () {
                                  pickedFile = null;
                                },
                              );
                            },
                            fileSize: pickedFile!.lengthSync(),
                          ),
                          SizedBox(height: 5 * ScreenRatio.heightRatio),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload,
                                color: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.dark
                                    ? AppColors.payGrey
                                    : AppColors.faintGrey,
                              ),
                              Text(
                                'Pick new file',
                                style: TextStyle(
                                  fontSize: 19 * ScreenRatio.widthRatio,
                                  fontWeight: FontWeight.w500,
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.dark
                                      ? AppColors.payGrey
                                      : AppColors.faintGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload,
                                color: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.dark
                                    ? AppColors.payGrey
                                    : AppColors.faintGrey,
                              ),
                              Text(
                                'Upload a file',
                                style: TextStyle(
                                  fontSize: 19 * ScreenRatio.widthRatio,
                                  fontWeight: FontWeight.w500,
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.dark
                                      ? AppColors.payGrey
                                      : AppColors.faintGrey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'JPEG,PDF,PNG up to 10MB',
                            style: TextStyle(
                              fontSize: 10 * ScreenRatio.widthRatio,
                              fontWeight: FontWeight.w400,
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.dark
                                  ? AppColors.payGrey
                                  : AppColors.faintGrey,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppImageField extends StatefulWidget {
  const AppImageField({Key? key}) : super(key: key);

  @override
  State<AppImageField> createState() => _AppImageFieldState();
}

class _AppImageFieldState extends State<AppImageField> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facial Verification',
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.fairlyWhite
                : AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4 * ScreenRatio.heightRatio),
        InkWell(
          onTap: () async {
            final file = await AppMediaService().takePicture(context);
            if (file != null) {
              setState(() {
                pickedImage = file;
              });
            }
          },
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.payBlue
                : AppColors.ashlyGrey,
            dashPattern: const [9, 9],
            radius: const Radius.circular(8),
            padding: EdgeInsets.symmetric(
              horizontal: 16 * ScreenRatio.heightRatio,
              vertical: 18 * ScreenRatio.widthRatio,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: SizedBox(
                width: double.infinity,
                child: pickedImage != null
                    ? Column(
                        children: [
                          PickedImageHolder(
                            pickedImage?.path ?? '',
                            onClose: () {
                              setState(
                                () {
                                  pickedImage = null;
                                },
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.dark
                                    ? AppColors.payGrey
                                    : AppColors.faintGrey,
                              ),
                              Text(
                                'Retake Photo',
                                style: TextStyle(
                                  fontSize: 19 * ScreenRatio.widthRatio,
                                  fontWeight: FontWeight.w500,
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.dark
                                      ? AppColors.payGrey
                                      : AppColors.faintGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.dark
                                    ? AppColors.payGrey
                                    : AppColors.faintGrey,
                              ),
                              SizedBox(width: 4 * ScreenRatio.widthRatio),
                              Text(
                                'Use Camera',
                                style: TextStyle(
                                  fontSize: 19 * ScreenRatio.widthRatio,
                                  fontWeight: FontWeight.w500,
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.dark
                                      ? AppColors.payGrey
                                      : AppColors.faintGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppImageField2 extends StatelessWidget {
  const AppImageField2({
    Key? key,
    required this.title,
    this.onCameraTap,
    this.onDocumentTap,
    this.pickedFile,
    required this.onClose,
  }) : super(key: key);
  final String title;

  final VoidCallback? onDocumentTap;
  final VoidCallback? onCameraTap;
  final VoidCallback onClose;

  final File? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? AppColors.fluentBlue
                            : AppColors.faintGrey,
                  ),
                ),
                SizedBox(height: 11 * ScreenRatio.heightRatio),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      radius: 100,
                      borderRadius: BorderRadius.circular(100),
                      child: Padding(
                        padding: EdgeInsets.all(3.0 * ScreenRatio.widthRatio),
                        child: Icon(
                          Icons.upload,
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? AppColors.hopingBlue
                              : AppColors.navyBlue,
                        ),
                      ),
                      onTap: onDocumentTap,
                    ),
                    SizedBox(width: 44 * ScreenRatio.heightRatio),
                    InkWell(
                      radius: 100,
                      borderRadius: BorderRadius.circular(100),
                      child: Padding(
                        padding: EdgeInsets.all(3.0 * ScreenRatio.widthRatio),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? AppColors.hopingBlue
                              : AppColors.navyBlue,
                        ),
                      ),
                      onTap: onCameraTap,
                    ),
                  ],
                ),
              ],
            ),
            if (pickedFile != null) ...[
              SizedBox(width: 60 * ScreenRatio.widthRatio),
              Expanded(
                child: PickedFileHolder(
                  pickedFile!.path,
                  onClose: onClose,
                  fileSize: pickedFile!.lengthSync(),
                  boxSize: 120,
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}

class AppCheckField extends StatelessWidget {
  const AppCheckField({
    Key? key,
    this.selected = false,
    this.onSelected,
    this.boxWidth,
    required this.title,
  }) : super(key: key);
  final bool? selected;
  final void Function(bool?)? onSelected;
  final String title;
  final double? boxWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      radius: 8,
      onTap: () {
        onSelected?.call(selected);
      },
      child: SizedBox(
        width: boxWidth ?? ScreenRatio.widthRatio * 200,
        child: Row(
          children: [
            Checkbox(
              value: selected!,
              onChanged: onSelected,
              activeColor: AppColors.solidOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(width: 4 * ScreenRatio.widthRatio),
            Text(
              title,
              style: TextStyle(
                color: selected!
                    ? AppColors.solidOrange
                    : AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                        ? AppColors.payBlue
                        : AppColors.ashlyGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageDetailEntries extends StatelessWidget {
  const PackageDetailEntries({
    Key? key,
    required this.descriptionController,
    required this.nameController,
    required this.phoneController,
    required this.priorityController,
    required this.categoryVal,
    required this.deliveryVal,
    this.onNameChange,
    this.onPhoneChanged,
  }) : super(key: key);
  final TextEditingController descriptionController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController priorityController;
  final String categoryVal;
  final String deliveryVal;
  final Function(String)? onNameChange;
  final Function(String)? onPhoneChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16 * ScreenRatio.widthRatio),
      child: Column(
        children: [
          AppDropdownField(title: 'Package Category', value: categoryVal),
          SizedBox(height: 24 * ScreenRatio.heightRatio),
          AppDropdownField(title: 'Delivery Priority', value: deliveryVal),
          SizedBox(height: 24 * ScreenRatio.heightRatio),
          AppTextField(
            controller: descriptionController,
            title: 'Package Description',
            minLine: 8,
            maxLine: 10,
          ),
          SizedBox(height: 24 * ScreenRatio.heightRatio),
          AppTextField(
            controller: nameController,
            title: 'Recipients Name',
            onChanged: onNameChange,
          ),
          SizedBox(height: 24 * ScreenRatio.heightRatio),
          AppTextField(
            controller: phoneController,
            title: 'Recipient Phone Number',
            textInputType: TextInputType.phone,
            onChanged: onPhoneChanged,
          ),
        ],
      ),
    );
  }
}

//use state management
class PayWithSelector extends StatefulWidget {
  const PayWithSelector({this.itemAmount, Key? key}) : super(key: key);
  final double? itemAmount;
  @override
  State<PayWithSelector> createState() => _PayWithSelectorState();
}

class _PayWithSelectorState extends State<PayWithSelector> {
  //get bal from api (state management)
  double balance = 5000;
  bool isFunded = false;

  bool isWallet = false;
  bool isCash = true;
  void checkBal() {
    if (widget.itemAmount != null) {
      if (balance < widget.itemAmount!) {
        setState(() {
          isFunded = false;
        });
      } else {
        setState(() {
          isFunded = true;
        });
      }
    } else {
      setState(() {
        isFunded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkBal();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I want to pay with',
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.fluentBlue
                : AppColors.faintGrey,
          ),
        ),
        SizedBox(height: 16 * ScreenRatio.heightRatio),
        AppRadioField2(
          selected: isWallet,
          title: 'Wallet',
          icon: Icons.wallet,
          isValid: isFunded,
          secondaryTitle: '(₦${balance.toString()})',
          subTitle: isFunded == false ? 'Insufficient balance' : null,
          onSelected: (bool? val) {
            setState(() {
              isCash = false;
              isWallet = true;
            });
          },
        ),
        SizedBox(height: 30 * ScreenRatio.heightRatio),
        AppRadioField2(
          selected: isCash,
          title: 'Cash',
          icon: Icons.money,
          onSelected: (bool? val) {
            setState(() {
              isCash = true;
              isWallet = false;
            });
          },
        ),
      ],
    );
  }
}
