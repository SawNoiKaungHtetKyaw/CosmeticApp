import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/pages/home.dart';

class FlashPage extends StatefulWidget {
  const FlashPage({Key? key}) : super(key: key);

  @override
  State<FlashPage> createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {

  void timer() async{
      await Future.delayed(Duration(seconds: 3));
      Get.off(()=>Home());
    }

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 360.w,
          height: 640.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/cosmetic_splash.png",
              ),fit: BoxFit.fill
            )
          ),
        ),
      ),
    );
  }
}