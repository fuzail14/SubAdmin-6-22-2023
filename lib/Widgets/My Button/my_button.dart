import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import '../../Constants/constants.dart';

class MyButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final double? elevation;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final double? border;
  final String name;
  final Color? color;
  final Color? textColor;
  final int? maxLines;
  final bool loading;
  final void Function()? onPressed;
  const MyButton(
      {super.key,
      this.borderRadius,
      this.elevation,
      this.fontWeight,
      this.letterSpacing,
      this.fontSize,
      this.textColor,
      this.height,
      this.width,
      this.border,
      required this.name,
      this.color,
      this.maxLines,
      this.onPressed,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 180.26,
        height: height ?? 43.0,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0.r),
          color: color ?? primaryColor,
        ),
        child: Center(
          child: 
          loading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            :
          Text(
            name,
            maxLines: maxLines ?? 1,
            style: GoogleFonts.ubuntu(
                color: textColor ?? Colors.white,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing,
                fontSize: fontSize),
          ),
        ),
      ),
    );

    // SizedBox(
    //   width: width ?? 180.26.w,
    //   height: height ?? 43.h,
    //   child: ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //         elevation: elevation ?? 5,
    //         shape: outlinedBorder ??
    //             RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(16.0.r)),
    //         backgroundColor: primaryColor ?? color),
    //     child: loading!
    //         ? CircularProgressIndicator(
    //             color: Colors.white,
    //           )
    //         : Text(
    //             name,
    //             maxLines: maxLines ?? 1,
    //             style: GoogleFonts.ubuntu(
    //                 color: textColor ?? Colors.white,
    //                 fontWeight: fontWeight,
    //                 letterSpacing: letterSpacing,
    //                 fontSize: fontSize),
    //           ),
    //     onPressed: onPressed,
    //   ),
    // );
  }
}
