class Fav{

  int id,product_id;

  Fav({required this.id,required this.product_id});

  static Map<String,dynamic> insertFav({required int product_id}){
    return {
      'product_id' : product_id
    };
  }

  factory Fav.fromJson(Map<String,dynamic> data){
    return Fav(id:data['id'], product_id: data["product_id"]);
  }

}