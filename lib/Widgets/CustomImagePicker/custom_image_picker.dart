import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

import '../../Constants/constants.dart';

class CustomImagePicker extends StatelessWidget {
  CustomImagePicker({
    required this.backgroundImage,
    required this.camOnPressed,
    required this.galOnPressed,
  });
  ImageProvider<Object>? backgroundImage;
  void Function()? camOnPressed;
  void Function()? galOnPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
            radius: 50.0.r,
            backgroundColor: Colors.white,
            backgroundImage: backgroundImage),
        Positioned(
          left: 65.w,
          top: 65.h,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 100.0.h,
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.w),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Choose Profile Photo',
                            style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                          ),
                          20.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: primaryColor),
                                icon: Icon(
                                  Icons.camera,
                                ),
                                onPressed: camOnPressed,
                                label: Text('Camera'),
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: primaryColor),
                                icon: Icon(Icons.image),
                                onPressed: galOnPressed,
                                label: Text('Gallery'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Icon(
              Icons.camera_alt,
              color: primaryColor,
              size: 30.w,
            ),
          ),
        ),
      ],
    );
  }
}
