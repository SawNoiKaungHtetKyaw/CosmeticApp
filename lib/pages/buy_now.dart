import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/helpers/my_colors.dart';
import 'package:online_shop_app/helpers/my_text.dart';
import 'package:online_shop_app/models/product.dart';
import 'package:online_shop_app/pages/add_address.dart';

class BuyNow extends StatefulWidget {
  Product product;
  BuyNow({Key? key, required this.product}) : super(key: key);

  @override
  State<BuyNow> createState() => _BuyNowState(this.product);
}

class _BuyNowState extends State<BuyNow> {
  Product product;
  int isClick = 1;
  _BuyNowState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.primary,
        appBar: AppBar(
          elevation: 0,
          title: Text(MyText.buy_now),
          backgroundColor: MyColors.primary,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Get.to(()=>AddAdderess()),
                    child: Container(
                      width: 330.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: MyColors.primary,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: MyColors.normal, width: 1.w)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              size: 34.sp,
                              color: MyColors.normal,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Add Address",
                              style: TextStyle(
                                  color: MyColors.normal,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    child: Text(
                      MyText.items,
                      style: TextStyle(
                          color: MyColors.normal,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 330.w,
                    padding: EdgeInsets.all(10.w),
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
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          product.image_link.toString()),
                                      fit: BoxFit.contain)),
                            ),
                            Container(
                              width: 230.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    product.name.toString(),
                                    style: TextStyle(
                                        color: MyColors.accent,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.fade),
                                  ),
                                  Text(
                                    product.product_type.toString(),
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
                                  "\$ ${product.price}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                _count("-", () {}),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        color: MyColors.accent,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                _count("+", () {})
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          MyText.payment,
                          style: TextStyle(
                              color: MyColors.normal,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          MyText.view_all_payment,
                          style: TextStyle(
                            color: MyColors.hint,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _payment(),
                ],
              ),
            ),
            Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 45.h,
                    color: MyColors.secondy,
                    child: Row(
                      children: [
                        Spacer(),
                        Text("Total : \$ ${ product.price}",style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold
                        ),),
                        Container(
                          width: 120.w,
                          height: 25.h,
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: MyColors.accent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r)
                              )
                            ),
                            onPressed: (){},
                            child: Center(
                            child: Text(MyText.comfirm,style: TextStyle(
                              color: MyColors.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500
                            ),
                            ),
                          ),
                          )
                        )
                      ],
                    ),

                  )
                ],
              ))
          ],
        ));
  }

  Widget _payment() {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isClick = 1;
            });
          },
          child: Container(
            width: 150.w,
            height: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: MyColors.primary,
                border: Border.all(
                  color: MyColors.stoke,
                ),
                boxShadow: isClick == 1
                    ? [
                        BoxShadow(
                            color: MyColors.accent,
                            offset: Offset(1, 1),
                            blurRadius: 0.5,
                            spreadRadius: 0.6)
                      ]
                    : null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.w,
                  height: 30.w,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      image: DecorationImage(
                          image: AssetImage("assets/images/kpay_logo.png"),
                          fit: BoxFit.fill)),
                ),
                Text(
                  "Kpay",
                  style: TextStyle(
                      color: MyColors.normal,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),

        InkWell(
          onTap: () {
            setState(() {
              isClick = 2;
            });
          },
          child: Container(
            width: 150.w,
            height: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: MyColors.primary,
                border: Border.all(
                  color: MyColors.stoke,
                ),
                boxShadow: isClick == 2
                    ? [
                        BoxShadow(
                            color: MyColors.accent,
                            offset: Offset(1, 1),
                            blurRadius: 0.5,
                            spreadRadius: 0.6)
                      ]
                    : null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.w,
                  height: 30.w,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      image: DecorationImage(
                          image: AssetImage("assets/images/wave_money.png"),
                          fit: BoxFit.fill)),
                ),
                Text(
                  "Wave",
                  style: TextStyle(
                      color: MyColors.normal,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
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
