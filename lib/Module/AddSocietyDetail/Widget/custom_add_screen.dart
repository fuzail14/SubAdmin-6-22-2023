import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Constants/constants.dart';

import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';

// ignore: must_be_immutable
class CustomAddScreen extends StatelessWidget {
  CustomAddScreen({
    required this.fKey,
    required this.appBarText,
    required this.backonTap,
    required this.nameController,
    required this.from,
    required this.to,
    required this.fromImg,
    required this.toImg,
    required this.fromController,
    required this.toController,
    required this.buttonLoading,
    required this.buttonOnPressed,
  });
  Key? fKey;
  String appBarText;
  void Function()? backonTap;
  TextEditingController? nameController;
  String from;
  String to;
  String fromImg;
  String toImg;
  TextEditingController? fromController;
  TextEditingController? toController;
  bool buttonLoading = false;
  void Function()? buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fKey,
      child: Column(
        children: <Widget>[
          MyBackButton(text: appBarText, onTap: backonTap),
          20.ph,
          SizedBox(
            height: 344.h,
            width: 299.w,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.r)),
              margin: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextFormField(
                    hintText: 'Name',
                    labelText: 'Name',
                    validator: emptyStringValidator,
                    controller: nameController,
                  ),
                  20.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Color(0xFFF7F8FA),
                        height: 25.h,
                        width: 98.w,
                        child: Center(
                            child: Text(
                          from,
                          style: TextStyle(color: HexColor('#535353')),
                        )),
                      ),
                      18.pw,
                      Image(image: AssetImage('assets/arrow1.png')),
                      18.pw,
                      Container(
                        color: Color(0xFFF7F8FA),
                        height: 25.h,
                        width: 98.w,
                        child: Center(
                            child: Text(
                          to,
                          style: TextStyle(color: HexColor('#535353')),
                        )),
                      )
                    ],
                  ),
                  10.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 75.w,
                        height: 75.h,
                        color: Color.fromRGBO(255, 153, 0, 0.14),
                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(fromImg),
                            ),
                            Center(
                              child: TextFormField(
                                validator: emptyStringValidator,
                                controller: fromController,
                                keyboardType: TextInputType.number,
                                enabled: true,
                                decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(), //<-- SEE HERE
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                      72.pw,
                      Container(
                        width: 75.w,
                        height: 75.h,
                        color: Color.fromRGBO(255, 153, 0, 0.14),
                        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/textfieldimg.png'))),

                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(toImg),
                            ),
                            Center(
                              child: TextFormField(
                                validator: emptyStringValidator,
                                controller: toController,
                                keyboardType: TextInputType.number,
                                enabled: true,
                                decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide(), //<-- SEE HERE
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  40.ph,
                  Center(
                    child: MyButton(
                      loading: buttonLoading,
                      height: 37.h,
                      width: 222.w,
                      border: 5,
                      onPressed: buttonOnPressed,
                      name: 'Save',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
