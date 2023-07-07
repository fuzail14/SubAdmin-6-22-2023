import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/CustomImagePicker/custom_image_picker.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../../../Widgets/UpIcon/up_icon.dart';
import '../Controller/add_finance_manager_controller.dart';

class AddFinanceManager extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddFinanceManagerController>(
        init: AddFinanceManagerController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              await Get.offNamed(viewFinanceManager,
                  arguments: controller.user);
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Form(
                    key: controller.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          MyBackButton(
                            text: 'Add Finance Manager',
                            onTap: () {
                              Get.offNamed(viewFinanceManager,
                                  arguments: controller.user);
                            },
                          ),
                          25.35.ph,
                          CustomImagePicker(
                            backgroundImage: controller.imageFile == null
                                ? AssetImage('assets/user.png') as ImageProvider
                                : FileImage(
                                    File(controller.imageFile!.path),
                                  ),
                            camOnPressed: () {
                              controller.getFromCamera(ImageSource.camera);
                            },
                            galOnPressed: () {
                              controller.getFromGallery(ImageSource.gallery);
                            },
                          ),
                          31.96.ph,
                          MyTextFormField(
                            controller: controller.firstNameController,
                            validator: emptyStringValidator,
                            hintText: 'First Name',
                            labelText: 'Enter First Name',
                          ),
                          MyTextFormField(
                            controller: controller.lastNameController,
                            validator: emptyStringValidator,
                            hintText: 'Last Name',
                            labelText: 'Enter Last Name',
                          ),
                          MyTextFormField(
                            textInputType: TextInputType.number,
                            controller: controller.cnicController,
                            validator: emptyStringValidator,
                            hintText: 'Cnic',
                            labelText: 'Enter Cnic ',
                          ),
                          MyTextFormField(
                            controller: controller.addressController,
                            validator: emptyStringValidator,
                            hintText: 'Address',
                            labelText: 'Enter Address ',
                          ),
                          MyTextFormField(
                            textInputType: TextInputType.number,
                            controller: controller.mobileNoController,
                            validator: emptyStringValidator,
                            hintText: 'Mobile No',
                            labelText: 'Enter Mobile No ',
                          ),
                          MyPasswordTextFormField(
                            maxLines: 1,
                            controller: controller.passwordController,
                            obscureText: controller.isHidden,
                            togglePasswordView: controller.togglePasswordView,
                            validator: emptyStringValidator,
                            hintText: 'Password',
                            labelText: 'Password',
                          ),
                          30.ph,
                          MyButton(
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                if (!controller.isLoading) {
                                  controller.financeManagerRegisterApi(
                                      firstName:
                                          controller.firstNameController.text,
                                      lastName:
                                          controller.lastNameController.text,
                                      cnic: controller.cnicController.text,
                                      address:
                                          controller.addressController.text,
                                      mobileNo:
                                          controller.mobileNoController.text,
                                      password:
                                          controller.passwordController.text,
                                      societyid: controller.user.societyid!,
                                      subAdminId: controller.user.userid!,
                                      superAdminId:
                                          controller.user.superadminid!,
                                      token: controller.user.bearerToken!,
                                      file: controller.imageFile,
                                      context: context);
                                }
                              }
                            },
                            loading: controller.isLoading,
                            name: 'Save',
                          ),
                          20.ph,
                          UpIcon(),
                          18.2.ph,
                        ],
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}
