import 'package:flutter/material.dart';
import 'package:road_runner_driver/shared/shared.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute(
        builder: (_) => const PersonalDetails(),
      );

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    nameController.text = 'Ali Usman';
    emailController.text = 'ali.usman@gmail.com';
    phoneController.text = '08113449588';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Personal Details'),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50 * ScreenRatio.heightRatio,
                horizontal: 24 * ScreenRatio.heightRatio,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(''),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                            iconSize: 15,
                            onPressed: () {
                              context.showAppModalBottomSheet(
                                  AppMediaPickerBottomSheet(
                                    onCameraTap: () async {
                                      await AppMediaService()
                                          .takePicture(context);
                                    },
                                    onFileTap: () async {
                                      await AppMediaService().pickDocument();
                                    },
                                  ),
                                  context: context);
                            },
                            icon: const Icon(Icons.edit_outlined)),
                      ),
                    ],
                  ),
                  SizedBox(height: 34 * ScreenRatio.heightRatio),
                  AppTextField(
                    title: 'Full Name',
                    controller: nameController,
                    onChanged: (String? val) {},
                  ),
                  SizedBox(height: 24 * ScreenRatio.heightRatio),
                  AppTextField(
                    title: 'Email Address',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    onChanged: (String? val) {},
                  ),
                  SizedBox(height: 24 * ScreenRatio.heightRatio),
                  AppTextField(
                    title: 'Phone Number',
                    controller: phoneController,
                    textInputType: TextInputType.phone,
                    onChanged: (String? val) {},
                  ),
                  SizedBox(height: 44 * ScreenRatio.heightRatio),
                  Center(
                    child: PrimaryButton(
                      title: 'Save Changes',
                      onTap: (start, stop, state) {},
                    ),
                  ),
                ],
              )),
        ));
  }
}
