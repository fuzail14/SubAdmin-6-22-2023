import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Module/Measurements/Controller/add_measurements_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';

import '../../../Constants/constants.dart';

class AddMeasurements extends GetView {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('build');
    return GetBuilder<AddMeasurementController>(
        init: AddMeasurementController(),
        builder: (controller) {
          return SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                await Get.offNamed(measurementview, arguments: controller.user);

                return true;
              },
              child: Scaffold(
                body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyBackButton(
                              text: 'Add Measurements',
                              onTap: () {
                                Get.offNamed(measurementview,
                                    arguments: controller.user);
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Property Type',
                                    style: GoogleFonts.ubuntu(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: DropdownButton<String>(
                                        onTap: () {
                                          controller.measurements_types.clear();
                                          controller.unitVal = null;
                                        },
                                        isExpanded: true,
                                        value: controller.propertyVal,
                                        items: controller.property_types
                                            .map<DropdownMenuItem<String>>(
                                                (String e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e.toString())))
                                            .toList(),
                                        onChanged: (val) {
                                          controller.setPropertyVal(val);
                                          print(controller.propertyVal);

                                          if (controller.propertyVal ==
                                              'house') {
                                            controller.measurements_types
                                                .clear();
                                            controller.measurements_types
                                                .addAll(['marla', 'kanal']);
                                            controller.clearText();
                                          } else if (controller.propertyVal ==
                                              'apartment') {
                                            controller.measurements_types
                                                .clear();
                                            controller.measurements_types
                                                .add('sqft');
                                            controller.clearText();
                                          }
                                        }),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Unit Type',
                                    style: GoogleFonts.ubuntu(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: controller.unitVal,
                                        items: controller.measurements_types
                                            .map<DropdownMenuItem<String>>(
                                                (String e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e.toString())))
                                            .toList(),
                                        onChanged: (val) {
                                          controller.setMeasurementVal(val);
                                          print(controller.unitVal);

                                          if (controller.unitVal != null) {
                                            controller.setArea();
                                            controller.unitLabel =
                                                controller.unitVal;
                                          }
                                        }),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Service Charges',
                                    style: GoogleFonts.ubuntu(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: TextFormField(
                                      // onChanged: (val) {
                                      //   // controller.calculate(val);
                                      //
                                      //   if (controller
                                      //       .chargesController.text.isEmpty) {
                                      //     controller.clearText();
                                      //   }
                                      // },
                                      validator: emptyStringValidator,
                                      controller: controller.chargesController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white10,
                                        filled: true,
                                        border: InputBorder.none,
                                        hintText: 'Charges',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Late Charges',
                                    style: GoogleFonts.ubuntu(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: TextFormField(
                                      validator: emptyStringValidator,
                                      controller:
                                          controller.lateChargesController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white10,
                                        filled: true,
                                        border: InputBorder.none,
                                        hintText: 'Late Charges',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'App Charges',
                                    style: GoogleFonts.ubuntu(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: TextFormField(
                                      validator: emptyStringValidator,
                                      controller:
                                          controller.appChargesController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white10,
                                        filled: true,
                                        border: InputBorder.none,
                                        hintText: 'App Charges',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tax',
                                    style: GoogleFonts.ubuntu(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: TextFormField(
                                      validator: emptyStringValidator,
                                      controller: controller.taxController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white10,
                                        filled: true,
                                        border: InputBorder.none,
                                        hintText: 'Tax',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              controller.isArea
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.unitLabel!,
                                          style: GoogleFonts.ubuntu(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                          child: TextFormField(
                                            validator: emptyStringValidator,
                                            controller:
                                                controller.areaController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white10,
                                              filled: true,
                                              border: InputBorder.none,
                                              hintText: controller.unitLabel,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                  child: MyButton(
                                name: 'Add',
                                onPressed: controller.isLoading
                                    ? null
                                    : () async {
                                        if (controller.propertyVal == null) {
                                          Get.snackbar('Required',
                                              'Select Property Type');
                                        } else if (controller.unitVal == null) {
                                          Get.snackbar(
                                              'Required', 'Select Unit Type');
                                        } else {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await controller.addMeasurementApi(
                                                userid: controller.user.userid!,
                                                bearerToken: controller
                                                    .user.bearerToken
                                                    .toString(),
                                                propertyType:
                                                    controller.propertyVal!,
                                                charges: controller
                                                    .chargesController.text,
                                                unitType: controller.unitVal!,
                                                area: controller
                                                    .areaController.text,
                                                appCharges: controller
                                                    .appChargesController.text,
                                                lateCharges: controller
                                                    .lateChargesController.text,
                                                tax: controller
                                                    .taxController.text);
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          }
                                        }
                                      },
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
