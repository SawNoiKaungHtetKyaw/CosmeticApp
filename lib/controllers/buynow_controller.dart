import 'package:flutter/cupertino.dart';

class BuyNowController extends ChangeNotifier{

  String _total = "";
  int _count = 1;

  String get total => _total;
  int get count => _count;

  _setTotal (String value){
    _total = value;
  }

  _setCount (int value){
    _count = value;
  }

  setTotalForDetailPage(String value){
    _setTotal(value);
  }
  
  increseCount(){
    _count++;
    _setCount(_count);
    notifyListeners();

  }

  decreseCount(){
    if(_count > 1){
      _count--;
    _setCount(_count);
    notifyListeners();
    }
  }

  setCountFromCart(int count){
    _setCount(count);
    notifyListeners();

  }

  getTotalPrice(double price){
    double total = price * _count;
    _setTotal(total.toStringAsFixed(2));
    notifyListeners();
  }

}