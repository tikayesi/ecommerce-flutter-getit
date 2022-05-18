class Product{
  String? id;
  String name;
  int productPrice;
  int stock;

  Product({this.id, required this.name, required this.productPrice, required this.stock});

  Map<String, dynamic> toMap() => {
    'id' : id,
    'name' : name,
    'productPrice' : productPrice,
    'stock' : stock
  };

  Product.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        productPrice = map['productPrice'],
        stock = map['stock'];
}
