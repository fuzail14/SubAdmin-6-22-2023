import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../Widget/Custom_Grid.dart';
import '../Controller/block_building_or_street_controller.dart';

class BlockBuildingOrStreet extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockBuildingOrStreetController>(
        init: BlockBuildingOrStreetController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(blocks, arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  body: Column(children: [
                MyBackButton(
                  text: 'Street Or Building',
                  onTap: () {
                    Get.offAndToNamed(blocks, arguments: controller.user);
                  },
                ),
                32.ph,
                Expanded(
                  child: GridView(
                    padding: EdgeInsets.only(left: 27.w, right: 27.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 35,
                        mainAxisSpacing: 15),
                    children: [
                      CustomGrid(
                          onTap: () async {
                            if (controller.user.structureType == 2) {
                              Get.offAndToNamed(streets,
                                  arguments: [controller.user, controller.bid]);
                            } else if (controller.user.structureType == 3) {
                              Get.offAndToNamed(streets, arguments: [
                                controller.user,
                                controller.bid,
                                controller.phaseid
                              ]);
                            }
                          },
                          text: 'Add Streets'),
                      CustomGrid(
                          onTap: () async {
                            Get.offAndToNamed(blockbuilding,
                                arguments: [controller.user, controller.bid]);
                          },
                          text: 'Add Buildings')
                    ],
                  ),
                )
              ])),
            ),
          );
        });
  }
}
