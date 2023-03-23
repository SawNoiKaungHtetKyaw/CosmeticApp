import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/controllers/cart_controller.dart';
import 'package:online_shop_app/controllers/favorite_controller.dart';
import 'package:online_shop_app/controllers/product_controller.dart';
import 'package:online_shop_app/helpers/my_colors.dart';
import 'package:online_shop_app/helpers/my_text.dart';
import 'package:online_shop_app/models/product_insert.dart';
import 'package:online_shop_app/pages/about.dart';
import 'package:online_shop_app/pages/contact_us.dart';
import 'package:online_shop_app/pages/favorite.dart';
import 'package:online_shop_app/pages/history.dart';
import 'package:online_shop_app/pages/product_detail.dart';
import 'package:online_shop_app/pages/your_cart.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _loadProducts() async {
    await context.read<ProductController>().getProduct();
    await context.read<CartController>().getAllProduct();
  }

  @override
  void initState() {
    super.initState();
    _loadProducts();
    context.read<FavoriteController>().getAllFavProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        title: Text(
          MyText.cosmetic_app,
          style: TextStyle(
              color: MyColors.normal,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Selector<CartController, List<ProductInsert>>(
            selector: (context, bloc) => bloc.cartProducts,
            builder: (context, prod, child) => badges.Badge(
              // position: BadgePosition(top: 4, end: 4),
              badgeContent: Text(
                prod.length.toString(),
                style: TextStyle(color: MyColors.normal),
              ),
              child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Get.to(() => YourCart());
                  }),
            ),
          ),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
      body: Selector<ProductController, List<Product>>(
        selector: (context, bloc) => bloc.products,
        builder: (context, prod, child) => SafeArea(
          child: Stack(
            children: [
              Container(
                width: 360.w,
                height: 200.h,
                color: MyColors.primary,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 360.w,
                  height: 450.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                    color: MyColors.hint,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  children: [
                    //search bar
                    TextFormField(
                      decoration: InputDecoration(
                          fillColor: MyColors.normal,
                          filled: true,
                          hintText: MyText.search,
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: MyColors.hint),
                          prefixIcon: Icon(
                            Icons.search,
                            color: MyColors.hint,
                          ),
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: MyColors.primary),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.r))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: MyColors.primary),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.r)))),
                      onChanged: (value) => context
                          .read<ProductController>()
                          .searchProduct(value),
                    ),

                    SizedBox(
                      height: 10.h,
                    ),

                    Expanded(child: _getProductContent(prod))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawer() {
    bool isSelected = true;
    return SafeArea(
      child: Drawer(
          backgroundColor: MyColors.normal,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.r))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                        width: 130.w,
                        height: 130.w,
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: MyColors.primary,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Image.asset("assets/images/setting.png")),
                    Text(
                      " Setting",
                      style: TextStyle(
                          color: MyColors.accent,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    _drawerBtn(Icons.home_outlined, "Home", () => Get.back()),
                    _drawerBtn(Icons.favorite_border, "Favorite", () {
                      Get.back();
                      Get.to(() => Favorite());
                    }),
                    _drawerBtn(Icons.history, "History", () {
                      Get.back();
                      Get.to(() => History());
                    }),
                    _drawerBtn(Icons.info_outline, "About", () {
                      Get.back();
                      Get.to(() => About());
                    }),
                    _drawerBtn(Icons.people_outline, "Contact Us", () {
                      Get.back();
                      Get.to(() => ContactUs());
                    }),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: 40.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: MyColors.primary,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 5.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.r),
                                      bottomRight: Radius.circular(20.r)))),
                          onPressed: () => Get.back(),
                          child: Row(
                            children: [
                              Icon(
                                Icons.exit_to_app,
                                size: 30.sp,
                                color: MyColors.normal,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                "Exit",
                                style: TextStyle(
                                    color: MyColors.normal,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _drawerBtn(icon, String text, onClick) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.grey.shade100,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w)),
          onPressed: onClick,
          child: Row(
            children: [
              Icon(
                icon,
                size: 30.sp,
                color: MyColors.accent,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              )
            ],
          )),
    );
  }

  Widget _getProductContent(List<Product> products) {
    bool isLoading = context.watch<ProductController>().isLoading;
    bool isError = context.watch<ProductController>().isError;
    String errMsg = context.watch<ProductController>().errMsg;

    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: MyColors.primary,
        ),
      );
    }

    if (isError) {
      return Center(
        child: Text(
          errMsg,
          style: TextStyle(
              color: MyColors.normal,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        ),
      );
    }

    if (products.isEmpty) {
      return Text("No Product",
          style: TextStyle(
              color: MyColors.normal,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold));
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => ProductDetail(
                    productId: int.parse(products[index].id.toString())));
              },
              child: Container(
                width: 330.w,
                height: 120.h,
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: MyColors.secondy,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 0.8,
                          color: Color.fromARGB(255, 131, 131, 131))
                    ]),
                child: Row(
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: MyColors.normal,
                          borderRadius: BorderRadius.circular(5.r),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${products[index].image_link}"))),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      width: 200.w,
                      height: 100.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                          
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].name.toString(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                products[index].product_type.toString(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: MyColors.hint,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "\$ ${products[index].price}",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }
  }
}
