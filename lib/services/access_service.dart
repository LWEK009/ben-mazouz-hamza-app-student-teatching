import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_data.dart';

/// Unlocks Drive without a database.
/// Each phone gets a unique ID; the 8-digit code only works on that phone.
class AccessService {
  AccessService._();
  static final AccessService instance = AccessService._();

  static const _unlockedKey = 'drive_access_unlocked';
  static const _deviceIdKey = 'drive_access_device_id';

  Future<bool> isUnlocked() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_unlockedKey) ?? false;
  }

  Future<String> getDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString(_deviceIdKey);
    if (id == null || id.isEmpty) {
      id = _generateDeviceId();
      await prefs.setString(_deviceIdKey, id);
    }
    return id;
  }

  /// Teacher uses this with the student's device ID to create their code.
  String codeForDevice(String deviceId) {
    final normalized = normalizeDeviceId(deviceId);
    final hmac = Hmac(sha256, utf8.encode(AppData.unlockSecret));
    final digest = hmac.convert(utf8.encode(normalized));
    final n = BigInt.parse(digest.toString().substring(0, 12), radix: 16) %
        BigInt.from(100000000);
    return n.toString().padLeft(8, '0');
  }

  static String normalizeDeviceId(String deviceId) {
    return deviceId.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
  }

  Future<bool> tryUnlock(String inputCode) async {
    final deviceId = await getDeviceId();
    final expected = codeForDevice(deviceId);
    final cleaned = inputCode.replaceAll(RegExp(r'\D'), '');
    if (cleaned.length != 8 || cleaned != expected) {
      return false;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_unlockedKey, true);
    return true;
  }

  String _generateDeviceId() {
    const chars = '23456789ABCDEFGHJKLMNPQRSTUVWXYZ';
    final random = Random.secure();
    final charsList = List.generate(8, (_) => chars[random.nextInt(chars.length)]);
    return '${charsList.take(4).join()}-${charsList.skip(4).join()}';
  }
}
