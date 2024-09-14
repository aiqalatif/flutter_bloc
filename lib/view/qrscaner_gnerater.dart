import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kineticqr/controller/controller.dart';
import 'package:kineticqr/controller/qrcode_controller_scan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerGenerator extends StatefulWidget {
  @override
  _QRScannerGeneratorState createState() => _QRScannerGeneratorState();
}

class _QRScannerGeneratorState extends State<QRScannerGenerator> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;
  bool isProcessing = false;
  QRCodeController qrCodeController = Get.put(QRCodeController());
  QRCodeC qrCode = Get.put(QRCodeC());

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: qrText != null
                  ? Text('Scanned: $qrText')
                  : Text('Scan a QR code or barcode'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isProcessing) {
        setState(() {
          qrText = scanData.code;
          isProcessing = true;
        });
        qrCode.addToHistory(scanData.code!);
        _processScannedData(scanData.code);
      }
    });
  }

  void _processScannedData(String? scannedData) {
    if (scannedData != null) {
      // Handle scanned data if needed
    }
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isProcessing = false;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

