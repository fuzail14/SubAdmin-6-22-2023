import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';

import '../Controller/apartment_resident_verification_controller.dart';
import '../Model/Resident Model/ApartmentResidentModel.dart';
import '../Widget/custom_text.dart';
import '../Widget/first_custom_container.dart';

class ApartmentResidentVerification extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ApartmentResidentVerificationController>(
          init: ApartmentResidentVerificationController(),
          builder: (controller) {
            return WillPopScope(
              onWillPop: () async {
                Get.offNamed(unverifiedresident,
                    arguments: controller.userdata);
                return true;
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyBackButton(
                      text: 'Apartment Resident Verification',
                      onTap: () {
                        Get.offNamed(unverifiedresident,
                            arguments: controller.userdata);
                      },
                    ),
                    16.ph,
                    FirstCustomContainer(
                        ImageBaseUrl: Api.imageBaseUrl +
                            controller.resident.image.toString(),
                        Name: controller.resident.firstname.toString() +
                            "" +
                            controller.resident.lastname.toString(),
                        MobileNo: controller.resident.mobileno.toString(),
                        Cnic: controller.resident.cnic.toString(),
                        VehicleNo: controller.resident.vechileno.toString(),
                        ResidentalType:
                            controller.resident.residenttype.toString(),
                        Status: controller.resident.status.toString()),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.only(left: 22.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomUnverifiedText(text: "Select Building*"),
                          8.ph,
                          DropdownSearch<Building>(
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            asyncItems: (String filter) async {
                              print(filter);
                              return controller.viewAllBuildingApi(
                                bearerToken: controller.userdata!.bearerToken!,
                                subAdminId: controller.userdata!.userid,
                              );
                            },
                            onChanged: (Building? data) {
                              controller.SelectedBuilding(data);
                            },
                            selectedItem: controller.building,
                            itemAsString: (Building p) {
                              return p.societybuildingname.toString();
                            },
                          ),
                          16.ph,
                          CustomUnverifiedText(text: "Select Floor*"),
                          8.ph,
                          DropdownSearch<Floor>(
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            asyncItems: (String filter) async {
                              print(filter);
                              return controller.viewAllFloorApi(
                                  bearerToken:
                                      controller.userdata!.bearerToken!,
                                  buildingid: controller.building?.id);
                            },
                            onChanged: (Floor? data) {
                              controller.SelectedFloor(data);
                            },
                            selectedItem: controller.floor,
                            itemAsString: (Floor p) {
                              return p.name.toString();
                            },
                          ),
                          16.ph,
                          CustomUnverifiedText(text: "Select Apartment*"),
                          8.ph,
                          DropdownSearch<Apartment>(
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            asyncItems: (String filter) async {
                              print(filter);
                              return controller.viewAllApartmentApi(
                                  bearerToken:
                                      controller.userdata!.bearerToken!,
                                  floorid: controller.floor?.id);
                            },
                            onChanged: (Apartment? apartment) {
                              controller.SelectedApartment(apartment);
                              controller.houseaddressdetailController.text =
                                  "${controller.resident.society!.first.name}${','}${controller.building!.societybuildingname.toString()}${','} ${controller.floor!.name.toString()}${','}${apartment!.name.toString()}";
                            },
                            selectedItem: controller.apartment,
                            itemAsString: (Apartment p) {
                              return p.name.toString();
                            },
                          ),
                          16.ph,
                          CustomUnverifiedText(text: "Select Area Type*"),
                          8.ph,
                          DropdownSearch<Measurement>(
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            asyncItems: (String filter) async {
                              print(filter);
                              return controller.housesApartmentsModelApi(
                                  subadminid: controller.userdata!.userid!,
                                  token: controller.userdata!.bearerToken!,
                                  type: 'apartment');
                            },
                            onChanged: (Measurement? data) {
                              controller.SelectedHousesApartments(data);
                            },
                            selectedItem: controller.measurementModel,
                            itemAsString: (Measurement p) {
                              return p.area.toString() +
                                  ' ' +
                                  p.unit.toString();
                            },
                          ),
                          20.ph,
                          Text(
                            controller.houseaddressdetailController.text,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              color: primaryColor,
                              fontSize: 14.font,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          20.ph,
                          Center(
                            child: MyButton(
                              onPressed: () {
                                controller.verifyApartmentResidentApi(
                                    residentid: controller.resident.residentid,
                                    status: 1,
                                    token: controller.userdata.bearerToken!,
                                    measurementid:
                                        controller.measurementModel!.id,
                                    buildingid: controller.building!.id!,
                                    societybuildingfloorid:
                                        controller.floor!.id!,
                                    societybuildingapartmentid:
                                        controller.apartment!.id!,
                                    vechileno:
                                        controller.vehiclenoController.text,
                                    houseaddress: controller
                                        .houseaddressdetailController.text);
                              },
                              name: 'Verify',
                              width: 328.w,
                              height: 52.h,
                              fontSize: 20.font,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          20.ph,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
