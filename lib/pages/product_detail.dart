import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/helpers/my_colors.dart';
import 'package:online_shop_app/helpers/my_text.dart';
import 'package:online_shop_app/pages/buy_now.dart';
import 'package:provider/provider.dart';

import '../controllers/product_controller.dart';
import '../models/product.dart';

class ProductDetail extends StatefulWidget {
  Product? product;
  ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState(this.product);
}

class _ProductDetailState extends State<ProductDetail> {
  Product? product;
  _ProductDetailState(this.product);
  @override
  Widget build(BuildContext context) {
    List<Product> products = context.watch<ProductController>().products;
    return Scaffold(
      backgroundColor: MyColors.secondy,
      appBar: AppBar(
        toolbarHeight: 50.h,
        title: Text("Details"),
        backgroundColor: MyColors.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.sp),
                bottomRight: Radius.circular(30.sp))),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.h, top: 3.h),
            child: Stack(clipBehavior: Clip.none, children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: MyColors.normal,
                  size: 20.sp,
                ),
              ),
              Positioned(
                top: 2.h,
                right: 3.h,
                child: Container(
                  width: 15.h,
                  height: 15.h,
                  decoration:
                      BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "0",
                      style: TextStyle(
                          color: MyColors.normal,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: SizedBox()),
              Container(
                width: 360.w,
                height: 350.h,
                color: MyColors.primary,
              ),
            ],
          ),
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 160.h,
                    ),
                    Container(
                      width: 360.w,
                      height: 300.h,
                      decoration: BoxDecoration(
                          color: MyColors.primary,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.sp),
                              topRight: Radius.circular(30.sp))),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 250.w,
                          height: 250.w,
                          child: Stack(children: [
                            Container(
                              width: 250.w,
                              height: 250.w,
                              decoration: BoxDecoration(
                                color: MyColors.normal,
                                borderRadius: BorderRadius.circular(20.sp),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        product!.image_link.toString()),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_outline,
                                    size: 24.sp,
                                    color: MyColors.primary,
                                  )),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _chooseColor(Color(0xff8c3d3d)),
                              _chooseColor(Color(0xff8A8023)),
                              _chooseColor(Color(0xff733D8C)),
                              _chooseColor(Color(0xff845635)),
                            ],
                          ),
                          Text(
                            "\$ ${product!.price}",
                            style: TextStyle(
                                color: MyColors.normal,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Divider(color: MyColors.normal, thickness: 1),
                      ),
                      Text(
                        "${product!.name}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: MyColors.normal,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${product!.product_type}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: MyColors.hint,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400)),
                          Row(
                            children: [
                              _rating(product!.rating ?? 0.0)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "${product!.description}",
                        style:
                            TextStyle(color: MyColors.normal, fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40.h,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: MyColors.secondy,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                  ),
                                  onPressed: () {
                                    Get.to(()=>BuyNow(product: product!,));
                                  },
                                  child: Text(
                                    MyText.buy_now,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: MyColors.accent,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 40.h,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: MyColors.secondy,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_shopping_cart_outlined,
                                color: MyColors.accent,
                                size: 20.sp,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rating(double rating) {
    if (rating == 5.0) {
      return Row(
        children: [_fullStar(),_fullStar(),_fullStar(),_fullStar(),_fullStar()],
      );
    }else if(rating >= 4.5 && rating <=4.9){
      return Row(
        children: [_fullStar(),_fullStar(),_fullStar(),_fullStar(),_halfStar()],
      );
    }else if(rating >= 4.0 && rating < 4.5){
      return Row(
        children: [_fullStar(),_fullStar(),_fullStar(),_fullStar(),_noStar()],
      );
    }else if(rating >= 3.5 && rating <= 3.9){
      return Row(
        children: [_fullStar(),_fullStar(),_fullStar(),_halfStar(),_noStar()],
      );
    }else if(rating >= 3.0 && rating < 3.5){
      return Row(
        children: [_fullStar(),_fullStar(),_fullStar(),_noStar(),_noStar()],
      );
    }else if(rating >= 2.5 && rating < 3.0){
      return Row(
        children: [_fullStar(),_fullStar(),_halfStar(),_noStar(),_noStar()],
      );
    }else if(rating >= 2.0 && rating < 2.5){
      return Row(
        children: [_fullStar(),_fullStar(),_noStar(),_noStar(),_noStar()],
      );
    }else if(rating >= 1.5 && rating < 2.0){
      return Row(
        children: [_fullStar(),_halfStar(),_noStar(),_noStar(),_noStar()],
      );
    }else if(rating >= 1.0 && rating < 1.5){
      return Row(
        children: [_fullStar(),_noStar(),_noStar(),_noStar(),_noStar()],
      );
    }else if(rating >= 0.5 && rating < 1.0){
      return Row(
        children: [_halfStar(),_noStar(),_noStar(),_noStar(),_noStar()],
      );
    }
    
    else{
      return Row(
        children: [_noStar(),_noStar(),_noStar(),_noStar(),_noStar()],
      );
    }
  }

  Widget _fullStar(){
    return Icon(
          Icons.star,
          size: 20.sp,
          color: MyColors.accent,
        );
  }
  Widget _halfStar(){
    return Icon(
          Icons.star_half,
          size: 20.sp,
          color: MyColors.accent,
        );
  }
  Widget _noStar(){
    return Icon(
          Icons.star_border,
          size: 20.sp,
          color: MyColors.accent,
        );
  }

  Widget _chooseColor(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.sp),
          border: Border.all(color: MyColors.normal, width: 1.5.w)),
    );
  }
}
