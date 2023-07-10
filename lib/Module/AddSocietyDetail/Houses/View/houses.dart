import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Houses/Controller/houses_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/MyFloatingButton/My_Floating_Button.dart';

class Houses extends GetView<HouseController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HouseController>(
        init: HouseController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.user.structureType == 5) {
                await Get.offNamed(
                    structureType5HouseOrBuildingMiddlewareScreen,
                    arguments: controller.user);
              } else if (controller.user.structureType == 1) {
                await Get.offNamed(streets, arguments: controller.user);
              } else if (controller.user.structureType == 2) {
                await Get.offNamed(streets,
                    arguments: [controller.user, controller.blockid]);
              } else if (controller.user.structureType == 3) {
                await Get.offNamed(streets, arguments: [
                  controller.user,
                  controller.blockid,
                  controller.phaseid
                ]);
              }

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: MyFloatingButton(
                    onPressed: () {
                      if (controller.user.structureType == 5) {
                        Get.offNamed(addhouses, arguments: controller.user);
                      } else if (controller.user.structureType == 1) {
                        Get.offNamed(addhouses,
                            arguments: [controller.user, controller.streetid]);
                      } else if (controller.user.structureType == 2) {
                        Get.offNamed(addhouses, arguments: [
                          controller.user,
                          controller.streetid,
                          controller.blockid
                        ]);
                      } else if (controller.user.structureType == 3) {
                        Get.offNamed(addhouses, arguments: [
                          controller.user,
                          controller.streetid,
                          controller.blockid,
                          controller.phaseid
                        ]);
                      }

                      // Get.offAndToNamed(addblocks,arguments: [controller.pid,controller.bearerToken]);
                    },
                  ),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Houses',
                        onTap: () {
                          if (controller.user.structureType == 5) {
                            Get.offNamed(
                                structureType5HouseOrBuildingMiddlewareScreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 1) {
                            Get.offNamed(streets, arguments: controller.user);
                          } else if (controller.user.structureType == 2) {
                            Get.offNamed(streets, arguments: [
                              controller.user,
                              controller.blockid
                            ]);
                          } else if (controller.user.structureType == 3) {
                            Get.offNamed(streets, arguments: [
                              controller.user,
                              controller.blockid,
                              controller.phaseid
                            ]);
                          }
                        },
                      ),
                      16.ph,
                      Expanded(
                          child:
                              // (controller.structuretype == 2 ||
                              //         controller.structuretype == 3 ||
                              //         controller.structuretype == 4)
                              //     ?
                              FutureBuilder(
                                  future: (controller.user.structureType == 5)
                                      ? controller.housesApi(
                                          dynamicid: controller.user.societyid!,
                                          bearerToken:
                                              controller.user.bearerToken!)
                                      : controller.housesApi(
                                          dynamicid: controller.streetid,
                                          bearerToken:
                                              controller.user.bearerToken!),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data != null &&
                                          snapshot.data.data.length != 0) {
                                        return ListView.builder(
                                          itemCount: snapshot.data.data.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 64.h,
                                                  child: Card(
                                                    margin: EdgeInsets.only(
                                                        left: 20.w,
                                                        right: 20.w),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0.r),
                                                    ),
                                                    color: HexColor('#F3F3F3'),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 20.w,
                                                                  right: 20.w),
                                                          height: 43.h,
                                                          width: 43.w,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      153,
                                                                      0,
                                                                      0.14),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/house1.png'))),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .address
                                                                    .toString(),
                                                                style: GoogleFonts
                                                                    .ubuntu(
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        // color: secondaryColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            18,
                                                                        color: HexColor(
                                                                            '#4D4D4D')),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Container(
                                                            height: 21.h,
                                                            width: 28.w,
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    153,
                                                                    0,
                                                                    0.24),
                                                            child: Image(
                                                                image: AssetImage(
                                                                    'assets/arrowfrwd.png')),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                10.ph,
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        return EmptyList(name: 'No Houses');
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
