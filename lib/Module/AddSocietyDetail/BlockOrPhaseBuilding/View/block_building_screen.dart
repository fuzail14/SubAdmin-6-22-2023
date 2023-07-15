import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/MyFloatingButton/My_Floating_Button.dart';
import '../../Widget/Custom_Grid.dart';
import '../Controller/block_building_controller.dart';

class BlockBuilding extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockBuildingController>(
        init: BlockBuildingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 2) {
                Get.offAndToNamed(blockbuildingorstreet,
                    arguments: [controller.user, controller.bid]);
              } else {
                Get.offAndToNamed(phasebuildingorblock,
                    arguments: [controller.user, controller.pid]);
              }

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    if (controller.user.structureType == 2) {
                      Get.offAndToNamed(addblockbuildingscreen,
                          arguments: [controller.user, controller.bid]);
                    } else {
                      Get.offAndToNamed(addblockbuildingscreen,
                          arguments: [controller.user, controller.pid]);
                    }
                  }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Buildings',
                        onTap: () {
                          if (controller.user.structureType == 2) {
                            Get.offAndToNamed(blockbuildingorstreet,
                                arguments: [controller.user, controller.bid]);
                          } else {
                            Get.offAndToNamed(phasebuildingorblock,
                                arguments: [controller.user, controller.pid]);
                          }
                        },
                      ),
                      32.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: (controller.user.structureType == 2)
                                  ? controller.SocietyBuildingApi(
                                      dynamicid: controller.bid,
                                      token: controller.user.bearerToken!)
                                  : controller.SocietyBuildingApi(
                                      dynamicid: controller.pid,
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
                                          print(
                                              'buidling id ${snapshot.data.data[index].id}');

                                          print(
                                              'phase id ${snapshot.data.data[index].dynamicid}');

                                          Get.offAndToNamed(
                                              blockorphasebuildingfloorsscreen,
                                              arguments: [
                                                controller.user,
                                                snapshot.data.data[index].id,
                                                snapshot.data.data[index]
                                                    .dynamicid,
                                              ]);
                                        },
                                        text: snapshot.data.data[index]
                                            .societybuildingname
                                            .toString(),
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
