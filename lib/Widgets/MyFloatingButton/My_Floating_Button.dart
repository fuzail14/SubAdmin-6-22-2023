import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MyFloatingButton extends StatelessWidget {
  MyFloatingButton({required this.onPressed});
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.only(top: 85.w),
        iconSize: MediaQuery.of(context).size.height * 0.065,
        icon: SvgPicture.asset('assets/floatingbutton.svg'),
        onPressed: onPressed);
  }
}
