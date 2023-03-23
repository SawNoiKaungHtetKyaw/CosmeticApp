import 'package:flutter/cupertino.dart';

import '../databases/db_helper.dart';
import '../models/product_insert.dart';

class CartController extends ChangeNotifier {

  List<ProductInsert> _cartProducts = [];
    String _cartTotal = "";

  List<ProductInsert> get cartProducts => _cartProducts;
  String get cartTotal => _cartTotal;


   _setCartProdcuts(List<ProductInsert> value) => _cartProducts = value;

  getAllProduct (){
    DbHelper().getAllProducts().then((value) {
      List<ProductInsert> cartProducts=value.map((e) => ProductInsert.fromJson(e)).toList();
      _setCartProdcuts(cartProducts);
      getAllCartTotalPrice();
      
    notifyListeners();
    });
    
  }
  
  _setCartTotal(String value){
    _cartTotal = value;
  }

  getAllCartTotalPrice(){
    double total = 0.0;
    _cartProducts.forEach((prod) {
      double price = double.parse(prod.product_price.toString());
      double count = double.parse(prod.product_count.toString());
      double result = price * count;
      total += result;
      notifyListeners();
     });
     _setCartTotal(total.toStringAsFixed(2));
    notifyListeners();
  }

  increaeCount(product,id) async {
    int count = product.product_count;
    count++;
    await DbHelper().updateProduct(
        ProductInsert.insertProduct(
            product_id: product.product_id,
            product_count: count,
            product_brand: product.product_brand,
            product_name: product.product_name,
            product_price: product.product_price,
            product_image_link: product.product_image_link,
            product_description: product.product_description,
            product_rating: product.product_rating,
            product_type: product.product_type,
            product_api_url: product.product_api_url),
        id);
        getAllProduct();
    notifyListeners();
  }

  decreaseCount(product,id) async {
    int count = product.product_count;
    if(count > 1){
      count--;
    }
    await DbHelper().updateProduct(
        ProductInsert.insertProduct(
            product_id: product.product_id,
            product_count: count,
            product_brand: product.product_brand,
            product_name: product.product_name,
            product_price: product.product_price,
            product_image_link: product.product_image_link,
            product_description: product.product_description,
            product_rating: product.product_rating,
            product_type: product.product_type,
            product_api_url: product.product_api_url),
        id);
        getAllProduct();
    notifyListeners();
  }
}
