import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Controller/unverified_resident_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Widget/unverified_resident_custom_widget.dart';

class UnVerifiedResident extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnVerifiedResidentController>(
      init: UnVerifiedResidentController(),
      builder: (controller) => WillPopScope(
          onWillPop: () async {
            Get.offNamed(homescreen, arguments: controller.user);
            return true;
          },
          child: DefaultTabController(
            length: 2,
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: HexColor('#F5F5F5'),
                  body: (controller.userdata.structureType == 4)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyBackButton(
                              text: 'UnVerified Residents',
                              onTap: () {
                                Get.offNamed(homescreen,
                                    arguments: controller.user);
                              },
                            ),
                            Expanded(
                              child: FutureBuilder(
                                  future: controller
                                      .viewUnVerifiedLocalBuildingApartmentResidentApi(
                                          subadminid:
                                              controller.userdata.userid!,
                                          token:
                                              controller.userdata.bearerToken!,
                                          status: 0),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.data != null &&
                                          snapshot.data.data!.length != 0) {
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            print(snapshot
                                                .data.data[index].runtimeType);

                                            return UnverifiedCard(
                                              onTap: () {
                                                Get.offNamed(
                                                    localBuildingApartmentResidentVerification,
                                                    arguments: [
                                                      controller.userdata,
                                                      snapshot.data.data[index]
                                                    ]);
                                              },
                                              name: snapshot.data.data[index]
                                                      .firstname
                                                      .toString() +
                                                  ' ' +
                                                  snapshot
                                                      .data.data[index].lastname
                                                      .toString(),
                                              mobileno: snapshot
                                                  .data.data[index].mobileno
                                                  .toString(),
                                            );
                                          },
                                          itemCount: snapshot.data.data.length,
                                        );
                                      } else {
                                        return EmptyList(
                                          name: 'No Resident for Verification',
                                        );
                                      }
                                    } else if (snapshot.hasError) {
                                      return Icon(Icons.error_outline);
                                    } else {
                                      return Loader();
                                    }
                                  }),
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyBackButton(
                              text: 'UnVerified Residents',
                              onTap: () {
                                Get.offNamed(homescreen,
                                    arguments: controller.user);
                              },
                            ),
                            32.ph,
                            Container(
                              margin: EdgeInsets.only(left: 23.w, right: 23.w),
                              width: 329.w,
                              height: 39.h,
                              decoration: ShapeDecoration(
                                  color: Color(0x28FFA115),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.w, color: Color(0xFFFFA115)),
                                    borderRadius: BorderRadius.circular(8.r),
                                  )),
                              child: TabBar(
                                unselectedLabelColor: Color(0xFF5A5A5A),
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelColor: Colors.white,
                                indicator: ShapeDecoration(
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r)),
                                ),
                                indicatorColor: primaryColor,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      'House',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Apartment',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            30.ph,
                            Expanded(
                              child: TabBarView(
                                children: [
                                  // HOUSE VERIFICATION
                                  GetBuilder<UnVerifiedResidentController>(
                                      id: 'houseTab',
                                      builder: (controller) {
                                        final cachedData = controller
                                            .getCachedUnverifiedResidentData(
                                                controller.userdata.userid!,
                                                controller
                                                    .userdata.bearerToken!,
                                                0);
                                        if (cachedData != null) {
                                          return ListView.builder(
                                            itemBuilder: (context, index) {
                                              return UnverifiedCard(
                                                onTap: () {
                                                  Get.offNamed(
                                                      houseresidentverification,
                                                      arguments: [
                                                        controller.userdata,
                                                        cachedData[index]
                                                      ]);
                                                },
                                                name: cachedData[index]
                                                        .firstname
                                                        .toString() +
                                                    ' ' +
                                                    cachedData[index]
                                                        .lastname
                                                        .toString(),
                                                mobileno: cachedData[index]
                                                    .mobileno
                                                    .toString(),
                                              );
                                            },
                                            itemCount: cachedData.length,
                                          );
                                        } else {
                                          return FutureBuilder(
                                            future: controller
                                                .viewUnVerifiedResidentApi(
                                              subadminid:
                                                  controller.userdata.userid!,
                                              token: controller
                                                  .userdata.bearerToken!,
                                              status: 0,
                                            ),
                                            builder: (context,
                                                AsyncSnapshot snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Loader();
                                              } else if (snapshot.hasData) {
                                                if (snapshot.data.data !=
                                                        null &&
                                                    snapshot.data.data!
                                                            .length !=
                                                        0) {
                                                  controller
                                                      .cacheUnverifiedResidentData(
                                                          snapshot.data.data,
                                                          0);
                                                  return ListView.builder(
                                                    itemBuilder:
                                                        (context, index) {
                                                      return UnverifiedCard(
                                                        onTap: () {
                                                          Get.offNamed(
                                                              houseresidentverification,
                                                              arguments: [
                                                                controller
                                                                    .userdata,
                                                                snapshot.data
                                                                    .data[index]
                                                              ]);
                                                        },
                                                        name: snapshot
                                                                .data
                                                                .data[index]
                                                                .firstname
                                                                .toString() +
                                                            ' ' +
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .lastname
                                                                .toString(),
                                                        mobileno: snapshot
                                                            .data
                                                            .data[index]
                                                            .mobileno
                                                            .toString(),
                                                      );
                                                    },
                                                    itemCount: snapshot
                                                        .data.data.length,
                                                  );
                                                } else {
                                                  return EmptyList(
                                                    name:
                                                        'No Resident for Verification',
                                                  );
                                                }
                                              } else if (snapshot.hasError) {
                                                return Icon(
                                                    Icons.error_outline);
                                              } else {
                                                return EmptyList(
                                                  name:
                                                      'No Resident for Verification',
                                                );
                                              }
                                            },
                                          );
                                        }
                                      }),

                                  // APARTMENT VERIFICATION
                                  GetBuilder<UnVerifiedResidentController>(
                                    id: 'apartmentTab',
                                    builder: (controller) {
                                      final cachedData = controller
                                          .getCachedUnverifiedResidentData(
                                              controller.userdata.userid!,
                                              controller.userdata.bearerToken!,
                                              1);
                                      if (cachedData != null) {
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return UnverifiedCard(
                                              onTap: () {
                                                Get.offNamed(
                                                    apartmentresidentverification,
                                                    arguments: [
                                                      controller.userdata,
                                                      cachedData[index]
                                                    ]);
                                              },
                                              name: cachedData[index]
                                                      .firstname
                                                      .toString() +
                                                  ' ' +
                                                  cachedData[index]
                                                      .lastname
                                                      .toString(),
                                              mobileno: cachedData[index]
                                                  .mobileno
                                                  .toString(),
                                            );
                                          },
                                          itemCount: cachedData.length,
                                        );
                                      } else {
                                        return FutureBuilder(
                                          future: controller
                                              .viewUnVerifiedApartmentResidentApi(
                                                  subadminid: controller
                                                      .userdata.userid!,
                                                  token: controller
                                                      .userdata.bearerToken!,
                                                  status: 0),
                                          builder: (context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Loader();
                                            } else if (snapshot.hasData) {
                                              if (snapshot.data.data != null &&
                                                  snapshot.data.data!.length !=
                                                      0) {
                                                controller
                                                    .cacheUnverifiedResidentData(
                                                        snapshot.data.data, 1);
                                                return ListView.builder(
                                                  itemBuilder:
                                                      (context, index) {
                                                    return UnverifiedCard(
                                                        onTap: () {
                                                          Get.offNamed(
                                                              apartmentresidentverification,
                                                              arguments: [
                                                                controller
                                                                    .userdata,
                                                                snapshot.data
                                                                    .data[index]
                                                              ]);
                                                        },
                                                        name: snapshot
                                                                .data
                                                                .data[index]
                                                                .firstname
                                                                .toString() +
                                                            ' ' +
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .lastname
                                                                .toString(),
                                                        mobileno: snapshot
                                                            .data
                                                            .data[index]
                                                            .mobileno
                                                            .toString());
                                                  },
                                                  itemCount:
                                                      snapshot.data.data.length,
                                                );
                                              } else {
                                                return EmptyList(
                                                  name:
                                                      'No Resident for Verification',
                                                );
                                              }
                                            } else if (snapshot.hasError) {
                                              return Icon(Icons.error_outline);
                                            } else {
                                              return EmptyList(
                                                name:
                                                    'No Resident for Verification',
                                              );
                                            }
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
            ),
          )),
    );
  }
}
