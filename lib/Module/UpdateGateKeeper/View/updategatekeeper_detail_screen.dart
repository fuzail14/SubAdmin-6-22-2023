import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Module/UpdateGateKeeper/Controller/reset_password_controller.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Text/my_text.dart';
import 'package:societyadminapp/Widgets/UpIcon/up_icon.dart';
import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/CustomImagePicker/custom_image_picker.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/update_gate_keeper_controller.dart';

class UpdateGateKepeerScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateGateKeeperController>(
        init: UpdateGateKeeperController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(gatekeeperscreen, arguments: controller.user);

              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MyBackButton(
                          text: 'Update Gatekeeper Details',
                          onTap: () {
                            Get.offAndToNamed(gatekeeperscreen,
                                arguments: controller.user);
                          },
                        ),
                        21.35.ph,
                        CustomImagePicker(
                            backgroundImage: controller.imageFile == null
                                ? NetworkImage(Api.imageBaseUrl +
                                        controller.gatekeeper.image.toString())
                                    as ImageProvider
                                : FileImage(
                                    File(controller.imageFile!.path),
                                  ),
                            camOnPressed: () {
                              controller.getFromCamera(ImageSource.camera);
                            },
                            galOnPressed: () {
                              controller.getFromGallery(ImageSource.gallery);
                            }),
                        20.ph,
                        MyTextFormField(
                          controller: controller.fnameController,
                          validator: emptyStringValidator,
                          hintText: 'First Name',
                          labelText: 'Enter First Name',
                        ),
                        MyTextFormField(
                          controller: controller.lnameController,
                          validator: emptyStringValidator,
                          hintText: 'Last Name',
                          labelText: 'Enter Last Name',
                        ),
                        MyTextFormField(
                          textInputType: TextInputType.number,
                          controller: controller.mobilenoController,
                          validator: emptyStringValidator,
                          hintText: 'Mobile nO',
                          labelText: 'Enter Mobile No',
                        ),
                        MyTextFormField(
                          controller: controller.addressController,
                          validator: emptyStringValidator,
                          hintText: 'Address ',
                          labelText: 'Enter Address',
                        ),
                        MyTextFormField(
                          textInputType: TextInputType.number,
                          controller: controller.gatenoController,
                          validator: emptyStringValidator,
                          hintText: 'Gate No ',
                          labelText: 'Enter Gate No',
                        ),
                        30.ph,
                        MyButton(
                          loading: controller.isLoading,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.isLoading == false) {
                                controller.updateGatekeeperApi(
                                    gatekeeperid: controller.gatekeeper.id!,
                                    gatekeeperfirstname:
                                        controller.fnameController.text,
                                    gatekeeperlastname:
                                        controller.lnameController.text,
                                    gatekeepergateno:
                                        controller.gatenoController.text,
                                    gatekeepermobileno:
                                        controller.mobilenoController.text,
                                    gatekeeperaddress:
                                        controller.addressController.text,
                                    image: controller.imageFile,
                                    bearerToken: controller.user.bearerToken!);
                              }
                            }
                          },
                          name: 'Save',
                          width: 180.25872802734375.w,
                          height: 43.h,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        20.ph,
                        GetBuilder<ResetPasswordController>(
                            init: ResetPasswordController(),
                            builder: (resetPasswordController) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Forgot Password?'),
                                  GestureDetector(
                                      onTap: () {
                                        Get.defaultDialog(
                                            title: 'Reset Password',
                                            content: Column(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/reset_password_icon.svg',
                                                  width: 200.w,
                                                ),
                                                20.ph,
                                                MyPasswordTextFormField(
                                                    labelText: 'Password',
                                                    hintText: 'Password',
                                                    togglePasswordView:
                                                        resetPasswordController
                                                            .togglePasswordView,
                                                    controller:
                                                        resetPasswordController
                                                            .passwordController,
                                                    obscureText:
                                                        resetPasswordController
                                                            .isHidden),
                                                20.ph,
                                                MyButton(
                                                  name: 'Reset Password',
                                                  onPressed: () {
                                                    resetPasswordController
                                                        .resetPasswordApi(
                                                            gateKeeperId:
                                                                controller
                                                                    .gatekeeper
                                                                    .id!,
                                                            bearerToken:
                                                                controller.user
                                                                    .bearerToken!,
                                                            password:
                                                                resetPasswordController
                                                                    .passwordController
                                                                    .text);
                                                    Get.back();
                                                  },
                                                )
                                              ],
                                            ));
                                      },
                                      child: MyText(
                                        name: 'Reset',
                                        color: primaryColor,
                                      )),
                                ],
                              );
                            }),
                        35.ph,
                        UpIcon()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
