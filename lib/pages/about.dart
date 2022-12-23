import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/my_colors.dart';
import '../helpers/my_text.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        title: Text(MyText.about),
        backgroundColor: MyColors.primary,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 50.h,
                color: MyColors.normal,
              ),
              Image.asset("assets/images/about.png")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              SizedBox(height:30.h),
              Center(child: Text(MyText.cosmetic_app,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: MyColors.normal
              ),)),
              SizedBox(
                height: 5.h,
              ),
              Center(child: Text(MyText.version,style: TextStyle(
                fontSize: 12.sp,
                color: MyColors.secondy
              ),))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(child: Text(MyText.dev,style: TextStyle(
                fontSize: 12.sp,
                color: MyColors.secondy
              ),)),

              SizedBox(
                height: 20.h,
              )
            ],
          )
        ],
      ),
    );
  }
}