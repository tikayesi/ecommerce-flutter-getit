import 'package:flutter_proj/data/repository/product_repo.dart';
import 'package:flutter_proj/ioc.dart';
import 'package:flutter_proj/model/product.dart';
import 'package:flutter_proj/use_cases/product_getdata.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MyProductRepoMock implements ProductRepo{

  @override
  Future<List<dynamic>> getProducts(){
    return Future.value([{"id" : "001", "name" : "product", "productPrice" : 5000, "stock" : 4 }]);
  }

  @override
  Future<Product> addProduct(Product product){
    return Future.value(Product(id: '001', name: 'Product', productPrice: 5000, stock: 3));
  }

  // @GenerateMocks([ProductRepo])
  void main() {
    setUpAll(() {
      getIt.registerFactory<ProductRepo>(() => MyProductRepoMock());
    });

    group('Product use case', (){
      test('Product use case should be called', () async {
      //   final client = MockProductRepo();
      // when(client.increment()).thenAnswer((_) async => 100);
      // final productUseCase = ProductGetData(client);
      // final actual = await productUseCase();
      // expect(actual, 100);
      });

    });
  }

}