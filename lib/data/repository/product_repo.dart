import 'package:flutter_proj/model/product.dart';

abstract class ProductRepo{
  Future<List<Product>> getProducts();
  Future<Product> addProduct(Product product);
}
