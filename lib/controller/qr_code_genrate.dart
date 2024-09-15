import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;

class QRController extends GetxController {
  var qrData = ''.obs; // Holds the data for QR generation
  var qrType = 'Text'.obs; // Default type is Text

  void updateQRData(String data) {
    qrData.value = data;
  }

  void updateQRType(String type) {
    qrType.value = type;
  }
 final ScreenshotController screenshotController = ScreenshotController();
  
Future<void> captureAndShareScreenshot() async {
  try {
    // Request storage permission
    if (await Permission.storage.request().isGranted || 
        await Permission.manageExternalStorage.request().isGranted) {
      
      // Capture the screenshot
      final Uint8List? image = await screenshotController.capture(delay: const Duration(milliseconds: 100));
      if (image != null) {
        // Save the image to the gallery using raw bytes
        final result = await ImageGallerySaver.saveImage(image, name: 'qr_code_screenshot');
        print('Image saved to gallery: $result');

        // Extract the content URI from the result
        final savedFileUri = result['filePath'] as String?; // This will be the content URI

        // Share the image if saved successfully
        if (savedFileUri != null) {
          // Share the image using the content URI with XFile.fromUri
          await Share.shareXFiles([XFile(savedFileUri)]);
        } else {
          print('Saved file not found.');
        }
      } else {
        print('Screenshot capture failed.');
      }
    } else {
      print('Storage permission not granted');
    }
  } catch (e) {
    print('Error occurred while capturing or sharing the screenshot: $e');
  }
}

  // Generate a QR Image file and return it as a File
Future<File?> generateQRImage(String data) async {
    try {
        final qrCode = QrPainter(
            data: data,
            version: QrVersions.auto,
            gapless: false,
        );
        final ui.PictureRecorder recorder = ui.PictureRecorder();
        final Canvas canvas = Canvas(recorder);

        const double qrSize = 300.0;
        final Size size = Size(qrSize, qrSize);
        qrCode.paint(canvas, size);

        final ui.Image img = await recorder
            .endRecording()
            .toImage(size.width.toInt(), size.height.toInt());

        final ByteData? byteData = await img.toByteData(format: ui.ImageByteFormat.png);

        if (byteData != null) {
            final buffer = byteData.buffer.asUint8List();
            final directory = await getApplicationDocumentsDirectory();
            final file = File('${directory.path}/qr_code.png');
            await file.writeAsBytes(buffer);
            return file;
        } else {
            print("ByteData ############# is null");
        }
    } catch (e) {
        print("Error generating QR Image: $e");
    }
    return null;
}

  // Share the generated QR Code Image
  Future<void> shareQRCodeImage(File file) async {
    try {
      await Share.shareXFiles([XFile(file.path)], text: 'Here is my QR code!');
    } catch (e) {
      print('Error sharing QR Code: $e');
    }
  }
}
