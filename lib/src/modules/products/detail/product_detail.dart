import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {

  const ProductDetail({ Key? key }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Products Detail'),),
           body: Container(),
       );
  }
}