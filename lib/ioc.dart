import 'package:flutter_proj/app_config.dart';
import 'package:flutter_proj/data/api/api_helper.dart';
import 'package:flutter_proj/data/repository/product_repo.dart';
import 'package:flutter_proj/data/repository/product_repo_api_impl.dart';
import 'package:flutter_proj/screens/product/product_viewmodel.dart';
import 'package:flutter_proj/use_cases/product_getdata.dart';
import 'package:flutter_proj/use_cases/product_postdata.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingletonAsync<AppConfig>(() async {
    final config = await AppConfig.forEnvironment();
    return config;
  });

  getIt.registerSingletonWithDependencies<ApiHelper>(
      () => ApiHelper(client: getIt.get<AppConfig>().httpClient),
      dependsOn: [AppConfig]);

  getIt.registerFactory<ProductRepo>(
      () => ProductRepoApiImpl(getIt<ApiHelper>()),
      instanceName: 'ProductApiRepo');

  getIt.registerFactory<ProductPostData>(() =>
      ProductPostData(getIt<ProductRepo>(instanceName: 'ProductApiRepo')));

  getIt.registerFactory<ProductGetData>(() =>
      ProductGetData(getIt<ProductRepo>(instanceName: 'ProductApiRepo'))
  );

  getIt.registerFactory<ProductViewModel>(() =>
  ProductViewModel(getIt<ProductPostData>(), getIt<ProductGetData>()));
}
