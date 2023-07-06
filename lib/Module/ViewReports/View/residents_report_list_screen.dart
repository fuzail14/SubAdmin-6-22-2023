import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/ReportsScreenCard/reports_screen_card.dart';
import '../Controller/resident_reports_controller.dart';
import '../Model/ResidentReports.dart';

class UserReportsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResidentReportsController>(
      init: ResidentReportsController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.offNamed(viewreportscreen, arguments: controller.userdata);
          return true;
        },
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  MyBackButton(
                    text: 'Reports',
                    onTap: () {
                      Get.offNamed(viewreportscreen,
                          arguments: controller.userdata);
                    },
                  ),
                  Expanded(
                    child: FutureBuilder<List<ResidentReports>>(
                        future: controller.viewResidentsReportsApi(
                            controller.userdata.userid!,
                            controller.residentId,
                            controller.userdata.bearerToken!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data != null &&
                                snapshot.data!.length != 0) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return ReportsScreenCard(
                                    heading:
                                        snapshot.data![index].title.toString(),
                                    heading1:
                                        snapshot.data![index].title.toString(),
                                    heading2: snapshot.data![index].description,
                                    buttonName: 'In Progress',
                                    color: HexColor('#D20C0C'),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0))),
                                          contentPadding:
                                              EdgeInsets.only(top: 10.0),
                                          title: Text("Report Detail"),
                                          content: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'Title:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data![index].title!,
                                                      style: TextStyle(),
                                                    ),
                                                    Text(
                                                      'Description',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      snapshot.data![index]
                                                          .description!,
                                                      textAlign: TextAlign.start,
                                                    ),
                                                    Text(
                                                      'Name:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      controller.residentName,
                                                    ),
                                                    Text(
                                                      'Address:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      controller.residentAddress,
                                                    ),
                                                    Text(
                                                      'Mobile No',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      controller.residentMobileno,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width: 400,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    primaryColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(20),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12.0),
                                                            child: Column(
                                                              children: [
                                                                Row(children: [
                                                                  Text(
                                                                    'Status',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 12,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .statusdescription!,
                                                                  ),
                                                                ]),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Center(
                                                      child: MyButton(
                                                        name: 'Ok',
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      );
                                    },
                                  );
                                },
                                itemCount: snapshot.data!.length,
                              );
                            } else {
                              return Text('no resident');
                            }
                          } else if (snapshot.hasError) {
                            return Icon(Icons.error_outline);
                          } else {
                            return Center(
                                child: CircularProgressIndicator(
                              color: primaryColor,
                            ));
                          }
                        }),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
