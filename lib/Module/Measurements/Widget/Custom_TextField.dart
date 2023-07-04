import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.controller, required this.hintText});
  TextEditingController? controller;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 17.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0xFFE1E3E6)),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: TextFormField(
        validator: emptyStringValidator,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 25.h),
          hintText: hintText,
        ),
      ),
    );
  }
}
