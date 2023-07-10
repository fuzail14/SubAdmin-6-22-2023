import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/Loader/loader.dart';

import '../../Widget/Custom_List.dart';
import '../Controller/society_building_floor_controller.dart';

class SocietyBuildingFloorsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocietyBuildingFloorsController>(
        init: SocietyBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 1) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 2) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 3) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 5) {
                Get.offAndToNamed(societybuildingscreen,
                    arguments: controller.user);
              }

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: IconButton(
                      padding: EdgeInsets.only(top: 85.w),
                      iconSize: MediaQuery.of(context).size.height * 0.065,
                      icon: SvgPicture.asset('assets/floatingbutton.svg'),
                      onPressed: () {
                        Get.offAndToNamed(addsocietybuildingfloors, arguments: [
                          controller.user,
                          controller.buildingid!
                        ]);
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Floors',
                        onTap: () {
                          if (controller.user.structureType == 1) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 2) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 3) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 5) {
                            Get.offAndToNamed(societybuildingscreen,
                                arguments: controller.user);
                          }
                        },
                      ),
                      20.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: controller.futureFloors,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomList(
                                          onTap: () {
                                            Get.offAndToNamed(
                                                societybuildingapartmentscreen,
                                                arguments: [
                                                  controller.user,
                                                  snapshot.data.data[index].id,
                                                  controller.buildingid
                                                ]);
                                          },
                                          text: snapshot.data.data[index].name
                                              .toString());
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
