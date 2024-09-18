
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kineticqr/controller/qrcode_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';


class QRCodeGenerate extends StatefulWidget {
  const QRCodeGenerate({super.key});

  @override
  State<QRCodeGenerate> createState() => _QRCodeGenerateState();
}

class _QRCodeGenerateState extends State<QRCodeGenerate> {
  final QRController qrCodeController = Get.put(QRController());
  final TextEditingController _inputController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: const Text("QR Code Generator",style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.teal,
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown to select the type of data to generate QR code
          Obx(() {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: DropdownButton<String>(
                value: qrCodeController.qrType.value,
                onChanged: (String? newValue) {
                  qrCodeController.updateQRType(newValue ?? 'Text');
                },
                items: ['Text', 'URL', 'Contact', 'Wi-Fi']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                underline:  const SizedBox(),
              ),
            );
          }),
      
          const SizedBox(height: 20),
      
          // TextField for input based on the selected type
          Obx(() {
            return TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: qrCodeController.qrType.value == 'Text'
                    ? 'Enter text'
                    : qrCodeController.qrType.value == 'URL'
                        ? 'Enter URL'
                        : qrCodeController.qrType.value == 'Contact'
                            ? 'Enter contact info (vCard)'
                            : 'Enter Wi-Fi details (SSID, Password)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.teal.shade50,
                prefixIcon: Icon(
                  qrCodeController.qrType.value == 'Text'
                      ? Icons.text_fields
                      : qrCodeController.qrType.value == 'URL'
                          ? Icons.link
                          : qrCodeController.qrType.value == 'Contact'
                              ? Icons.contact_phone
                              : Icons.wifi,
                  color: Colors.teal,
                ),
              ),
            );
          }),
      
          const SizedBox(height: 20),
      
          // Button to generate QR Code
          Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
              onPressed: () {
                qrCodeController.updateQRData(_inputController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
              ),
              child: const Text('Generate QR Code',style: TextStyle(color: Colors.white),),
            ),
          ),
      
          const SizedBox(height: 20),
      
          // Display generated QR Code
          Obx(() {
            return qrCodeController.qrData.isNotEmpty
                ? Column(
                    children: [
                      // Wrap the QR code inside the Screenshot widget to capture it later
                      Screenshot(
                        controller: qrCodeController.screenshotController,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow:  const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                          child: QrImageView(
                            data: qrCodeController.qrData.value,
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
      
                      // Button to save QR Code as Image and share
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: ElevatedButton(
                          onPressed: qrCodeController.captureAndShareScreenshot,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                          ),
                          child: const Text('Save and Share QR Code',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  )
               : const SizedBox.shrink();
          }),
        ],
      ),
    ),
  ),
);

  }
}
