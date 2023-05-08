import 'dart:convert';

import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/models/work_online_model.dart';
import 'package:p2tl/services/auth_service.dart';
import 'package:http/http.dart' as http;

class WorkService {
  final String baseUrl = 'https://p2tl.bright.id/api';

  Future<List<WorkOnlineModel>> getWork() async {
    try {
      final token = await AuthService().getToken();
      final regus_id = await AuthService().getRegu();

      final res = await http.post(
        Uri.parse('$baseUrl/work-order/history/regu'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'regus_id': regus_id,
        },
      );

      print(res.body);

      if (res.statusCode == 200) {
        List<WorkOnlineModel> works = List<WorkOnlineModel>.from(
          jsonDecode(res.body)['data']['data'].map(
            (work) => WorkOnlineModel.fromJson(work),
          ),
        ).toList();

        return works;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Future<int> getWork() async {
  //   DatabaseInstance databaseInstance = DatabaseInstance();
  //   try {
  //     final token = await AuthService().getToken();
  //     final regus_id = await AuthService().getRegu();

  //     final res = await http.post(
  //       Uri.parse('$baseUrl/work-order/regu'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: {
  //         'regus_id': regus_id,
  //       },
  //     );

  //     if (res.statusCode == 200) {
  //       // print('TTTTTTTTTTTTTTTTTTTTTTTTTTTT')
  //       // List<WorkModel> works = List<WorkModel>.from(
  //       //   jsonDecode(res.body)['data'].map(
  //       //     (work) => databaseInstance.insert(work),
  //       //   ),
  //       // ).toList();
  //       // var item = (res.body as List).map((employee) {
  //       //   print('Inserting $employee');
  //       //   DBProvider.db.createEmployee(Employee.fromJson(employee));
  //       // }).toList();

  //       // json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  //       // print('BBBB');
  //       // print(row);
  //       // Map<String, dynamic> map = {};
  //       // for (int i = 0; i < list.length; i++) {
  //       //   map[list[i].id.toString()] = list[i];
  //       // }

  //       // print('ASGDASDGASDG');
  //       // print(list.toString());
  //       // print('BASGDASDGASDG');
  //       // print(map.toString());
  //       // print('CASGDASDGASDG');

  //       // int works = await databaseInstance.insert(row);

  //       // List<WorkModel> works = List<WorkModel>.from(
  //       //   jsonDecode(res.body)['data'].map(
  //       //     (work) => WorkModel.fromJson(work),
  //       //   ),
  //       // ).toList();
  //       // int works = await databaseInstance.insert({
  //       //   'id': jsonDecode(res.body)['data']['id'],
  //       //   'idPelanggan': jsonDecode(res.body)['data']['id_pelanggan'],
  //       //   'namaPelanggan': jsonDecode(res.body)['data']['nama_pelanggan'],
  //       //   'latitude': jsonDecode(res.body)['data']['latitude'],
  //       //   'longitude': jsonDecode(res.body)['data']['longitude'],
  //       //   'alamat': jsonDecode(res.body)['data']['alamat'],
  //       //   'jenis_p2tl': jsonDecode(res.body)['data']['jenis_p2tl'],
  //       //   'tarif': jsonDecode(res.body)['data']['tarif'],
  //       //   'daya': jsonDecode(res.body)['data']['daya'],
  //       //   'rbm': jsonDecode(res.body)['data']['rbm'],
  //       //   'lgkh': jsonDecode(res.body)['data']['lgkh'],
  //       //   'fkm': jsonDecode(res.body)['data']['fkm'],
  //       //   'regus_id': jsonDecode(res.body)['data']['regus_id'],
  //       //   'keteranganP2tl': jsonDecode(res.body)['data']['keterangan_p2tl'],
  //       //   'status': jsonDecode(res.body)['data']['status'],
  //       //   'created_at': jsonDecode(res.body)['data']['created_at'],
  //       //   'updated_at': jsonDecode(res.body)['data']['updated_at'],
  //       //   'surat_tugas_p2tl': jsonDecode(res.body)['data']['surat_tugas_p2tl'],
  //       //   'tanggal_surat_tugas_p2tl': jsonDecode(res.body)['data']
  //       //       ['tanggal_surat_tugas_p2tl'],
  //       //   'surat_tugas_tni': jsonDecode(res.body)['data']['surat_tugas_tni'],
  //       //   'tanggal_surat_tugas_tni': jsonDecode(res.body)['data']
  //       //       ['tanggal_surat_tugas_tni'],
  //       //   'pendamping1_id': jsonDecode(res.body)['data']['pendamping1_id'],
  //       //   'pendamping2_id': jsonDecode(res.body)['data']['pendamping2_id'],
  //       //   'status_pelanggaran': jsonDecode(res.body)['data']
  //       //       ['status_pelanggaran'],
  //       //   'tanggal_inspeksi': jsonDecode(res.body)['data']['tanggal_inspeksi'],
  //       //   'jumlah_ts_rp': jsonDecode(res.body)['data']['jumlah_ts_rp'],
  //       //   'jumlah_ts_kwh': jsonDecode(res.body)['data']['jumlah_ts_kwh'],
  //       //   'komentar': jsonDecode(res.body)['data']['komentar'],
  //       //   'P1': jsonDecode(res.body)['data']['P1'],
  //       //   'P2': jsonDecode(res.body)['data']['P2'],
  //       //   'P3': jsonDecode(res.body)['data']['P3'],
  //       //   'P4': jsonDecode(res.body)['data']['P4'],
  //       //   'P5': jsonDecode(res.body)['data']['P5'],
  //       //   'P6': jsonDecode(res.body)['data']['P6'],
  //       //   'P7': jsonDecode(res.body)['data']['P7'],
  //       //   'P8': jsonDecode(res.body)['data']['P8'],
  //       //   'P9': jsonDecode(res.body)['data']['P9'],
  //       //   'P10': jsonDecode(res.body)['data']['P10'],
  //       //   'image': jsonDecode(res.body)['data']['image'],
  //       //   'video': jsonDecode(res.body)['data']['video'],
  //       //   'labor': jsonDecode(res.body)['data']['labor'],
  //       // });
  //     }

  //     return throw jsonDecode(res.body)['message'];
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<int> addWorkToLocal(WorkModel data) async {
    try {
      DatabaseInstance databaseInstance = DatabaseInstance();

      final res = await databaseInstance.insert(data.toJson());
      int works = res;
      return works;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<WorkModel>> getWorkLocal() async {
    try {
      DatabaseInstance databaseInstance = DatabaseInstance();

      final res = await databaseInstance.all();
      List<WorkModel> works = res;
      return works;
    } catch (e) {
      rethrow;
    }
  }
}
