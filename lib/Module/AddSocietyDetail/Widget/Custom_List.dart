import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return SizedBox(
      height: 80.h,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 38.w),
              child: Row(
                children: [
                  Text(
                    text!,
                    style: GoogleFonts.ubuntu(
                        fontStyle: FontStyle.normal,
                        // color: secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.font,
                        color: HexColor('#4D4D4D')),
                  ),
                  210.pw,
                  Container(
                    height: 21.h,
                    width: 28.w,
                    color: Color.fromRGBO(255, 153, 0, 0.24),
                    child: Image(image: AssetImage('assets/arrowfrwd.png')),
                  ),
                ],
              ),
            ),
            18.ph,
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
