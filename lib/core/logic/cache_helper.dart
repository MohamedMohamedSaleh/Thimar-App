import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable_orders_project/views/auth/login/login_model.dart';

class CacheHelper {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> clearUserData() async {
    return _prefs.clear();
  }

  static Future<void> setIsFavorite(bool value) async {
    await _prefs.setBool('isFavorite', value);
  }
  static Future<void> setInCart(int value) async {
    await _prefs.setInt('inCart', value);
  }

  static int? getInCart() {
    return _prefs.getInt('inCart');
  }
  static String? getUserToken() {
    return _prefs.getString('token');
  }

  static Future<void> saveUserData(Model model) async {
    await _prefs.setInt("id", model.id);
    await _prefs.setString("token", model.token);
    await _prefs.setString("fullname", model.fullname);
    await _prefs.setString("email", model.email);
    await _prefs.setString("phone", model.phone);
    await _prefs.setString("image", model.image);
    await _prefs.setString("userType", model.userType);
    await _prefs.setBool("isActive", model.isActive);
    await _prefs.setInt("isBan", model.isBan);
    await _prefs.setString("userType", model.userType);
    await _prefs.setInt("userCartCount", model.userCartCount);
  }

  static bool isAuth() {
    String? token = _prefs.getString("token");
    return token != null || (token ?? "").isNotEmpty;
  }
}
