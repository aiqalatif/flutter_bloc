import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:kineticqr/controller/controller.dart';

class QRCodeHistoryScreen extends StatelessWidget {
  final QRCodeController qrCodeController = Get.find<QRCodeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code History'),
      ),
      body: Obx(() {
        if (qrCodeController.qrCodeHistory.isEmpty) {
          return  const Center(
            child:  Text('No scan history available.',style: TextStyle(),),
          );
        }

        return ListView.builder(
          itemCount: qrCodeController.qrCodeHistory.length,
          itemBuilder: (context, index) {
            var item = qrCodeController.qrCodeHistory[index];
            return ListTile(
              title: Text(item['code']),
              subtitle: Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(item['timestamp'])),
            );
          },
        );
      }),
    );
  }
}
