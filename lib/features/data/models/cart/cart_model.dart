// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eshop_app/core/constant/app_assets/app_assets.dart';

class Product {
  final String name;
  final double price;
  final String image;
  Product({
    required this.name,
    required this.price,
    required this.image,
  });
  static List<Product> products = [
    Product(name: "Face Mask", price: 20.0, image: AppAssets.faceMask),
    Product(name: "Smart Bag", price: 70.0, image: AppAssets.smartBag),
    Product(name: "Smart Watch", price: 120.0, image: AppAssets.smartWatch),
    Product(name: "Face Mask", price: 20.0, image: AppAssets.faceMask),
    Product(name: "Smart Bag", price: 70.0, image: AppAssets.smartBag),
    Product(name: "Smart Watch", price: 120.0, image: AppAssets.smartWatch),
  ];
}
