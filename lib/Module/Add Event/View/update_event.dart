import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Constants/constants.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import 'package:societyadminapp/Widgets/UpIcon/up_icon.dart';

import '../../../Routes/set_routes.dart';
import '../Controller/update_event_controller.dart';

class UpdateEvent extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UpdateEventScreenController>(
            init: UpdateEventScreenController(),
            builder: (controller) {
              return WillPopScope(
                onWillPop: () async {
                  Get.offNamed(eventsscreen, arguments: controller.user);

                  return true;
                },
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        MyBackButton(
                          text: 'Update Event',
                          onTap: () {
                            Get.offNamed(eventsscreen,
                                arguments: controller.user);
                          },
                        ),
                        32.ph,

                        SvgPicture.asset(
                          "assets/event_vector.svg",
                        ),
                        52.ph,

                        MyTextFormField(
                          controller: controller.eventTitleController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event Title',
                          labelText: 'Event Title',
                        ),
                        MyTextFormField(
                          controller: controller.eventDescriptionController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event Description',
                          labelText: 'Event Description',
                        ),
                        MyTextFormField(
                          onTap: () {
                            controller.StartDate(context);
                          },
                          suffixIcon: SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown),
                          controller: controller.eventStartDateController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event Start Date',
                          labelText: 'Start Date',
                        ),
                        MyTextFormField(
                          onTap: () {
                            controller.EndDate(context);
                          },
                          suffixIcon: SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown),
                          controller: controller.eventEndDateController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event End Date',
                          labelText: 'End Date',
                        ),
                        // CheckboxListTile(
                        //   title:controller.isCheckBox?  Text("Event Active",style:
                        //   TextStyle(color: Colors.green),):Text('Event InActive',style: TextStyle(color:Colors.red ),),
                        //   value: controller.isCheckBox,
                        //   onChanged: (newValue) {
                        //
                        //       controller.isEventActiveOrNot(newValue);
                        //       print(controller.isCheckBox);
                        //       print(controller.eventActive);
                        //
                        //   },
                        //   controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        // ),
                        43.ph,

                        MyButton(
                          width: 180.w,
                          height: 43.h,
                          elevation: 5,
                          loading: controller.isLoading,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.isLoading == false) {
                                print("here");
                                controller.updateEventApi(
                                    token: controller.user.bearerToken!,
                                    eventTitle:
                                        controller.eventTitleController.text,
                                    eventDescription: controller
                                        .eventDescriptionController.text,
                                    eventStartDate: controller
                                        .eventStartDateController.text,
                                    eventEndDate:
                                        controller.eventEndDateController.text,
                                    eventActive: controller.eventActive,
                                    id: controller.eventData!.id!);
                              }
                            } else {
                              return null;
                            }
                          },
                          textColor: Colors.white,
                          color: primaryColor,
                          name: 'Update Event ',
                          maxLines: 1,
                        ),
                        43.ph,
                        UpIcon()
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
