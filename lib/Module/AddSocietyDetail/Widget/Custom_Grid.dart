import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

class CustomGrid extends StatelessWidget {
  CustomGrid({required this.onTap, required this.text});
  void Function()? onTap;
  String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [HexColor('#FFFFFF'), HexColor('#FF9900')]),
              ),
              child: Image(image: AssetImage('assets/phasepic.png')),
            ),
            8.ph,
            Text(
              text!,
              style: GoogleFonts.ubuntu(
                  fontStyle: FontStyle.normal,

                  // color: secondaryColor,

                  fontWeight: FontWeight.w500,
                  fontSize: 18.font,
                  color: HexColor('#FF9900')),
            ),
          ],
        ),
      ),
    );
  }
}
