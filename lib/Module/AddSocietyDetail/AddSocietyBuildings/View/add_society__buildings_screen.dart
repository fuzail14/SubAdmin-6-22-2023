import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/UpIcon/up_icon.dart';
import '../Controller/add_socuety_buildings_controller.dart';

class AddSocietyBuildingScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSocietyBuildingController>(
        init: AddSocietyBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(societybuildingscreen,
                  arguments: controller.user);

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
                          Get.offAndToNamed(societybuildingscreen,
                              arguments: controller.user);
                        },
                        text: 'Add Society Building',
                      ),
                      20.ph,
                      SizedBox(
                        height: 244.h,
                        width: 299.w,
                        child: Card(
                          elevation: 2,
                          margin: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    color: Color(0xFFF7F8FA),
                                    height: 35.h,
                                    width: 150.w,
                                    child: Center(
                                        child: Text(
                                      'Society Building Name',
                                      style:
                                          TextStyle(color: HexColor('#535353')),
                                    )),
                                  ),
                                ),
                                20.ph,
                                Container(
                                  width: 200.w,
                                  height: 75.h,
                                  color: Color.fromRGBO(255, 153, 0, 0.14),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Image(
                                            image: AssetImage(
                                                'assets/blockfieldpic.png')),
                                      ),
                                      Center(
                                        child: TextFormField(
                                          validator: emptyStringValidator,
                                          controller: controller
                                              .societyBuildingNameController,
                                          enabled: true,
                                          decoration: InputDecoration(
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide:
                                                    BorderSide(), //<-- SEE HERE
                                              ),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                20.ph,
                                MyButton(
                                  loading: controller.isLoading,
                                  width: 200.w,
                                  height: 37.h,
                                  border: 5,
                                  onPressed: () {
                                    if (!controller.isLoading) {
                                      String type;
                                      if (controller.user.structureType == 1) {
                                        type = 'street society building';
                                      } else if (controller
                                              .user.structureType ==
                                          2) {
                                        type = 'block society building';
                                      } else {
                                        type = 'phase society building';
                                      }

                                      controller.addSocietyBuildingApi(
                                          dynamicid: controller.user.societyid!,
                                          societyid: controller.user.societyid!,
                                          subadminid: controller.user.userid!,
                                          superadminid:
                                              controller.user.superadminid!,
                                          bearerToken:
                                              controller.user.bearerToken!,
                                          BuildingName: controller
                                              .societyBuildingNameController
                                              .text
                                              .toString(),
                                          type: type);
                                    }
                                  },
                                  name: 'Save',
                                )
                              ],
                            ),
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
