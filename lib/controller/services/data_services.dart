import 'package:kineticqr/view/shared_prefrence_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Your singleton class

class DataService {
  Future<void> saveData(String data) async {
    final SharedPreferences prefs = SharedPreferencesService.prefs;
    final int timestamp = DateTime.now().millisecondsSinceEpoch;

    await prefs.setString('savedData', data);
    await prefs.setInt('timestamp', timestamp);
  }

  Future<String?> getData() async {
    final SharedPreferences prefs = SharedPreferencesService.prefs;
    final int? savedTimestamp = prefs.getInt('timestamp');
    final String? savedData = prefs.getString('savedData');

    if (savedTimestamp != null && savedData != null) {
      final int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
      final Duration elapsed = Duration(milliseconds: currentTimestamp - savedTimestamp);

      if (elapsed.inHours >= 24) {
        await prefs.remove('savedData');
        await prefs.remove('timestamp');
        return null;
      }

      return savedData;
    }

    return null;
  }
}
