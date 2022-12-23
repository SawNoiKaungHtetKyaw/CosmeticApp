import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/my_colors.dart';
import '../helpers/my_text.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
    bool drowDown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.secondy,
        appBar: AppBar(
          elevation: 0,
          title: Text(MyText.history),
          backgroundColor: MyColors.primary,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) => _historyCart()),
              )
            ],
          ),
        ));
  }

  Widget _historyCart() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.w),
      child: Column(
        children: [
          Container(
            width: 340.w,
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                color: MyColors.normal,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 236, 205, 191),
                      offset: Offset(1.5, 1.5),
                      blurRadius: 0.9,
                      spreadRadius: 0.8)
                ]),
            child: Row(
              children: [
                Text(
                  "12-12-2022 | 2:35 AM",
                  style: TextStyle(
                      color: MyColors.date_hint,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp),
                ),
                Spacer(),
                Text(
                  "\$ 30.44",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        drowDown = !drowDown;
                      });
                    },
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: MyColors.accent,
                    ))
              ],
            ),
          ),
          drowDown == true ? Container(
              width: 340.w,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 189, 143, 123),
                        offset: Offset(1.5, 1.5),
                        blurRadius: 0.9,
                        spreadRadius: 0.8)
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 28.w,
                    height: 28.w,
                    color: MyColors.normal,
                    // child: Image.network(""),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Maybelline Face Studio Master bonzer studio",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: MyColors.normal,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "bonzer",
                          style: TextStyle(
                              color: MyColors.hint,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "1 x \$ 14.44",
                    style: TextStyle(
                        color: MyColors.accent,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )) : Container()
        ],
      ),
    );
  }
}
