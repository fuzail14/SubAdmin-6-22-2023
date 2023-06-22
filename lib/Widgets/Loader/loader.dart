import 'package:flutter/material.dart';
import '../../Constants/constants.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }
}
