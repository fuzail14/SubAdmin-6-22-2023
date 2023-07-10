import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Houses/Controller/add_houses_controller.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';

class AddHouses extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AddHousesController>(
          init: AddHousesController(),
          builder: (controller) {
            return WillPopScope(
              onWillPop: () async {
                if (controller.user.structureType == 5) {
                  Get.offNamed(houses, arguments: controller.user);
                } else if (controller.user.structureType == 1) {
                  Get.offNamed(houses,
                      arguments: [controller.user, controller.streetid]);
                } else if (controller.user.structureType == 2) {
                  Get.offNamed(houses, arguments: [
                    controller.user,
                    controller.streetid,
                    controller.blockid
                  ]);
                } else if (controller.user.structureType == 3) {
                  Get.offNamed(houses, arguments: [
                    controller.user,
                    controller.streetid,
                    controller.blockid,
                    controller.phaseid
                  ]);
                }
                return false;
              },
              child: Scaffold(
                body: WillPopScope(
                  onWillPop: () async {
                    await Get.offNamed(houses, arguments: controller.user);
                    return false;
                  },
                  child: Form(
                    key: controller.formKey,
                    child: ListView(
                      children: <Widget>[
                        MyBackButton(
                          text: 'Add Houses',
                          onTap: () {
                            if (controller.user.structureType == 5) {
                              Get.offNamed(houses, arguments: controller.user);
                            } else if (controller.user.structureType == 1) {
                              Get.offNamed(houses, arguments: [
                                controller.user,
                                controller.streetid
                              ]);
                            } else if (controller.user.structureType == 2) {
                              Get.offNamed(houses, arguments: [
                                controller.user,
                                controller.streetid,
                                controller.blockid
                              ]);
                            } else if (controller.user.structureType == 3) {
                              Get.offNamed(houses, arguments: [
                                controller.user,
                                controller.streetid,
                                controller.blockid,
                                controller.phaseid
                              ]);
                            }
                          },
                        ),
                        20.ph,
                        SizedBox(
                          height: 344.h,
                          width: 299.w,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.r)),
                            margin: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyTextFormField(
                                  hintText: 'Address',
                                  labelText: 'Address',
                                  validator: emptyStringValidator,
                                  controller: controller.addressController,
                                ),
                                20.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Color(0xFFF7F8FA),
                                      height: 25.h,
                                      width: 98.w,
                                      child: Center(
                                          child: Text(
                                        'From Houses',
                                        style: TextStyle(
                                            color: HexColor('#535353')),
                                      )),
                                    ),
                                    18.pw,
                                    Image(
                                        image: AssetImage('assets/arrow1.png')),
                                    18.pw,
                                    Container(
                                      color: Color(0xFFF7F8FA),
                                      height: 25.h,
                                      width: 98.w,
                                      child: Center(
                                          child: Text(
                                        'To Houses',
                                        style: TextStyle(
                                            color: HexColor('#535353')),
                                      )),
                                    )
                                  ],
                                ),
                                10.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 75.w,
                                      height: 75.h,
                                      color: Color.fromRGBO(255, 153, 0, 0.14),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/housefieldpic.png')),
                                          ),
                                          Center(
                                            child: TextFormField(
                                              validator: emptyStringValidator,
                                              controller:
                                                  controller.fromController,
                                              keyboardType:
                                                  TextInputType.number,
                                              enabled: true,
                                              decoration: InputDecoration(
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        BorderSide(), //<-- SEE HERE
                                                  ),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    72.pw,
                                    Container(
                                      width: 75.w,
                                      height: 75.h,
                                      color: Color.fromRGBO(255, 153, 0, 0.14),
                                      // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/textfieldimg.png'))),

                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/housefieldpic.png')),
                                          ),
                                          Center(
                                            child: TextFormField(
                                              validator: emptyStringValidator,
                                              controller:
                                                  controller.toController,
                                              keyboardType:
                                                  TextInputType.number,
                                              enabled: true,
                                              decoration: InputDecoration(
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    borderSide:
                                                        BorderSide(), //<-- SEE HERE
                                                  ),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                40.ph,
                                Center(
                                  child: MyButton(
                                    loading: controller.isLoading,
                                    height: 37.h,
                                    width: 222.w,
                                    border: 5,
                                    onPressed: () {
                                      if (!controller.isLoading) {
                                        if (controller.user.structureType ==
                                            5) {
                                          controller.addHousesApi(
                                            societyid:
                                                controller.user.societyid!,
                                            subadminid: controller.user.userid!,
                                            superadminid:
                                                controller.user.superadminid!,
                                            address: controller
                                                .addressController.text
                                                .toString(),
                                            bearerToken:
                                                controller.user.bearerToken!,
                                            from: controller.fromController.text
                                                .toString(),
                                            to: controller.toController.text
                                                .toString(),
                                            dynamicid:
                                                controller.user.societyid!,
                                          );
                                        } else {
                                          controller.addHousesApi(
                                            societyid:
                                                controller.user.societyid!,
                                            subadminid: controller.user.userid!,
                                            superadminid:
                                                controller.user.superadminid!,
                                            address: controller
                                                .addressController.text
                                                .toString(),
                                            bearerToken:
                                                controller.user.bearerToken!,
                                            from: controller.fromController.text
                                                .toString(),
                                            to: controller.toController.text
                                                .toString(),
                                            dynamicid: controller.streetid!,
                                          );
                                        }
                                      }
                                    },
                                    name: 'Save',
                                  ),
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
          }),
    );
  }
}
