import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:societyadminapp/Widgets/My%20Text/my_text.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../Controller/add_society_building_controller.dart';

class AddSocietyBuildingApartmentsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSocietyBuildingApartmentsController>(
        init: AddSocietyBuildingApartmentsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(societybuildingapartmentscreen,
                  arguments: [controller.user, controller.fid, controller.bid]);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                body: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: <Widget>[
                      MyBackButton(
                        onTap: () {
                          Get.offAndToNamed(societybuildingapartmentscreen,
                              arguments: [
                                controller.user,
                                controller.fid,
                                controller.bid
                              ]);
                        },
                        text: 'Add Apartments',
                      ),
                      20.ph,
                      SizedBox(
                        height: 200.h,
                        child: Card(
                          margin: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r)),
                          elevation: 2,
                          child: Column(
                            children: [
                              20.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(name: 'From Apartment'),
                                      10.ph,
                                      SizedBox(
                                        width: 70.w,
                                        child: TextFormField(
                                          validator: emptyStringValidator,
                                          controller: controller.fromController,
                                          keyboardType: TextInputType.number,
                                          enabled: true,
                                          decoration: InputDecoration(
                                              filled: true,
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                borderSide:
                                                    BorderSide(), //<-- SEE HERE
                                              ),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(name: 'To Apartment'),
                                      10.ph,
                                      SizedBox(
                                        width: 70.w,
                                        child: TextFormField(
                                          validator: emptyStringValidator,
                                          controller: controller.toController,
                                          keyboardType: TextInputType.number,
                                          enabled: true,
                                          decoration: InputDecoration(
                                              filled: true,
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                borderSide:
                                                    BorderSide(), //<-- SEE HERE
                                              ),
                                              border: InputBorder.none),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              40.ph,
                              MyButton(
                                loading: controller.isLoading,
                                onPressed: () {
                                  if (!controller.isLoading) {
                                    controller.addApartmentsApi(
                                      bearerToken: controller.user.bearerToken!,
                                      from: controller.fromController.text
                                          .toString(),
                                      to: controller.toController.text
                                          .toString(),
                                      fid: controller.fid!,
                                    );
                                  }
                                },
                                name: 'Save',
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
