import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:societyadminapp/Widgets/My%20Text/my_text.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../Controller/add_society_building_floor_controller.dart';

class AddSocietyBuildingFloors extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSocietyBuildingFloorsController>(
        init: AddSocietyBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(societybuildingfloorsscreen,
                  arguments: [controller.user, controller.buildingid]);

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
                          Get.offAndToNamed(societybuildingfloorsscreen,
                              arguments: [
                                controller.user,
                                controller.buildingid
                              ]);
                        },
                        text: 'Add Floors',
                      ),
                      20.ph,
                      SizedBox(
                        height: 200.h,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r)),
                          child: Column(
                            children: [
                              20.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  MyText(name: 'From Floors'),
                                  MyText(name: 'To Floors')
                                ],
                              ),
                              10.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
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
                              40.ph,
                              MyButton(
                                loading: controller.isLoading,
                                onPressed: () {
                                  if (!controller.isLoading) {
                                    controller.addSocietybuildingFloorsApi(
                                        bearerToken:
                                            controller.user.bearerToken!,
                                        from: controller.fromController.text
                                            .toString(),
                                        to: controller.toController.text
                                            .toString(),
                                        buildingid: controller.buildingid!);
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
