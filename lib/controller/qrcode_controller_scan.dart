import 'package:get/get.dart';


class QRCodeC extends GetxController {
  var qrCodeHistory = <Map<String, dynamic>>[].obs; // List to store scan history

  void addToHistory(String code) {
    qrCodeHistory.add({
      'code': code,
      'timestamp': DateTime.now(),
    });
  }
}