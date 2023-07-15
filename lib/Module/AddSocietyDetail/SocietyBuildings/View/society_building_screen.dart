import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Widget/Custom_Grid.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/MyFloatingButton/My_Floating_Button.dart';
import '../Controller/society_building_controller.dart';

class SocietyBuildingScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocietyBuildingController>(
        init: SocietyBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 1) {
                Get.offAndToNamed(streetorbuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 2) {
                Get.offAndToNamed(blockorsocietybuilding,
                    arguments: controller.user);
              } else if (controller.user.structureType == 3) {
                Get.offAndToNamed(phaseorsocietybuilding,
                    arguments: controller.user);
              } else if (controller.user.structureType == 5) {
                Get.offAndToNamed(structureType5HouseOrBuildingMiddlewareScreen,
                    arguments: controller.user);
              }

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    Get.offAndToNamed(addsocietybuildingscreen,
                        arguments: controller.user);
                  }),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyBackButton(
                        onTap: () {
                          if (controller.user.structureType == 1) {
                            Get.offAndToNamed(streetorbuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 2) {
                            Get.offAndToNamed(blockorsocietybuilding,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 3) {
                            Get.offAndToNamed(phaseorsocietybuilding,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 5) {
                            Get.offAndToNamed(
                                structureType5HouseOrBuildingMiddlewareScreen,
                                arguments: controller.user);
                          }
                        },
                        text: 'Buildings',
                      ),
                      32.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: controller.SocietyBuildingApi(
                                  dynamicid: controller.user.societyid!,
                                  token: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return GridView.builder(
                                    padding: EdgeInsets.only(
                                        left: 28.w, right: 27.w),
                                    itemCount: snapshot.data.data.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 35,
                                            mainAxisSpacing: 15),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomGrid(
                                        onTap: () async {
                                          Get.offAndToNamed(
                                              societybuildingfloorsscreen,
                                              arguments: [
                                                controller.user,
                                                snapshot.data.data[index].id,
                                              ]);
                                        },
                                        text: snapshot.data.data[index]
                                            .societybuildingname,
                                      );
                                  
                                    },
                                  );
                             
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Loader();
                                }
                              })),
                    ],
                  )),
            ),
          );
        });
  }
}
