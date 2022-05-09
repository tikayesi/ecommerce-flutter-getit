import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/ioc.dart';
import 'package:flutter_proj/model/product.dart';
import 'package:flutter_proj/screens/product/product_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductViewModel _productViewModel = getIt<ProductViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: ChangeNotifierProvider(
        create: (_){
          return _productViewModel;
        },
        child: Center(
          child: Consumer<ProductViewModel>(
            builder: (context, viewModel, child){
              return Stack(
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      viewModel.onPostProduct(Product(id:"001",name: "Shampoo",productPrice: 20000,stock: 5));
                    });
                  }, child: Text('Submit'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
