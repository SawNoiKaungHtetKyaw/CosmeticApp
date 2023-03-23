class ProductInsert {
  int? product_id, product_count;
  double? product_rating;
  String? product_brand,
      product_name,
      product_price,
      product_image_link,
      product_description,
      product_type,
      product_api_url;

  ProductInsert(
      {this.product_id,
      this.product_count,
      this.product_brand,
      this.product_name,
      this.product_price,
      this.product_image_link,
      this.product_description,
      this.product_rating,
      this.product_type,
      this.product_api_url});

  static Map<String, dynamic> insertProduct(
      {required int product_id,
      required int product_count,
      required String product_brand,
      required String product_name,
      required String product_price,
      required String product_image_link,
      required String product_description,
      required double product_rating,
      required String product_type,
      required String product_api_url}) {
    return {
      'product_id': product_id,
      'product_count': product_count,
      'product_brand': product_brand,
      'product_name': product_name,
      'product_price': product_price,
      'product_image_link': product_image_link,
      'product_description': product_description,
      'product_rating': product_rating,
      'product_type': product_type,
      'product_api_url': product_api_url,
    };
  }

  factory ProductInsert.fromJson(Map<String, dynamic> data) {
    return ProductInsert(
      product_id: data["product_id"],
      product_count: data['product_count'],
      product_brand: data['product_brand'],
      product_name: data['product_name'],
      product_price: data['product_price'],
      product_image_link: data['product_image_link'],
      product_description: data['product_description'],
      product_rating: data['product_rating'],
      product_type: data['product_type'],
      product_api_url: data['product_api_url'],
    );
  }
}
