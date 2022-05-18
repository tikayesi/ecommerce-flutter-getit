import 'package:flutter_proj/model/product.dart';

abstract class ProductRepo{
  Future<List<dynamic>> getProducts();
  Future<Product> addProduct(Product product);
}
