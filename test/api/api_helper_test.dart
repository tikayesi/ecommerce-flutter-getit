import 'package:dio/dio.dart';
import 'package:flutter_proj/data/api/api_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  group('API helper', (){

    final Dio dio = Dio();
    late DioAdapter dioAdapter;

    setUp((){
      dioAdapter = DioAdapter(dio: dio);
    });

    test('GET Sucessfully', ()async{
      dioAdapter.onGet('/dummy', (request) {
        return request.reply(200,  {"status": "00", "message": "ok", "data": 1});
       });
       final apiHelper = ApiHelper(client: dio);
      final result = await apiHelper.getData("/dummy");
      expect(result.data, 1);
    });

    test('Get Failed', (){
      dioAdapter.onGet('/dummy', (request) {
        return request.reply(401, null);
       });
       final apiHelper = ApiHelper(client: dio);
       expect(()async=> await apiHelper.getData('/dummy'), throwsException);
    });


    test('Post Successfuly', ()async{
      dioAdapter.onPost('/dummy', (request) {
        return request.reply(200,  {"status": "200", "message": "ok", "data": 1});
       });
              final apiHelper = ApiHelper(client: dio);
              Map<String, dynamic> data = {"id":{"apa":"apa"}};
      final result = await apiHelper.postData("/dummy",  data);
      expect(result.data, 1);
    });

       test('Post Failed', (){
      dioAdapter.onPost('/dummy', (request) {
        return request.reply(401, null);
       });
       final apiHelper = ApiHelper(client: dio);
       expect(()async=> await apiHelper.postData('/dummy', {"id":1}), throwsException);
    });


  });
}