import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/MyFloatingButton/My_Floating_Button.dart';
import '../../../AddSocietyDetail/Widget/Custom_List.dart';
import '../Controller/local_building_floors_controller.dart';

class LocalBuildingFloorsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalBuildingFloorsController>(
        init: LocalBuildingFloorsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(localbuildingscreen,
                  arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    Get.offAndToNamed(
                      addlocalbuildingfloors,
                      arguments: controller.user,
                    );
                  }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Floors',
                        onTap: () {
                          Get.offAndToNamed(localbuildingscreen,
                              arguments: controller.user);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: FutureBuilder(
                              future: controller.FloorsApi(
                                  buildingid: controller.user.societyid!,
                                  token: controller.user.bearerToken!),
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
                                              localbuildingapartmentscreen,
                                              arguments: [
                                                controller.user,
                                                snapshot.data.data[index].id,
                                              ]);
                                        },
                                        text: snapshot.data.data[index].name
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
