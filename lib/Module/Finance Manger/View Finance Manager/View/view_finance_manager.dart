import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Module/Finance%20Manger/View%20Finance%20Manager/Controller/view_finance_manager_controller.dart';
import 'package:societyadminapp/Module/Finance%20Manger/View%20Finance%20Manager/Model/FinanceManagerModel.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/DetailShownDialogBox/Detail_shown_dialog_box.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Dialog Box/my_dialog_box.dart';
import '../../../../Widgets/ResidentNGateKeeperViewCard/resident_n_gatekeeper_view_card.dart';

class ViewFinanceManager extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewFinanceManagerController>(
      init: ViewFinanceManagerController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          await Get.offNamed(homescreen, arguments: controller.userdata);

          return true;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: HexColor('#F5F5F5'),
            body: Column(
              children: [
                MyBackButton(
                  text: "Finance Managers",
                  onTap: () {
                    Get.offNamed(homescreen, arguments: controller.userdata);
                  },
                ),
                16.ph,
                Expanded(
                  child: FutureBuilder<FinanceManagerModel>(
                      future: controller.financeManagerViewApi(
                          subAdminId: controller.user.userid!,
                          bearerToken: controller.user.bearerToken,
                          context: context),
                      builder: (BuildContext context,
                          AsyncSnapshot<FinanceManagerModel> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          insetAnimationCurve: Curves.bounceIn,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: SizedBox(
                                            height: 450.h,
                                            child: Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Column(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        snapshot
                                                                .data!
                                                                .data![index]
                                                                .firstname! +
                                                            " " +
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .lastname!,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: HexColor(
                                                              '#4D4D4D'),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: ScreenUtil()
                                                              .setSp(18),
                                                        ),
                                                      ),
                                                      10.ph,
                                                      Text(
                                                        snapshot
                                                            .data!
                                                            .data![index]
                                                            .mobileno!,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#1A1A1A'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            16)),
                                                      ),
                                                    ],
                                                  ),
                                                  20.ph,
                                                  DetailShownDialogBox(
                                                    icon:
                                                        'assets/personsvg.svg',
                                                    heading: 'Name',
                                                    text: snapshot
                                                            .data!
                                                            .data![index]
                                                            .firstname! +
                                                        " " +
                                                        snapshot
                                                            .data!
                                                            .data![index]
                                                            .lastname!,
                                                  ),
                                                  DetailShownDialogBox(
                                                      icon:
                                                          'assets/contactsvg.svg',
                                                      heading: 'Mobile No',
                                                      text: snapshot.data!
                                                          .data![index].mobileno
                                                          .toString()),
                                                  DetailShownDialogBox(
                                                      icon:
                                                          'assets/addresssvg.svg',
                                                      heading: 'Address',
                                                      text: snapshot
                                                          .data!
                                                          .data![index]
                                                          .address),
                                                  DetailShownDialogBox(
                                                      icon:
                                                          'assets/cnicsvg.svg',
                                                      heading: 'CNIC',
                                                      text: snapshot.data!
                                                          .data![index].cnic)
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: ResidentsNGateKeeperViewCard(
                                  image: Api.imageBaseUrl +
                                      snapshot.data!.data![index].image
                                          .toString(),
                                  name: snapshot.data!.data![index].firstname
                                      .toString(),
                                  mobileno: snapshot.data!.data![index].mobileno
                                      .toString(),
                                  DeleteDialogPress: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CustomDialog(
                                            image: SvgPicture.asset(
                                                "assets/showdialog_delete_icon.svg",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06),
                                            negativeBtnPressed: () {
                                              Get.back();
                                            },
                                            title: "Are you sure !",
                                            content:
                                                "Do you want to delete this?",
                                            positiveBtnText: "Delete",
                                            negativeBtnText: "Cancel",
                                            positiveBtnPressed: () async {
                                              controller
                                                  .financeManagerDeleteApi(
                                                      financeManagerId: snapshot
                                                          .data!
                                                          .data![index]
                                                          .financemanagerid,
                                                      bearerToken: controller
                                                          .user.bearerToken,
                                                      context: context);
                                              Get.back();
                                            },
                                          );
                                        });
                                  },
                                  updateOnPressed: () {
                                    print(snapshot
                                        .data!.data![index].runtimeType);

                                    Get.offNamed(updateFinanceManager,
                                        arguments: [
                                          controller.user,
                                          snapshot.data!.data![index]
                                        ]);
                                    //
                                  },
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
                )
              ],
            ),
            floatingActionButton: IconButton(
                padding: EdgeInsets.only(top: 85),
                iconSize: MediaQuery.of(context).size.height * 0.065,
                icon: SvgPicture.asset('assets/floatingbutton.svg'),
                onPressed: () {
                  Get.offAndToNamed(addFinanceManager,
                      arguments: controller.user);
                }),
          ),
        ),
      ),
    );
  }
}
