import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/Measurements/Controller/measurement_view_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../Constants/constants.dart';

class MeasurementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeasurementViewController>(
        init: MeasurementViewController(),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: SafeArea(
              child: Scaffold(
                floatingActionButton: IconButton(
                    padding: EdgeInsets.only(top: 85),
                    iconSize: MediaQuery.of(context).size.height * 0.065,
                    icon: SvgPicture.asset('assets/floatingbutton.svg'),
                    onPressed: () {
                      Get.offNamed(addmeasurements, arguments: controller.user);
                    }),
                body: Column(
                  children: [
                    MyBackButton(text: 'Measurement View'),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: primaryColor,
                      tabs: [
                        Tab(
                          child: Text('Houses',
                              style: TextStyle(color: primaryColor)),
                        ),
                        Tab(
                          child: Text('Apartments',
                              style: TextStyle(color: primaryColor)),
                        ),
                      ],
                      labelColor: primaryColor,
                      unselectedLabelColor: Colors.grey,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          FutureBuilder(
                              future: controller.housesApartmentsModelApi(
                                  subadminid: controller.user.userid!,
                                  token: controller.user.bearerToken!,
                                  type: 'house'),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.22,
                                          child: Card(
                                            child: Column(
                                              children: [
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.symmetric(
                                                //           horizontal: 80,
                                                //           vertical: 6),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .spaceBetween,
                                                //     children: [
                                                //       Text(
                                                //         'Property Type',
                                                //         style: GoogleFonts.ubuntu(
                                                //           fontStyle:
                                                //               FontStyle.normal,
                                                //           fontWeight:
                                                //               FontWeight.w400,
                                                //           fontSize: 12,
                                                //         ),
                                                //       ),
                                                //       Text(
                                                //         snapshot.data.data[index]
                                                //             .type,
                                                //         style: GoogleFonts.ubuntu(
                                                //           fontStyle:
                                                //               FontStyle.normal,
                                                //           fontWeight:
                                                //               FontWeight.w400,
                                                //           fontSize: 12,
                                                //         ),
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 80,
                                                      vertical: 6),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Unit Type ',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot.data
                                                            .data[index].unit,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 80,
                                                      vertical: 6),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Service Charges ',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot.data
                                                            .data[index].charges
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 80,
                                                      vertical: 6),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Tax',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot.data
                                                            .data[index].tax
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 80,
                                                      vertical: 6),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'App Charges',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data
                                                            .data[index]
                                                            .appcharges
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 80,
                                                      vertical: 6),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Area',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot
                                                                .data
                                                                .data[index]
                                                                .area
                                                                .toString() +
                                                            ' ' +
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .unit
                                                                .toString(),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Loader();
                                }
                              }),
                          FutureBuilder(
                              future: controller.housesApartmentsModelApi(
                                  subadminid: controller.user.userid!,
                                  token: controller.user.bearerToken!,
                                  type: 'apartment'),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        child: Card(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 80,
                                                        vertical: 6),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Property Type',
                                                      style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data.data[index]
                                                          .type,
                                                      style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 80,
                                                        vertical: 6),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Unit Type ',
                                                      style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data.data[index]
                                                          .unit,
                                                      style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 80,
                                                        vertical: 6),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Service Charges ',
                                                      style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data.data[index]
                                                          .charges
                                                          .toString(),
                                                      style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 80,
                                                        vertical: 6),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Area',
                                                      style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data.data[index]
                                                              .area
                                                              .toString() +
                                                          snapshot.data
                                                              .data[index].unit
                                                              .toString(),
                                                      style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Loader();
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
