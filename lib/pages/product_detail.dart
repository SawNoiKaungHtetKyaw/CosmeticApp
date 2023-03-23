import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/controllers/buynow_controller.dart';
import 'package:online_shop_app/controllers/favorite_controller.dart';
import 'package:online_shop_app/databases/db_helper.dart';
import 'package:online_shop_app/helpers/my_colors.dart';
import 'package:online_shop_app/helpers/my_text.dart';
import 'package:online_shop_app/models/fav.dart';
import 'package:online_shop_app/models/product_insert.dart';
import 'package:online_shop_app/pages/buy_now.dart';
import 'package:online_shop_app/pages/your_cart.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_controller.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';

class ProductDetail extends StatefulWidget {
  int productId;
  ProductDetail({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> singleProduct =
        context.read<ProductController>().getProductById(widget.productId);
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
                                        singleProduct[0].image_link.toString()),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            Selector<FavoriteController, List<int>>(
                              selector: (context, bloc) =>
                                  bloc.favoriteProducts,
                              builder: (context, value, child) => Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    onPressed: () {
                                      int product_id = singleProduct[0].id ?? 0;

                                      if (!value.contains(product_id)) {
                                        context
                                            .read<FavoriteController>()
                                            .addFav(Fav.insertFav(
                                                product_id: product_id));
                                      } 
                                      else {
                                        context
                                            .read<FavoriteController>()
                                            .removeFav(product_id);
                                      }

                                    },
                                    icon: Icon(
                                      value.contains(singleProduct[0].id)
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      size: 24.sp,
                                      color: value.contains(singleProduct[0].id)
                                          ? MyColors.fav
                                          : MyColors.primary,
                                    )),
                              ),
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
                            "\$ ${singleProduct[0].price}",
                            style: TextStyle(
                                color: MyColors.normal,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Divider(color: MyColors.normal, thickness: 1),
                      ),
                      Text(
                        "${singleProduct[0].name}",
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
                          Text("${singleProduct[0].product_type}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: MyColors.hint,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400)),
                          Row(
                            children: [_rating(singleProduct[0].rating ?? 0.0)],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "${singleProduct[0].description}",
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
                                    backgroundColor: MyColors.secondy,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<BuyNowController>()
                                        .setCountFromCart(1);
                                    context
                                        .read<BuyNowController>()
                                        .setTotalForDetailPage("");
                                    Get.to(() => BuyNow(
                                          productId: int.parse(
                                              singleProduct[0].id.toString()),
                                        ));
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
                          Consumer<CartController>(
                            builder: (context, value, child) => Container(
                              width: 40.h,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: MyColors.secondy,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: IconButton(
                                onPressed: () {
                                  int count = 1;
                                  List<String> idList = [];
                                  value.cartProducts.forEach((element) {
                                    idList.add(element.product_id.toString());
                                  });

                                  if (!idList.contains(
                                      singleProduct[0].id.toString())) {
                                    DbHelper().insertProduct(
                                        ProductInsert.insertProduct(
                                            product_id:
                                                singleProduct[0].id ?? 0,
                                            product_count: count,
                                            product_brand:
                                                singleProduct[0].brand ?? "",
                                            product_name: singleProduct[0].name ??
                                                "",
                                            product_price:
                                                singleProduct[0].price ?? "",
                                            product_image_link:
                                                singleProduct[0].image_link ??
                                                    "",
                                            product_description: singleProduct[0]
                                                    .description ??
                                                "",
                                            product_rating:
                                                singleProduct[0].rating ?? 0.0,
                                            product_type:
                                                singleProduct[0].product_type ??
                                                    "",
                                            product_api_url: singleProduct[0]
                                                    .product_api_url ??
                                                ""));
                                    context
                                        .read<CartController>()
                                        .getAllProduct();
                                  } else {
                                    Get.snackbar("Cart Alert",
                                        "This product is already exist in your cart",
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                },
                                icon: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: MyColors.accent,
                                  size: 20.sp,
                                ),
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
        children: [
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _fullStar()
        ],
      );
    } else if (rating >= 4.5 && rating <= 4.9) {
      return Row(
        children: [
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _halfStar()
        ],
      );
    } else if (rating >= 4.0 && rating < 4.5) {
      return Row(
        children: [
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _noStar()
        ],
      );
    } else if (rating >= 3.5 && rating <= 3.9) {
      return Row(
        children: [
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _halfStar(),
          _noStar()
        ],
      );
    } else if (rating >= 3.0 && rating < 3.5) {
      return Row(
        children: [_fullStar(), _fullStar(), _fullStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 2.5 && rating < 3.0) {
      return Row(
        children: [_fullStar(), _fullStar(), _halfStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 2.0 && rating < 2.5) {
      return Row(
        children: [_fullStar(), _fullStar(), _noStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 1.5 && rating < 2.0) {
      return Row(
        children: [_fullStar(), _halfStar(), _noStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 1.0 && rating < 1.5) {
      return Row(
        children: [_fullStar(), _noStar(), _noStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 0.5 && rating < 1.0) {
      return Row(
        children: [_halfStar(), _noStar(), _noStar(), _noStar(), _noStar()],
      );
    } else {
      return Row(
        children: [_noStar(), _noStar(), _noStar(), _noStar(), _noStar()],
      );
    }
  }

  Widget _fullStar() {
    return Icon(
      Icons.star,
      size: 20.sp,
      color: MyColors.accent,
    );
  }

  Widget _halfStar() {
    return Icon(
      Icons.star_half,
      size: 20.sp,
      color: MyColors.accent,
    );
  }

  Widget _noStar() {
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
