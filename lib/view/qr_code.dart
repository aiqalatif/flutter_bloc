import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQRCodeWidget extends StatelessWidget {
  final String data;
  final double size;

  CustomQRCodeWidget({required this.data, this.size = 200.0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  QrImageView(
      data: data,
      version: QrVersions.auto,
      size: size,
    ),
    );
  }
}
