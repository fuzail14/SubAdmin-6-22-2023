import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

class MyBackButton extends StatelessWidget {
  final String? text;
  final Widget? widget;
  final void Function()? onTap;

  const MyBackButton({this.text, this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 38.w, top: 73.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap ??
                () {
                  Get.back();
                },
            child: Container(
              width: 20.w,
              height: 20.h,
              child: SvgPicture.asset(
                "assets/arrow_back.svg",
              ),
            ),
          ),
          20.pw,
          Text(
            text!,
            style: GoogleFonts.ubuntu(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(16),
                color: HexColor('#4D4D4D')),
          ),
          Container(
            child: widget,
          )
        ],
      ),
    );
  }
}
