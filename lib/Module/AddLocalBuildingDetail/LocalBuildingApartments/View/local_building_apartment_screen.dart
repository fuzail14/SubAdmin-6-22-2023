import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/MyFloatingButton/My_Floating_Button.dart';
import '../../../AddSocietyDetail/Widget/Custom_Grid.dart';
import '../Controller/local_building_apartment_controller.dart';

class LocalBuildingApartmentScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalBuildingApartmentController>(
        init: LocalBuildingApartmentController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offAndToNamed(localbuildingfloorsscreen,
                  arguments: controller.user);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: MyFloatingButton(onPressed: () {
                    Get.offAndToNamed(addlocalbuildingapartmentsscreen,
                        arguments: [
                          controller.user,
                          controller.fid,
                        ]);
                  }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Apartments',
                        onTap: () {
                          Get.offAndToNamed(localbuildingfloorsscreen,
                              arguments: controller.user);
                        },
                      ),
                      16.ph,
                      Expanded(
                          child: FutureBuilder(
                              future: controller.LocalBuildingApartmentsApi(
                                  fid: controller.fid!,
                                  bearerToken: controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
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
                                        onTap: () {},
                                        text: snapshot.data.data[index].name
                                            .toString(),
                                        image: SvgPicture.asset(
                                          'assets/apartmentsvg.svg',
                                          color: HexColor('ff7f00'),
                                          height: 40.h,
                                          width: 40.w,
                                        ),
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
