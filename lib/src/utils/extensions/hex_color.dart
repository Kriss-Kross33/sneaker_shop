import 'package:flutter/material.dart';

extension HexColor on Color {
  String toHex() => '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';
}
