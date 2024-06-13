import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetable_orders_project/views/auth/login/login_model.dart';

import '../../views/home/pages/my_account/bloc/profile_model.dart';

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

  ////////////////////////////////////////
  static Future<void> setLat(String value) async {
    await _prefs.setString('lat', value);
  }

  static Future<void> setLng(String value) async {
    await _prefs.setString('lng', value);
  }

  static Future<void> setCurrentLocation(String value) async {
    await _prefs.setString('currentLocation', value);
  }
  static Future<void> setLocation(String value) async {
    await _prefs.setString('location', value);
  }
  //////////////



  static String? getLat() {
    return _prefs.getString('lat');
  }

  static String? getLng() {
    return _prefs.getString('lng');
  }

  static String? getCurrentLocation() {
    return _prefs.getString('currentLocation');
  }
  static String? getLocation() {
    return _prefs.getString('location');
  }

  static Future<void> removeLocation() async {
    await _prefs.remove('lat');
    await _prefs.remove('lng');
    await _prefs.remove('location');
  }

///////////////////////////////////////////
  static int? getInCart() {
    return _prefs.getInt('inCart');
  }

  static String? getUserToken() {
    return _prefs.getString('token');
  }

  static String? getUserImage() {
    return _prefs.getString('image');
  }

  static String? getUserName() {
    return _prefs.getString('fullname');
  }

  static String? getUserPhone() {
    return _prefs.getString('phone');
  }
  static String? getUserCity() {
    return _prefs.getString('city');
  }
  static int? getUserIsVip() {
    return _prefs.getInt('isVip');
  }

  static String? getcityId() {
    return _prefs.getString('cityId');
  }


  static Future<void> saveUserData(Model model) async {
    await _prefs.setInt("id", model.id);
    await _prefs.setString("token", model.token);
    await _prefs.setString("fullname", model.fullname);
    await _prefs.setString("email", model.email);
    await _prefs.setString("phone", model.phone);
    await _prefs.setString("image", model.image);
    await _prefs.setString("city", model.city.name);
    await _prefs.setBool("isActive", model.isActive);
    await _prefs.setInt("isBan", model.isBan);
    await _prefs.setString("userType", model.userType);
    await _prefs.setInt("userCartCount", model.userCartCount);
    await _prefs.setString("cityId", model.city.id);
  }


  static Future<void> saveEditData(UserDataProfile model) async {
    await _prefs.setInt("id", model.id);
    await _prefs.setString("fullname", model.fullname);
    await _prefs.setString("phone", model.phone);
    await _prefs.setString("image", model.image);
    await _prefs.setInt("isVip", model.isVip);
    await _prefs.setString("city", model.city.name);
    await _prefs.setString("cityId", model.city.id.toString());
  }

  static bool isAuth() {
    String? token = _prefs.getString("token");
    return token != null || (token ?? "").isNotEmpty;
  }
}
