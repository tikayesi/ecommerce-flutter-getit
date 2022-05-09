import 'package:flutter_proj/data/api/api_helper.dart';
import 'package:flutter_proj/data/api/api_path.dart';
import 'package:flutter_proj/data/repository/product_repo.dart';
import 'package:flutter_proj/model/product.dart';

class ProductRepoApiImpl implements ProductRepo{

  late final apiHelper;


  ProductRepoApiImpl(ApiHelper helper){
    apiHelper = helper;
  }

  @override
  Future<Product> addProduct(Product product) async {
    final result = await apiHelper.postData(products, product.toMap());
    print('RESULT');
    print(result.data);
    return Product.fromMap(result.data);
  }

  @override
  Future<List<Product>> getProducts() async {
    final result = await apiHelper.getData(products);
    return result.data;
  }

}
