import 'package:get/get.dart';

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
  
}
