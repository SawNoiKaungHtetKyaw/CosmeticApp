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

// class ProductColors {
//   String? hex_value,colour_name;
  
//   ProductColors({this.hex_value,this.colour_name});

//   factory ProductColors.fromJson(Map<String,dynamic> data){
//     return ProductColors(
//       hex_value: data["hex_value"],
//       colour_name: data["colour_name"]
//     );
//   }
// }

// {
//         "id": 488,
//         "brand": "maybelline",
//         "name": "Maybelline Fit Me Bronzer",
//         "price": "10.29",
//         "image_link": "https://d3t32hsnjxo7q6.cloudfront.net/i/d4f7d82b4858c622bb3c1cef07b9d850_ra,w158,h184_pa,w158,h184.png",
//         "description": "Why You'll Love It\n\nLightweight pigments blend easily and wear evenly\nProvides a natural, fade-proof bronzed color that leaves skin the way it was meant to be...fresh, breathing and natural\n\nFor Best Results: For soft, natural look, brush along cheekbone, sweeping upward.",
//         "rating": 4.5,
//         "product_type": "bronzer",
//         "product_api_url": "http://makeup-api.herokuapp.com/api/v1/products/488.json",
//         "product_colors": [
//             {
//                 "hex_value": "#CF9978",
//                 "colour_name": "Medium Bronze "
//             }
//         ]
//     },

