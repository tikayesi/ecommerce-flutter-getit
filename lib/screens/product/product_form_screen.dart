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
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nama Product",
                            labelText: "Nama Product",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            )
                          ),
                          controller: nameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Harga Product",
                              labelText: "Harga Product",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                          controller: priceController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Stock Product",
                              labelText: "Stock Product",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                          controller: stockController,
                        ),
                      ),
                      TextButton(onPressed: (){
                        setState(() {
                          viewModel.onPostProduct(
                              Product(name: nameController.text,
                                      productPrice: int.parse(priceController.text),
                                      stock: int.parse(stockController.text)));
                        });
                      }, child: const Text('Submit'))
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

