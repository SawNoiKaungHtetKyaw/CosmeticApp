import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/controllers/favorite_controller.dart';
import 'package:online_shop_app/controllers/product_controller.dart';
import 'package:online_shop_app/pages/buy_now.dart';
import 'package:online_shop_app/pages/product_detail.dart';
import 'package:provider/provider.dart';

import '../helpers/my_colors.dart';
import '../helpers/my_text.dart';
import '../models/product.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

List<Product> products = [];

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
  List<Product> allProducts = context.read<ProductController>().products;

    return Scaffold(
        backgroundColor: MyColors.primary,
        appBar: AppBar(
          elevation: 0,
          title: Text(MyText.fav),
          backgroundColor: MyColors.primary,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Selector<FavoriteController, List<int>>(
              shouldRebuild: (previous, next) => previous!= next,//
              selector: (context, bloc) => bloc.favoriteProducts,
              builder: (context, value, child) {
                products = [];
                value.forEach((element) {
                  allProducts.forEach((all) { 
                    if(all.id == element){
                      products.add(all);
                    }
                  });
                });
                print(products);
                return products.isEmpty ? Expanded(
                  child: Center(child: Text("No Favorite Product",style: TextStyle(
                    color: MyColors.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp
                  ),),),
                ) : Expanded(
                    child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.to(()=>ProductDetail(productId: products[index].id ?? -1));
                    },
                    child: _yourCartlist(products[index])),
                ));
              }),
        ]));
  }

  Widget _yourCartlist(product) {
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
                        image: DecorationImage(
                            image: NetworkImage(product.image_link),
                            fit: BoxFit.contain)),
                  ),
                  Container(
                    width: 230.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              color: MyColors.accent,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.fade),
                        ),
                        Text(
                          product.brand,
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
                  Container(
                    child: Container(
                      width: 150.w,
                      height: 30.w,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(()=>BuyNow());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.accent,
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
              onPressed: () {
                context
                                            .read<FavoriteController>()
                                            .removeFav(product.id);
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
