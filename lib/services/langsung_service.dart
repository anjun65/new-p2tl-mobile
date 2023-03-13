import 'dart:convert';

import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/langsung_model.dart';
import 'package:p2tl/services/auth_service.dart';
import 'package:http/http.dart' as http;

class LangsungService {
  final String baseUrl = 'https://new.momen-kita.com/api';

  Future<LangsungModel> getLangsung(int id) async {
    try {
      final token = await AuthService().getToken();
      final regus_id = await AuthService().getRegu();

      final res = await http.post(
        Uri.parse('$baseUrl/form-langsung/spesifik'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'regus_id': regus_id,
        },
      );

      if (res.statusCode == 200) {
        // LangsungModel langsung = List<LangsungModel>.from(
        //   jsonDecode(res.body)['data']['data'].map(
        //     (work) => LangsungModel.fromJson(work),
        //   ),
        // ).toList();

        return LangsungModel();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
