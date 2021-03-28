import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {

  Future<SharedPreferences> prefs = Get.putAsync(() async {
    return SharedPreferences.getInstance();
  });

  Future<bool> register(String username, String email, String password) async {
    String dataUser = (await prefs).getString("users");
    List<dynamic> users = [];
    if (dataUser != null) {
      users = jsonDecode((await prefs).getString("users"));
    }

    users.add({
      "username": username,
      "email": email,
      "password": password,
    });

    await Future.delayed(Duration(seconds: 3), () {});

    return (await prefs).setString("users", jsonEncode(users));
  }

  Future<dynamic> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<dynamic> users = jsonDecode(prefs.getString("users"));

    dynamic user = users.firstWhere((element) {
      return element['email'] == email && element['password'] == password;
    }, orElse: () => null);

    await Future.delayed(Duration(seconds: 3), () {});

    return user;
  }
}
