import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kineticqr/controller/history_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerGenerator extends StatefulWidget {
  @override
  _QRScannerGeneratorState createState() => _QRScannerGeneratorState();
}

class _QRScannerGeneratorState extends State<QRScannerGenerator> {
  QRCodeController qrCodeController = Get.put(QRCodeController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;
  bool isProcessing = false;

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
        title: const Text(
          "KineticQr",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.teal,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.teal.shade50,
              child: Center(
                child: qrText != null
                    ? Text(
                        'Scanned: $qrText',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      )
                    : const Text(
                        'Scan a QR code or barcode',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
              ),
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
        qrCodeController.processScannedData(scanData.code).then((_) {
          // Reset isProcessing after processing is complete
          setState(() {
            isProcessing = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
