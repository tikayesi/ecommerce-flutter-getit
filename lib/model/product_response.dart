import 'package:flutter_proj/model/product.dart';

class ProductResponse{
  List<dynamic> products;

  ProductResponse({required this.products});

  factory ProductResponse.fromList(List<dynamic> listOfBook){
    List<dynamic> listProduct = listOfBook.map((e) => Product.fromMap(e)).toList();

    return ProductResponse(products: listProduct);
  }

}
