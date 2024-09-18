import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class QRCodeController extends GetxController {
  var qrCodeHistory = <Map<String, dynamic>>[].obs; // List of scanned QR codes

  // Add scanned QR code with timestamp
  void addQRCode(String qrCode) {
    DateTime now = DateTime.now();
    qrCodeHistory.add({'code': qrCode, 'timestamp': now});
    removeOldQRCodes(); // Clean up old QR codes
  }

  // Remove QR codes older than 24 hours
  void removeOldQRCodes() {
    DateTime now = DateTime.now();
    qrCodeHistory.removeWhere((element) {
      DateTime scanTime = element['timestamp'];
      return now.difference(scanTime).inHours >= 24;
    });
  }

  Future<void> processScannedData(String? scannedData) async {
    if (scannedData != null) {
      addQRCode(scannedData); // Add to history
      if (_isValidURL(scannedData)) {
        // Open URL in browser if it's a valid URL
        if (await canLaunch(scannedData)) {
          await launch(scannedData);
        } else {
          throw 'Could not launch $scannedData';
        }
      } else {
        // Handle non-URL QR codes (optional)
        if (kDebugMode) {
          print('Scanned data is not a URL');
        }
      }
    }
  }

  bool _isValidURL(String url) {
    final Uri uri = Uri.parse(url);
    return uri.scheme == "http" || uri.scheme == "https";
  }
}
