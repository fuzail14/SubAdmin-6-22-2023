import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../Widget/Custom_Grid.dart';
import '../Controller/structure_type5_house_or_building_controller.dart';

class StructureType5HouseOrBuildingMiddlewareScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StructureType5HouseOrBuildingMiddlewareController>(
        init: StructureType5HouseOrBuildingMiddlewareController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(homescreen, arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  body: Column(children: [
                MyBackButton(
                  text: 'House Or Building',
                  onTap: () {
                    Get.offAndToNamed(homescreen, arguments: controller.user);
                  },
                ),
                Expanded(
                    child: Column(
                  children: [
                    32.ph,
                    Expanded(
                      child: GridView(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.w,
                        ),
                        children: [
                          CustomGrid(
                              onTap: () async {
                                Get.offNamed(
                                  houses,
                                  arguments: controller.user,
                                );
                              },
                              text: 'Add Houses'),
                          CustomGrid(
                              onTap: () async {
                                Get.offNamed(societybuildingscreen,
                                    arguments: controller.user);
                              },
                              text: 'Add Buildings'),
                        ],
                      ),
                    ),
                  ],
                ))
              ])),
            ),
          );
        });
  }
}
