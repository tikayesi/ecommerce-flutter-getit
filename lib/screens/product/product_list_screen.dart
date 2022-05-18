import 'package:flutter/material.dart';
import 'package:flutter_proj/ioc.dart';
import 'package:flutter_proj/model/product.dart';
import 'package:flutter_proj/screens/product/product_form_screen.dart';
import 'package:flutter_proj/screens/product/product_viewmodel.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductViewModel _productViewModel = getIt<ProductViewModel>();
  List<dynamic> listProduct = <Product>[];

  @override
  void initState(){
    super.initState();
    _getListProduct();
  }

  _getListProduct()async{
    listProduct = (await _productViewModel.onGetProducts())!;
    setState(() {
    listProduct = listProduct;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: Scrollbar(child: ListView.builder(
                itemCount: listProduct.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: ListTile(
                                leading: Text((index+1).toString()),
                                title: Text(
                                  listProduct[index].name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
              ),
    )
                          ],
                        )
                      ],
                    );
                  }),

              )),
          ),
          // );
        ],
      ),
    );
  }
}
