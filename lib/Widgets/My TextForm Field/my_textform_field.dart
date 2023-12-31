import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Constants/constants.dart';

class MyTextFormField extends GetView {
  final TextEditingController? controller;
  final String? hintText;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final bool? fill;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double? fontSize;
  final String? labelText;
  final int? maxLines;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final TextInputType? textInputType;

  final String? Function(String?)? validator;
  final void Function()? onTap;
  const MyTextFormField({
    super.key,
    this.maxLines,
    this.readOnly,
    this.textInputType,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.fontWeight,
    this.fill,
    this.fontSize,
    this.onTap,
    this.width,
    this.height,
    this.controller,
    this.fillColor,
    this.validator,
    required this.hintText,
    this.labelTextColor,
    required this.labelText,
    this.hintTextColor,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(39.w, 16.h, 38.w, 0),
      child: SizedBox(
        width: width ?? 298.w,
        height: height ?? 43.h,
        child: TextFormField(
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w400, fontSize: 15, letterSpacing: 0.05),

          keyboardType: textInputType,
          // obscureText: widget.obscureText,
          textAlign: TextAlign.left,
          onTap: onTap,
          validator: validator,
          maxLines: maxLines ?? 1,
          controller: controller,
          cursorColor: primaryColor,
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
            // enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding:
                contentPadding ?? EdgeInsets.fromLTRB(25.w, 13.h, 0.w, 13.h),
            // suffix: GestureDetector(
            //     // onTap: widget.togglePasswordView,
            //     child: Icon(
            //       widget.obscureText
            //           ? Icons.visibility
            //           : Icons.visibility_off,
            //     )),
            filled: fill ?? true,

            labelStyle: GoogleFonts.ubuntu(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: labelTextColor ?? HexColor('#555555')),
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: hintTextColor ?? HexColor("#B6B6B6"),
            ),
            hintText: hintText,
            // labelText: labelText,
            fillColor: fillColor ?? HexColor('#FFFFFF'),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21.0.r),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21.0.r),
              borderSide: BorderSide(color: HexColor('#FF9900'), width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
