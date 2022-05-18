import 'package:flutter_proj/data/api/api_helper.dart';
import 'package:flutter_proj/data/api/api_path.dart';
import 'package:flutter_proj/data/repository/product_repo.dart';
import 'package:flutter_proj/model/product.dart';
import 'package:flutter_proj/model/product_response.dart';

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
  Future<List<dynamic>> getProducts() async {
    final result = await apiHelper.getData(products);
    print('Ress');
    print(result.data);
    return ProductResponse.fromList(result.data).products;
  }
}
