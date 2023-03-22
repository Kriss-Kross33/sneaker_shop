import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SneakerModel extends Equatable {
  /// The sneaker manufacturer
  final String manufacturer;

  /// Brand name of sneaker
  final String brandName;

  final List<SneakerColor> sneakerColors;

  /// Price of sneaker
  final double price;

  /// Short sneaker model
  final String model;

  // Short description about the sneaker
  final String description;

  const SneakerModel({
    required this.manufacturer,
    required this.brandName,
    required this.model,
    required this.price,
    required this.description,
    required this.sneakerColors,
  });

  @override
  List<Object> get props => [
        manufacturer,
        brandName,
        sneakerColors,
        price,
      ];

  factory SneakerModel.fromJson(Map<String, dynamic> json) {
    List<SneakerColor> sneakerColors = <SneakerColor>[];
    if (json['telcos'] != null) {
      List<dynamic> sneakerColorData = json['sneakerColors'];
      for (var sneakerColor in sneakerColorData) {
        sneakerColors.add(SneakerColor.fromJson(sneakerColor));
      }
      // parsedJson['telcos'].forEach((v) {
      //   _telcos.add(TelcoModel.fromJson(v));
      // });
    }
    return SneakerModel(
      manufacturer: json['manufacturer'],
      brandName: json['brandName'],
      model: json['model'],
      description: json['description'],
      sneakerColors: sneakerColors,
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['manufacturer'] = manufacturer;
    data['brandName'] = brandName;
    data['model'] = model;
    data['price'] = price;
    data['description'] = description;
    data['sneakerColors'] = sneakerColors
        .map(
          (sneakerColor) => sneakerColor.toJson(),
        )
        .toList();
    return data;
  }
}

class SneakerColor extends Equatable {
  final Color color;
  final String imagePath;

  const SneakerColor({required this.color, required this.imagePath});

  factory SneakerColor.fromJson(Map<String, dynamic> json) {
    return SneakerColor(
      color: Color(json['color']),
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['color'] = color.toHex();
    data['imagePath'] = imagePath;

    return data;
  }

  @override
  List<Object?> get props => [
        color,
        imagePath,
      ];
}

List<SneakerModel> sneakers = [
  const SneakerModel(
    manufacturer: 'Nike',
    brandName: 'Nike Air',
    model: 'Air Jordan 1 Mid SE GC',
    sneakerColors: <SneakerColor>[
      SneakerColor(
        color: AppColor.gold,
        imagePath: AssetConsts.nikeAirJordanYellow,
      ),
      SneakerColor(
        color: AppColor.cyan,
        imagePath: AssetConsts.nikeAirJordanCyan,
      ),
      SneakerColor(
        color: AppColor.red,
        imagePath: AssetConsts.nikeAirJordanRed,
      ),
      SneakerColor(
        color: AppColor.green,
        imagePath: AssetConsts.nikeAirJordanGreen,
      ),
    ],
    price: 500.00,
    description: '',
  ),
  const SneakerModel(
    manufacturer: 'Nike',
    brandName: 'Nike Zoom',
    model: 'nike air zoom structure 22',
    sneakerColors: <SneakerColor>[
      SneakerColor(
        color: AppColor.darkGreen,
        imagePath: AssetConsts.nikeZoomDeepGreen,
      ),
      SneakerColor(
        color: AppColor.violet,
        imagePath: AssetConsts.nikeZoomViolet,
      ),
      SneakerColor(
        color: AppColor.charcoalBlack,
        imagePath: AssetConsts.nikeZoomBlack,
      ),
      SneakerColor(
        color: AppColor.lemonGreen,
        imagePath: AssetConsts.nikeZoomLemonGreen,
      ),
    ],
    price: 500.00,
    description: '',
  ),
  // const SneakerModel(
  //   manufacturer: 'Nike',
  //   brandName: 'Nike Air',
  //   model: 'Air Jordan 1 Mid SE GC',
  //   images: <String>[
  //     AssetConsts.nikeAirJordanCyan,
  //     AssetConsts.nikeAirJordanYellow,
  //     AssetConsts.nikeAirJordanRed,
  //     AssetConsts.nikeAirJordanGreen,
  //   ],
  //   price: 500.00,
  //   description: '',
  //   colors: <Color>[
  //     AppColor.gold,
  //     AppColor.cyan,
  //     AppColor.green,
  //     AppColor.red,
  //   ],
  // ),
  // const SneakerModel(
  //   manufacturer: 'Nike',
  //   brandName: 'Nike Air',
  //   model: 'Air Jordan 1 Mid SE GC',
  //   images: <String>[
  //     AssetConsts.nikeAirJordanGreen,
  //     AssetConsts.nikeAirJordanCyan,
  //     AssetConsts.nikeAirJordanYellow,
  //     AssetConsts.nikeAirJordanRed,
  //   ],
  //   price: 500.00,
  //   description: '',
  //   colors: <Color>[
  //     AppColor.gold,
  //     AppColor.cyan,
  //     AppColor.green,
  //     AppColor.red,
  //   ],
  // ),
  // const SneakerModel(
  //   manufacturer: 'Nike',
  //   brandName: 'Nike Air',
  //   model: 'Air Jordan 1 Mid SE GC',
  //   images: <String>[
  //     AssetConsts.nikeAirJordanRed,
  //     AssetConsts.nikeAirJordanGreen,
  //     AssetConsts.nikeAirJordanCyan,
  //     AssetConsts.nikeAirJordanYellow,
  //   ],
  //   price: 500.00,
  //   description: '',
  //   colors: <Color>[
  //     AppColor.gold,
  //     AppColor.cyan,
  //     AppColor.green,
  //     AppColor.red,
  //   ],
  // ),
];
