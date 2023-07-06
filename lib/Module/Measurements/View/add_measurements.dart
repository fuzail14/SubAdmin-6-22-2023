import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/Measurements/Controller/add_measurements_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/MyDropDown/my_drop_down.dart';
import '../Widget/Custom_TextField.dart';

class AddMeasurements extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMeasurementController>(
        init: AddMeasurementController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              await Get.offNamed(measurementview, arguments: controller.user);

              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyBackButton(
                            text: 'Add Measurements',
                            onTap: () {
                              Get.offNamed(measurementview,
                                  arguments: controller.user);
                            }),
                        28.ph,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add Measurements Below:',
                                style: GoogleFonts.quicksand(
                                  color: Color(0xFFFFA115),
                                  fontSize: 16.font,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              22.ph,
                              MyDropDown(
                                  upperHeading: 'Property Type',
                                  onTap: () {
                                    controller.measurements_types.clear();
                                    controller.unitVal = null;
                                  },
                                  value: controller.propertyVal,
                                  items: controller.property_types
                                      .map<DropdownMenuItem<String>>((String e) =>
                                          DropdownMenuItem(
                                              value: e,
                                              child: Text(e.toString())))
                                      .toList(),
                                  onChanged: (val) {
                                    controller.setPropertyVal(val);
                                    print(controller.propertyVal);
            
                                    if (controller.propertyVal == 'house') {
                                      controller.measurements_types.clear();
                                      controller.measurements_types
                                          .addAll(['marla', 'kanal']);
                                      controller.clearText();
                                    } else if (controller.propertyVal ==
                                        'apartment') {
                                      controller.measurements_types.clear();
                                      controller.measurements_types.add('sqft');
                                      controller.clearText();
                                    }
                                  }),
                              16.ph,
                              MyDropDown(
                                  upperHeading: 'Unit Type',
                                  onTap: () {},
                                  value: controller.unitVal.toString(),
                                  items: controller.measurements_types
                                      .map<DropdownMenuItem<String>>((String e) =>
                                          DropdownMenuItem(
                                              value: e,
                                              child: Text(e.toString())))
                                      .toList(),
                                  onChanged: (val) {
                                    controller.setMeasurementVal(val);
                                    print(controller.unitVal);
            
                                    if (controller.unitVal != null) {
                                      controller.setArea();
                                      controller.unitLabel = controller.unitVal;
                                    }
                                  }),
                              16.ph,
                              SpanText(text: 'Services Charges'),
                              8.ph,
                              CustomTextField(
                                  controller: controller.chargesController,
                                  hintText: '5000'),
                              16.ph,
                              SpanText(text: 'Late Charges'),
                              8.ph,
                              CustomTextField(
                                  controller: controller.lateChargesController,
                                  hintText: 'Late Charges'),
                              16.ph,
                              SpanText(text: 'App Charges'),
                              8.ph,
                              CustomTextField(
                                  controller: controller.appChargesController,
                                  hintText: '100.0'),
                              16.ph,
                              SpanText(text: 'Tax'),
                              8.ph,
                              CustomTextField(
                                  controller: controller.taxController,
                                  hintText: '20.0'),
                              16.ph,
                              if (controller.isArea) ...[
                                SpanText(text: 'Type'),
                                8.ph,
                                CustomTextField(
                                  controller: controller.areaController,
                                  hintText: controller.unitLabel,
                                )
                              ]
                            ],
                          ),
                        ),
                        29.ph,
                        Center(
                            child: MyButton(
                          width: 328.w,
                          height: 52.h,
                          borderRadius: BorderRadius.circular(12.r),
                          name: 'Add',
                          onPressed: controller.isLoading
                              ? null
                              : () async {
                                  if (controller.propertyVal == null) {
                                    Get.snackbar(
                                        'Required', 'Select Property Type');
                                  } else if (controller.unitVal == null) {
                                    Get.snackbar('Required', 'Select Unit Type');
                                  } else {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      await controller.addMeasurementApi(
                                          userid: controller.user.userid!,
                                          bearerToken: controller.user.bearerToken
                                              .toString(),
                                          propertyType: controller.propertyVal!,
                                          charges:
                                              controller.chargesController.text,
                                          unitType: controller.unitVal!,
                                          area: controller.areaController.text,
                                          appCharges: controller
                                              .appChargesController.text,
                                          lateCharges: controller
                                              .lateChargesController.text,
                                          tax: controller.taxController.text);
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  }
                                },
                        )),
                        17.ph,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
