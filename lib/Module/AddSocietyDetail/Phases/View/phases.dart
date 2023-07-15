import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Phases/Controller/phases_controller.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/MyFloatingButton/My_Floating_Button.dart';
import '../../Widget/Custom_Grid.dart';

class Phases extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhasesController>(
        init: PhasesController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(phaseorsocietybuilding, arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    Get.offNamed(addphases, arguments: controller.user);
                  }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Phases',
                        onTap: () {
                          Get.offNamed(phaseorsocietybuilding,
                              arguments: controller.user);
                        },
                      ),
                      32.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: controller.phasesApi(
                                  societyid: controller.user.societyid!,
                                  token: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data != null &&
                                      snapshot.data.data.length != 0) {
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
                                            // Get.offNamed(blocks, arguments: [
                                            //   snapshot.data.data[index].id,
                                            //   user.bearerToken
                                            // ]);

                                            // Get.toNamed(blockorbuilding,
                                            //     arguments: [
                                            //       snapshot
                                            //           .data.data[index].id,
                                            //       user.bearerToken
                                            //     ]

                                            //     );
                                            Get.offNamed(phasebuildingorblock,
                                                arguments: [
                                                  controller.user,
                                                  snapshot.data.data[index].id,
                                                ]);
                                          },
                                          text: snapshot
                                              .data.data[index].address
                                              .toString(),
                                        );
                                      },
                                    );
                                  } else {
                                    return EmptyList(
                                      name: 'No Phases',
                                    );
                                  }
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
