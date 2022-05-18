import 'package:flutter/cupertino.dart';
import 'package:flutter_proj/use_cases/product_getdata.dart';
import 'package:flutter_proj/use_cases/product_postdata.dart';

import '../../model/product.dart';

class ProductViewModel with ChangeNotifier {
  final ProductPostData _productPostData;
  final ProductGetData _productGetData;

  late Product product;

  ProductViewModel(this._productPostData, this._productGetData);

  Future<void> onPostProduct(Product product) async {
    notifyListeners();
    try {
      print('RESPONSE GET PRODUCT');
      final res = await _productPostData(product);
      print('RESPONSE');
      print(res.name);
      notifyListeners();
    } catch (e){
      print(e);
      notifyListeners();
    }
  }

  Future<List<dynamic>?> onGetProducts() async {
    notifyListeners();
    try{
      final res = await _productGetData();
      print("GET ALL PRODUCT");
      print(res[0].name);
      notifyListeners();
      return res;
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

}
