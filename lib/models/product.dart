import 'package:flutter/material.dart';

class ProductModel {
  @required
  String? imageUrl;
  @required
  String? title;
  @required
  int? price;
  @required
  String? desc;

  ProductModel(this.imageUrl, this.title, this.price, this.desc);
}
