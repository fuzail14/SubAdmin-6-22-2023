import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../Widget/Cutom_Add_Building_Floor_Screen.dart';
import '../Controller/add_block_or_phase_building_floors_controller.dart';

class AddBlockOrPhaseBuildingFloors extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AAddBlockOrPhaseBuildingFloorsController>(
        init: AAddBlockOrPhaseBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
              onWillPop: () async {
                Get.offAndToNamed(blockorphasebuildingfloorsscreen, arguments: [
                  controller.user,
                  controller.buildingid,
                  controller.dynamicid
                ]);

                return false;
              },
              child: AddBuildingFloorCustom(
                fKey: controller.formKey,
                backonTap: () {
                  Get.offAndToNamed(blockorphasebuildingfloorsscreen,
                      arguments: [
                        controller.user,
                        controller.buildingid,
                        controller.dynamicid
                      ]);
                },
                fromController: controller.fromController,
                toController: controller.toController,
                buttonLoading: controller.isLoading,
                buttonOnPressed: () {
                  controller.addSocietybuildingFloorsApi(
                      bearerToken: controller.user.bearerToken!,
                      from: controller.fromController.text.toString(),
                      to: controller.toController.text.toString(),
                      buildingid: controller.buildingid!);
                },
              ));
     
        });
  }
}
