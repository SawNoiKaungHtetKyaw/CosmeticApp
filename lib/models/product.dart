class Product {
  int? id;
  double? rating;
  String? brand,
      name,
      price,
      image_link,
      description,
      product_type,
      product_api_url;
  // List<ProductColors>? product_colors;

  Product(
      {this.id,
      this.brand,
      this.name,
      this.price,
      this.image_link,
      this.description,
      this.rating,
      this.product_type,
      this.product_api_url});

  factory Product.fromJson(Map<String,dynamic> data){

    return Product(
      id: data['id'],
      brand: data['brand'],
      name: data['name'],
      price: data['price'],
      image_link: data['image_link'],
      description: data['description'],
      rating: data['rating'],
      product_type: data['product_type'],
      product_api_url: data['product_api_url']
    );
  }

  
}
