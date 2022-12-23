import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:online_shop_app/util/api_status.dart';

class Api{

  static const String BASE_URL = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

  static Future<Object> get() async{
    try{
      Uri uri = Uri.parse("$BASE_URL");
      var respone = await http.get(uri);
      if(respone.statusCode == 200){
        var resBody = jsonDecode(respone.body);
        return Success(code: 200, respone: resBody);
      }else{
        return Failure(code: 203, respone: "Data Fetching Error");
      }
    }on SocketException{
      return Failure(code: 203, respone: "No internet connection");
    }catch(e){
      return Failure(code: 203, respone: "Unknow Error");
    }
  }

}