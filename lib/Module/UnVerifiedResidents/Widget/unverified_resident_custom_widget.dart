import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';

// ignore: must_be_immutable
class UnverifiedCard extends StatelessWidget {
  UnverifiedCard(
      {required this.onTap, required this.name, required this.mobileno});

  void Function()? onTap;

  String name;
  String mobileno;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 1.w, 16.w, 0),
      child: Container(
        width: 343.w,
        height: 58.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.25, color: Color(0xFFFF9900)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3D000000),
              blurRadius: 1,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(left: 14.21.w, top: 9.06.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    color: Color(0xFFF57F17),
                    fontSize: 16.font,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  mobileno,
                  style: GoogleFonts.poppins(
                    color: Color(0xFFB8B8B8),
                    fontSize: 12.font,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Padding(
                padding: EdgeInsets.fromLTRB(217.86.w, 9.5.h, 14.14.w, 0),
                child: MyButton(
                  name: 'Unverified',
                  width: 111.w,
                  height: 39.h,
                  borderRadius: BorderRadius.circular(8.r),
                  fontSize: 12.font,
                  fontWeight: FontWeight.w500,
                )),
          )
        ]),
      ),
    );
  }
}
