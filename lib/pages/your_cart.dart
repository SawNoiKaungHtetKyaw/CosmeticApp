import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/controllers/buynow_controller.dart';
import 'package:online_shop_app/controllers/cart_controller.dart';
import 'package:online_shop_app/databases/db_helper.dart';
import 'package:online_shop_app/models/product_insert.dart';
import 'package:online_shop_app/pages/buy_now.dart';
import 'package:online_shop_app/pages/product_detail.dart';
import 'package:provider/provider.dart';

import '../helpers/my_colors.dart';
import '../helpers/my_text.dart';

class YourCart extends StatefulWidget {
  const YourCart({Key? key}) : super(key: key);

  @override
  State<YourCart> createState() => _YourCartState();
}

class _YourCartState extends State<YourCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        title: Text(MyText.your_cart),
        backgroundColor: MyColors.primary,
      ),
      body: Selector<CartController,List<ProductInsert>>(
        selector: (context,bloc) =>bloc.cartProducts,
        builder: (context, cartProd, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: cartProd.length,
                              itemBuilder: (context, index) {
      
                                return _yourCartlist(cartProd[index],index);
                              })),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Consumer<CartController>(
                          builder: (context, value, child) => 
                          ElevatedButton(
                              onPressed: () {
                                value.getAllCartTotalPrice();
                                Get.to(()=>BuyNow(isSingleProduct: false,));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: MyColors.accent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r))),
                              child: Text(
                                "Buy All",
                                style: TextStyle(
                                    color: MyColors.normal,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ]),
      )
            
            
    );
  }

  Widget _yourCartlist(product,index) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.to(()=>ProductDetail(productId : product.product_id));
          },
          child: Container(
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
                          image: DecorationImage(
                              image:
                                  NetworkImage(product.product_image_link),
                              fit: BoxFit.contain)),
                    ),
                    Container(
                      width: 230.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.product_name,
                            style: TextStyle(
                                color: MyColors.accent,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.fade),
                          ),
                          Text(
                            product.product_type,
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
                          "\$ ${product.product_price}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Consumer<CartController>(
                      builder: (context, value, child) => Row(
                        children: [
                          _count("-", () {
                            setState(() {
                              value.decreaseCount(product,index+1);
                            });
                          }),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              product.product_count.toString(),
                              style: TextStyle(
                                  color: MyColors.accent,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          _count("+", () async {
                              value.increaeCount(product,index+1);
                            
                          })
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer<BuyNowController>(
                      builder: (context, value, child) => Container(
                        child: Container(
                          width: 180.w,
                          height: 30.w,
                          child: ElevatedButton(
                              onPressed: () {
                                value.setCountFromCart(product.product_count);
                                value.getTotalPrice(double.parse(product.product_price));
                                Get.to(()=> BuyNow(productId: product.product_id,));
                              },
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
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 5.w,
          top: -10.h,
          child: IconButton(
              onPressed: () {
                setState(() {
                  DbHelper().deleteProduct(index+1);
                });
                context.read<CartController>().getAllProduct();
              },
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
