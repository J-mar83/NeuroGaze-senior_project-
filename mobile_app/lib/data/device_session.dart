import 'package:mobile_app/models/user_role.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// بيحفظ دور الجهاز (مريض ولا مرافق) عشان التطبيق يفتكره بعد ما يتقفل.
class DeviceSession {
  static const _key = 'device_role';

  /// الدور الحالي. null = الجهاز لسه ما اتسجلش.
  static UserRole? role;

  /// بننادي عليها مرة واحدة في main() قبل ما التطبيق يفتح.
  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_key);
    role = UserRole.values.where((r) => r.name == saved).firstOrNull;
  }

  static Future<void> save(UserRole newRole) async {
    role = newRole;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, newRole.name);
  }

  static Future<void> clear() async {
    role = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}