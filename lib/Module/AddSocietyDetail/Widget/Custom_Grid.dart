import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

class CustomGrid extends StatelessWidget {
  CustomGrid({required this.onTap, required this.text, this.image});
  void Function()? onTap;
  String? text;
  Widget? image;

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
              height: 50.h,
              width: 60.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [HexColor('#FFFFFF'), HexColor('#FF9900')]),
              ),
              child: image ?? Image.asset('assets/phasepic.png'),
            ),
            8.ph,
            Text(
              text!,
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                  fontStyle: FontStyle.normal,

                  // color: secondaryColor,

                  fontWeight: FontWeight.w500,
                  fontSize: 16.font,
                  color: HexColor('#FF9900')),
            ),
          ],
        ),
      ),
    );
  }
}
