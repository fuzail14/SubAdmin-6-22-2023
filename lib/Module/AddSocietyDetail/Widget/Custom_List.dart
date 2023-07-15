import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

// ignore: must_be_immutable
class CustomList extends StatelessWidget {
  CustomList({required this.onTap, required this.text});
  void Function()? onTap;
  String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80.h,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 38.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text!,
                    style: GoogleFonts.ubuntu(
                        fontStyle: FontStyle.normal,
                        // color: secondaryColor,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#4D4D4D')),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 292.w,
              ),
              width: 28.w,
              height: 15.h,
              child: SvgPicture.asset(
                'assets/arrowfrwdsvg.svg',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.5.h),
              child: Divider(
                thickness: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
