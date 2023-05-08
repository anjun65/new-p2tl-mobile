import 'dart:convert';

import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/sign_in_form_model.dart';
import 'package:p2tl/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://p2tl.bright.id/api';

  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/login',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = UserModel.fromJson(jsonDecode(res.body));

        user.password = data.password;

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['data']['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final token = await getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/logout',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        await clearLocalStorage();
        DatabaseInstance databaseInstance = DatabaseInstance();
        final res = await databaseInstance.deleteAll();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
      await storage.write(key: 'regus_id', value: user.regus_id);
      await storage.write(key: 'roles', value: user.roles);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = 'Bearer ' + value;
    }

    return token;
  }

  Future<String> getRegu() async {
    String regus_id = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'regus_id');

    if (value != null) {
      regus_id = value;
    }

    return regus_id;
  }

  Future<String> getRoles() async {
    String roles = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'roles');

    if (value != null) {
      roles = value;
    }

    return roles;
  }

  Future<SignInFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['token'] != null) {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      } else {
        throw 'unauthenticated';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearLocalStorage() async {
    try {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();

      // DatabaseInstance databaseInstance = DatabaseInstance();
      // databaseInstance.database();
      // await databaseInstance.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}
