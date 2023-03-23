import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:online_shop_app/databases/db_helper.dart';
import 'package:online_shop_app/models/fav.dart';

class FavoriteController extends ChangeNotifier {
  List<int> _favoriteProducts = [];

  List<int> get favoriteProducts => _favoriteProducts;

  addFav(fav) {
    DbHelper().insertFavProduct(fav);
    getAllFavProduct();
    notifyListeners();
  }

  getAllFavProduct() {
    DbHelper().getAllFav().then((value) {
      List<Fav> favData = value.map((e) => Fav.fromJson(e)).toList();
      List<int> fav = [];
      favData.forEach((element) {
        fav.add(element.product_id);
      });
      _favoriteProducts = fav;

      notifyListeners();
    });
  }

  removeFav(int id) {
    DbHelper().deleteFav(id);
    getAllFavProduct();
    notifyListeners();
  }

  // deleteAllFav() {
  //   DbHelper().deleteAllFav();
  //   notifyListeners();
  // }
}
