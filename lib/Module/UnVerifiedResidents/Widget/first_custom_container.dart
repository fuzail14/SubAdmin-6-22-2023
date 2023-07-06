import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

// ignore: must_be_immutable
class FirstCustomContainer extends StatelessWidget {
  FirstCustomContainer({
    required this.ImageBaseUrl,
    required this.Name,
    required this.MobileNo,
    required this.Cnic,
    required this.VehicleNo,
    required this.ResidentalType,
    required this.Status,
  });
  String? ImageBaseUrl;
  String? Name;
  String? MobileNo;
  String? Cnic;
  String? VehicleNo;
  String? ResidentalType;
  String? Status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 150.w,
            height: 100.h,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.1,
                ),
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(ImageBaseUrl!))),
          ),
        ),
        16.ph,
        Container(
          height: 323.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x3FACACAC),
                blurRadius: 4,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 99.w, top: 28.h),
                child: Text(
                  'Verification Details',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFF4A4A4A),
                    fontSize: 18.font,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 31.w, top: 39.04.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FULL NAME CNIC RESIDENTIAL TYPE
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/personsvg.svg',
                                height: 8.h,
                                width: 8.w,
                              ),
                              8.pw,
                              Text(
                                'Full Name',
                                style: GoogleFonts.ubuntu(
                                  color: Color(0xFF4D4D4D),
                                  fontSize: 12.font,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          5.97.ph,
                          Text(
                            Name!,
                            style: GoogleFonts.ubuntu(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16.font,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          20.ph,
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/cnic.svg',
                                height: 8.h,
                                width: 8.w,
                              ),
                              8.pw,
                              Text(
                                'Cnic',
                                style: GoogleFonts.ubuntu(
                                  color: Color(0xFF4D4D4D),
                                  fontSize: 12.font,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          5.97.ph,
                          Text(
                            Cnic!,
                            style: GoogleFonts.ubuntu(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16.font,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          20.ph,
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/buildingsvg.svg',
                                height: 8.h,
                                width: 8.w,
                              ),
                              8.pw,
                              Text(
                                'Residental Type',
                                style: GoogleFonts.ubuntu(
                                  color: Color(0xFF4D4D4D),
                                  fontSize: 12.font,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          5.97.ph,
                          Text(
                            ResidentalType!.toString(),
                            style: GoogleFonts.ubuntu(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16.font,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      104.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/contactsvg.svg',
                                height: 8.h,
                                width: 8.w,
                              ),
                              8.pw,
                              Text(
                                'Contact No',
                                style: GoogleFonts.ubuntu(
                                  color: Color(0xFF4D4D4D),
                                  fontSize: 12.font,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          5.97.ph,
                          Text(
                            MobileNo!.toString(),
                            style: GoogleFonts.ubuntu(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16.font,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          20.ph,
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/carsvg.svg',
                                height: 8.h,
                                width: 8.w,
                              ),
                              8.pw,
                              Text(
                                'Vehicle No',
                                style: GoogleFonts.ubuntu(
                                  color: Color(0xFF4D4D4D),
                                  fontSize: 12.font,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          5.97.ph,
                          Text(
                            VehicleNo!.toString(),
                            style: GoogleFonts.ubuntu(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16.font,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          20.ph,
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/notices_vector.svg',
                                height: 8.h,
                                width: 8.w,
                              ),
                              8.pw,
                              Text(
                                'Status',
                                style: GoogleFonts.ubuntu(
                                  color: Color(0xFF4D4D4D),
                                  fontSize: 12.font,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          5.97.ph,
                          Text(
                            Status.toString(),
                            style: GoogleFonts.ubuntu(
                              color: Color(0xFF1A1A1A),
                              fontSize: 16.font,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
       
        ),
      ],
    );
  }
}
