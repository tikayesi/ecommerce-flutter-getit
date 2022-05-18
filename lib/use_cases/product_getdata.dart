import 'package:flutter_proj/data/repository/product_repo.dart';
import 'package:flutter_proj/model/product.dart';

class ProductGetData {
  final ProductRepo _productRepo;

  ProductGetData(this._productRepo);

  Future<List<dynamic>> call()async{
    print('CALL USE CASE GET PRODUCT');
    List<dynamic> prod = await _productRepo.getProducts();
    print(prod);
    return prod;
  }
}
