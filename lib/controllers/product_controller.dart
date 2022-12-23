
import 'package:flutter/cupertino.dart';
import 'package:online_shop_app/models/product.dart';
import 'package:online_shop_app/util/api.dart';
import 'package:online_shop_app/util/api_status.dart';

class ProductController extends ChangeNotifier{

  bool _isLoading = false;
  bool _isError = false;
  String _errMsg = "";
  List<Product> _products = [];

  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errMsg => _errMsg;
  List<Product> get products => _products;

  _setLoading(bool isLoading){
    _isLoading = isLoading;
  }

  _setError (bool isError,String errMsg){
    _isError = isError;
    _errMsg = errMsg;
  }

  _setProduct(List<Product> products){
    _products = products;
  }

  getProduct() async{
    _setLoading(true);
    Object resBody = await Api.get();
    if(resBody is Success){
      List list = resBody.respone as List;
      List<Product> products = list.map((e) => Product.fromJson(e)).toList();
      _setProduct(products);
      
    }

    if(resBody is Failure){
      _setError(true, resBody.respone.toString());
    }

    notifyListeners();

    _setLoading(false);

  }

}