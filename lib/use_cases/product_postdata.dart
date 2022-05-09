import 'package:flutter_proj/data/repository/product_repo.dart';
import 'package:flutter_proj/model/product.dart';

class ProductPostData {
final ProductRepo _productRepo;

ProductPostData(this._productRepo);

Future<Product> call(Product product){
  return _productRepo.addProduct(product);
}
}
