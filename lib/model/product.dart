class Product {

  //variables
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;


  //constructor
  Product(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
      });


  //deserialized json object
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];

  }


  //serialization of json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;

    return data;
  }
}

