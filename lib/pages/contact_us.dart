import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/my_colors.dart';
import '../helpers/my_text.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: MyColors.accent,
        backgroundColor: MyColors.normal,
      ),
      body: Column(
        children: [
          Container(
            width: 360.w,
            height: 200.h,
            color: MyColors.normal,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/contact_us.png",
                  fit: BoxFit.contain,
                  width: 200.w,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  MyText.contact_us,
                  style: TextStyle(
                      color: MyColors.accent,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          _iconAndText(Icons.location_on, MyText.location),
          _iconAndText(Icons.email, MyText.email),
          _iconAndText(Icons.phone, MyText.phone),
          Spacer(),
          Text(
            MyText.dev,
            style: TextStyle(fontSize: 12.sp, color: MyColors.secondy),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  Widget _iconAndText(icon, String text) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          width: 35.w,
          height: 35.w,
          decoration: BoxDecoration(
              color: MyColors.primary,
              border: Border.all(color: MyColors.stoke),
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 141, 89, 65),
                    spreadRadius: 0.9,
                    blurRadius: 0.8,
                    offset: Offset(1, 1))
              ]),
          child: Icon(
            icon,
            size: 30.sp,
            color: MyColors.normal,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: MyColors.secondy,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 5.h,
        )
      ],
    );
  }
}
