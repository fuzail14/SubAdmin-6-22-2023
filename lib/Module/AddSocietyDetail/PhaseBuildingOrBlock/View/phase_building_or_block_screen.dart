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
import '../Controller/phase_building_or_block_controller.dart';

class PhaseBuildingOrBlock extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhaseBuildingOrBlockController>(
        init: PhaseBuildingOrBlockController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(phasess, arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  body: Column(children: [
                MyBackButton(
                  text: 'Phase Or Building',
                  onTap: () {
                    Get.offAndToNamed(phasess, arguments: controller.user);
                  },
                ),
                32.ph,
                Expanded(
                  child: GridView(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                    ),
                    children: [
                      CustomGrid(
                          onTap: () async {
                            Get.offAndToNamed(blocks,
                                arguments: [controller.user, controller.pid]);
                          },
                          text: 'Add Blocks'),
                      CustomGrid(
                          onTap: () async {
                            Get.offAndToNamed(blockbuilding,
                                arguments: [controller.user, controller.pid]);
                          },
                          text: 'Add Buildings'),
                    ],
                  ),
                )
              ])),
            ),
          );
        });
  }
}
