import 'package:flutter/cupertino.dart';
import 'package:flutter_proj/use_cases/product_postdata.dart';

import '../../model/product.dart';

class ProductViewModel with ChangeNotifier {
  final ProductPostData _productPostData;

  late Product product;

  ProductViewModel(this._productPostData);

  Future<void> onPostProduct(Product product) async {
    notifyListeners();
    try {
      final res = await _productPostData(product);
      print('RESPONSE');
      print(res.name);
      notifyListeners();
    } catch (e){
      print(e);
      notifyListeners();
    }
  }

}
