import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/my_colors.dart';
import '../helpers/my_text.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        title: Text(MyText.fav),
        backgroundColor: MyColors.primary,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => _yourCartlist(),
        )
        ),
      ])
    );
  
  }
  Widget _yourCartlist() {
    return Stack(
      children: [
        Container(
          width: 330.w,
          padding: EdgeInsets.all(10.w),
          margin: EdgeInsets.only(bottom: 5.h, right: 15.w, left: 15.w),
          decoration: BoxDecoration(
              color: MyColors.secondy,
              borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 70.w,
                    height: 70.w,
                    margin: EdgeInsets.only(right: 10.w),
                    decoration: BoxDecoration(
                      color: MyColors.normal,
                      borderRadius: BorderRadius.circular(10.r),
                      // image: DecorationImage(
                      //     image: NetworkImage(),
                      //     fit: BoxFit.contain)
                    ),
                  ),
                  Container(
                    width: 230.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Maybelline Face Studio Master Hi-Light Booster Bronzer",
                          style: TextStyle(
                              color: MyColors.accent,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.fade),
                        ),
                        Text(
                          "bronzer",
                          style: TextStyle(
                            color: MyColors.hint,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 80.w,
                      ),
                      Text(
                        "\$ ${14.9}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Container(
                child: Container(
                  width: 150.w,
                  height: 30.w,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: MyColors.accent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r))),
                      child: Text(
                        MyText.buy_now,
                        style: TextStyle(
                            color: MyColors.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              )
                ],
              ),
              
            ],
          ),
        ),
        Positioned(
          right: 5.w,
          top: -10.h,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
                color: MyColors.accent,
                size: 18.sp,
              )),
        )
      ],
    );
  }

  Widget _count(String text, click) {
    return InkWell(
      onTap: click,
      child: Container(
        width: 15.w,
        height: 15.w,
        decoration: BoxDecoration(
            color: MyColors.normal,
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                offset: Offset(0.5, 0.5),
                blurRadius: 0.3,
              )
            ]),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: MyColors.accent,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

}