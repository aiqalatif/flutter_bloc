import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kineticqr/controller/controller.dart';
import 'package:kineticqr/view/data_services.dart';

class QRCodeHistoryScreen extends StatefulWidget {
  @override
  State<QRCodeHistoryScreen> createState() => _QRCodeHistoryScreenState();
}

class _QRCodeHistoryScreenState extends State<QRCodeHistoryScreen> {
  final QRCodeController qrCodeController = Get.find<QRCodeController>();
  final DataService _dataService = DataService();
  List<String> _dataList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String? data = await _dataService.getData();
    setState(() {
      if (data != null) {
        _dataList = data.split('\n'); // Assuming data is separated by newlines
      } else {
        _dataList = ['No data available or data has expired.'];
      }
    });
  }

  Future<void> _saveData() async {
    final dataToSave = 'Sample data saved at ${DateTime.now()}';
    await _dataService.saveData(dataToSave);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code History'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadData,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _saveData,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_dataList[index]),
          );
        },
      ),
    );
  }
}
