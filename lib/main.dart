import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/controllers/product_controller.dart';
import 'package:provider/provider.dart';

import 'pages/flash_page.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProductController>(create: (_)=>ProductController()),
  ],
  child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FlashPage(),
      ),
    );
  }
}