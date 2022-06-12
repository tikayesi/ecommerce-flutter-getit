import 'package:dio/dio.dart';
import 'package:flutter_proj/data/api/api_helper.dart';
import 'package:flutter_proj/data/api/api_path.dart';
import 'package:flutter_proj/data/repository/product_repo_api_impl.dart';
import 'package:flutter_proj/model/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  group('Product Repo API', (){
    final Dio dio = Dio();
    late ApiHelper apiHelper;
    late DioAdapter dioAdapter;

     setUp(() {
      dioAdapter = DioAdapter(dio: dio);
      apiHelper = ApiHelper(client: dio);
    });

    test('Product value get list of data', () async {
      List<dynamic> data = [{"id" : "001", "name" : "product", "productPrice" : 5000, "stock" : 4 }];
      dioAdapter.onGet(
        products,
        (request) =>
            request.reply(200, {"status": "00", "message": "ok", "data": data}),
      );

      final product = ProductRepoApiImpl(apiHelper);
      final result = await product.getProducts();
      expect(result[0].id, "001");

    });

    test('Product value should throw', () async {
      dioAdapter.onGet(
        products,
        (request) => request.reply(500, null),
      );

      final product = ProductRepoApiImpl(apiHelper);
      expect(() async => await product.getProducts(), throwsException);
    });

      test('Product value post product data', () async {
        // dynamic data = {"id" : "001", "name" : "product", "productPrice" : 5000, "stock" : 4 };
      // List<dynamic> data = [];
      Product data = Product(name: "001", productPrice: 5000, stock: 3);
      dioAdapter.onPost(
        products,
        (request) =>
            request.reply(200, {"status": "00", "message": "ok", "data": data}),
      );

      final product = ProductRepoApiImpl(apiHelper);
      final result = await product.addProduct(data);
      expect(result, data);
      
    });

  });
}