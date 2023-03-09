import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SneakerModel extends Equatable {
  /// The sneaker manufacturer
  final String manufacturer;

  /// Brand name of sneaker
  final String brandName;

  /// Sneaker's image path
  final String imagePath;

  /// Price of sneaker
  final double price;

  /// Short sneaker model
  final String model;

  // Short description about the sneaker
  final String description;

  final Color color;

  const SneakerModel({
    required this.manufacturer,
    required this.brandName,
    required this.model,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.color,
  });

  @override
  List<Object> get props => [
        manufacturer,
        brandName,
        imagePath,
        price,
      ];
}

List<SneakerModel> sneakers = [
  const SneakerModel(
    manufacturer: 'Nike',
    brandName: 'Nike Air',
    model: 'Air Jordan 1 Mid SE GC',
    imagePath: AssetConsts.nikeAirJordanYellow,
    price: 500.00,
    description: '',
    color: AppColor.gold,
  ),
  const SneakerModel(
    manufacturer: 'Nike',
    brandName: 'Nike Air',
    model: 'Air Jordan 2 Mid SE GC',
    imagePath: AssetConsts.nikeAirJordanCyan,
    price: 500.00,
    description: '',
    color: AppColor.cyan,
  ),
  const SneakerModel(
    manufacturer: 'Nike',
    brandName: 'Nike Air',
    model: 'Air Jordan 3 Mid SE GC',
    imagePath: AssetConsts.nikeAirJordanGreen,
    price: 500.00,
    description: '',
    color: AppColor.green,
  ),
  const SneakerModel(
    manufacturer: 'Nike',
    brandName: 'Nike Air',
    model: 'Air Jordan 4 Mid SE GC',
    imagePath: AssetConsts.nikeAirJordanRed,
    price: 500.00,
    description: '',
    color: AppColor.red,
  ),
];
