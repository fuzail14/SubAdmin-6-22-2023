import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

// ignore: must_be_immutable
class CustomCardHouseStreet extends StatelessWidget {
  CustomCardHouseStreet({
    required this.onTap,
    required this.widget,
    required this.text,
    required this.firstHeight,
    required this.firstWidth,
    required this.firstcolor,
    required this.sHeight,
    required this.sWidth,
    required this.scolor,
    required this.smargin,
  });
  void Function()? onTap;
  Widget widget;
  String text;
  double? firstHeight;
  double? firstWidth;
  Color? firstcolor;
  double? sHeight;
  double? sWidth;
  Color? scolor;
  EdgeInsetsGeometry? smargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: firstWidth,
            height: firstHeight,
            margin: EdgeInsets.only(left: 26.w, right: 25.w, bottom: 1.0.h),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.5, 0.5), //(x,y)
                blurRadius: .5,
              )
            ], borderRadius: BorderRadius.circular(10.r), color: firstcolor),
            child: Stack(
              children: [
                Container(
                    margin: smargin,
                    height: sHeight,
                    width: sWidth,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: scolor),
                    child: widget),
                23.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150.w,
                      margin: EdgeInsets.only(left: 58.w, top: 25.h),
                      child: Text(
                        text!,
                        style: GoogleFonts.ubuntu(
                            fontStyle: FontStyle.normal,
                            // color: secondaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.font,
                            color: HexColor('#4D4D4D')),
                      ),
                    ),
                  ],
                ),
                112.pw,
                Container(
                  margin: EdgeInsets.only(left: 236.w, top: 23.h),
                  width: 9.w,
                  height: 15.h,
                  child: SvgPicture.asset(
                    'assets/arrowfrwdsvg.svg',
                  ),
                ),
              ],
            ),
          ),
          15.ph,
        ],
      ),
    );
  }
}
