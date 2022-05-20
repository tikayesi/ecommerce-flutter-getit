import 'package:flutter/material.dart';
import 'package:flutter_proj/ioc.dart';
import 'package:flutter_proj/screens/product/product_form_screen.dart';
import 'package:flutter_proj/screens/product/product_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductList(),
      routes: {
        '/product-list': (context) => const ProductList(),
        'product-screen' : (context) => const ProductScreen()
      }
    );
  }
}
