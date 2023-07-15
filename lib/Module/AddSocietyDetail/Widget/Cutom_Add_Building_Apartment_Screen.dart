import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Text/my_text.dart';

// ignore: must_be_immutable
class AddBuildingApartmentCustom extends StatelessWidget {
  AddBuildingApartmentCustom({
    required this.fKey,
    required this.backonTap,
    required this.fromController,
    required this.toController,
    required this.buttonLoading,
    required this.buttonOnPressed,
  });
  Key? fKey;
  void Function()? backonTap;
  TextEditingController? fromController;
  TextEditingController? toController;
  bool buttonLoading = false;
  void Function()? buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: fKey,
          child: ListView(
            children: <Widget>[
              MyBackButton(
                onTap: backonTap,
                text: 'Add Apartments',
              ),
              20.ph,
              SizedBox(
                height: 200.h,
                child: Card(
                  margin: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.r)),
                  elevation: 2,
                  child: Column(
                    children: [
                      20.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(name: 'From Apartment'),
                              10.ph,
                              SizedBox(
                                width: 70.w,
                                child: TextFormField(
                                  validator: emptyStringValidator,
                                  controller: fromController,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        borderSide: BorderSide(), //<-- SEE HERE
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(name: 'To Apartment'),
                              10.ph,
                              SizedBox(
                                width: 70.w,
                                child: TextFormField(
                                  validator: emptyStringValidator,
                                  controller: toController,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        borderSide: BorderSide(), //<-- SEE HERE
                                      ),
                                      border: InputBorder.none),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      40.ph,
                      MyButton(
                        loading: buttonLoading,
                        onPressed: buttonOnPressed,
                        name: 'Save',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
