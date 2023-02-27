import 'dart:convert';
import 'dart:io';

import 'package:p2tl/models/kalibrasi_model.dart';
import 'package:p2tl/models/langsung_model.dart';
import 'package:p2tl/models/pengambilan_model.dart';
import 'package:p2tl/models/status_model.dart';
import 'package:p2tl/models/tidak_langsung_model.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/services/auth_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:http/http.dart' as http;

class DatabaseInstance {
  final String _databaseName = 'test12345.db';
  final int _databaseVersion = 1;

  final String table = 'works';
  final String id = 'id';
  final String works_id = 'works_id';
  final String idPelanggan = 'id_pelanggan';
  final String namaPelanggan = 'nama_pelanggan';
  final String latitude = 'latitude';
  final String longitude = 'longitude';
  final String alamat = 'alamat';
  final String jenis_p2tl = 'jenis_p2tl';
  final String tarif = 'tarif';
  final String daya = 'daya';
  final String rbm = 'rbm';
  final String lgkh = 'lgkh';
  final String fkm = 'fkm';
  final String regus_id = 'regus_id';
  final String keteranganP2tl = 'keterangan_p2tl';
  final String alasan = 'alasan';
  final String status = 'status';
  final String created_at = 'created_at';
  final String updated_at = 'updated_at';
  final String surat_tugas_p2tl = 'surat_tugas_p2tl';
  final String tanggal_surat_tugas_p2tl = 'tanggal_surat_tugas_p2tl';
  final String surat_tugas_tni = 'surat_tugas_tni';
  final String tanggal_surat_tugas_tni = 'tanggal_surat_tugas_tni';
  final String pendamping1_id = 'pendamping1_id';
  final String pendamping2_id = 'pendamping2_id';
  final String status_pelanggaran = 'status_pelanggaran';
  final String tanggal_inspeksi = 'tanggal_inspeksi';
  final String jumlah_ts_rp = 'jumlah_ts_rp';
  final String jumlah_ts_kwh = 'jumlah_ts_kwh';
  final String komentar = 'komentar';
  final String P1 = 'P1';
  final String P2 = 'P2';
  final String P3 = 'P3';
  final String P4 = 'P4';
  final String P5 = 'P5';
  final String P6 = 'P6';
  final String P7 = 'P7';
  final String P8 = 'P8';
  final String P9 = 'P9';
  final String P10 = 'P10';
  final String image = 'image';
  final String video = 'video';
  final String labor = 'labor';
  final String createdAt = 'createdAt';

  final String table_form_langsungs = 'form_langsungs';
  final String table_form_tidak_langsungs = 'form_tidak_langsungs';
  final String table_kalibrasis = 'table_kalibrasis';
  final String table_pengambilan = 'table_pengambilan';

  Database? _database;

  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();

    return _database!;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: await _onCreate);
  }

  Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $table ($id INTEGER PRIMARY KEY,
        $works_id INTEGER NULL,
        $idPelanggan STRING NULL,
        $namaPelanggan STRING NULL,
        $latitude STRING NULL,
        $longitude STRING NULL,
        $alamat STRING NULL,
        $jenis_p2tl STRING NULL,
        $tarif STRING NULL,
        $daya STRING NULL,
        $rbm STRING NULL,
        $lgkh STRING NULL,
        $fkm STRING NULL,
        $regus_id STRING NULL,
        $keteranganP2tl STRING NULL,
        $alasan STRING NULL,
        $status STRING NULL,
        $surat_tugas_p2tl STRING NULL,
        $tanggal_surat_tugas_p2tl STRING NULL,
        $surat_tugas_tni STRING NULL,
        $tanggal_surat_tugas_tni STRING NULL,
        $pendamping1_id STRING NULL,
        $pendamping2_id STRING NULL,
        $status_pelanggaran STRING NULL,
        $tanggal_inspeksi STRING NULL,
        $jumlah_ts_rp STRING NULL,
        $jumlah_ts_kwh STRING NULL,
        $komentar STRING NULL,
        $P1 STRING NULL,
        $P2 STRING NULL,
        $P3 STRING NULL,
        $P4 STRING NULL,
        $P5 STRING NULL,
        $P6 STRING NULL,
        $P7 STRING NULL,
        $P8 STRING NULL,
        $P9 STRING NULL,
        $P10 STRING NULL,
        $image TEXT NULL,
        $video TEXT NULL,
        $labor STRING NULL,
        $createdAt STRING NULL)

        ''');

    await db.execute('''
        CREATE TABLE $table_form_langsungs (id INTEGER PRIMARY KEY,
        works_id INTEGER NULL,
        nama_saksi STRING NULL,
        alamat_saksi STRING NULL,
        nomor_identitas STRING NULL,
        pekerjaan STRING NULL,        
        no_telpon_saksi STRING NULL,
        file_nomor_identitas TEXT NULL,
        data_lama_merk STRING NULL,
        data_lama_no_reg STRING NULL,
        data_lama_no_seri STRING NULL,
        data_lama_tahun_pembuatan STRING NULL,
        data_lama_class STRING NULL,
        data_lama_konstanta STRING NULL,
        data_lama_rating_arus STRING NULL,
        data_lama_tegangan_nominal STRING NULL,
        data_lama_stand_kwh_meter STRING NULL,
        data_lama_jenis_pembatas STRING NULL,
        data_lama_alat_pembatas_merk STRING NULL,
        data_lama_rating_arus_2 STRING NULL,	
        data_lama_foto_kwh_meter TEXT NULL,
        data_lama_foto_pembatas TEXT NULL,
        data_baru_merk STRING NULL,
        data_baru_no_reg STRING NULL,
        data_baru_no_seri STRING NULL,
        data_baru_tahun_pembuatan STRING NULL,
        data_baru_class STRING NULL,
        data_baru_konstanta STRING NULL,
        data_baru_rating_arus STRING NULL,
        data_baru_tegangan_nominal STRING NULL,
        data_baru_stand_kwh_meter STRING NULL,
        data_baru_jenis_pembatas STRING NULL,
        data_baru_alat_pembatas_merk STRING NULL,
        data_baru_rating_arus_2 STRING NULL,	
        data_baru_foto_kwh_meter TEXT NULL,
        data_baru_foto_pembatas TEXT NULL,
        kwh_peralatan	STRING NULL,
        kwh_segel	STRING NULL,	
        kwh_nomor_tahun_kode_segel	STRING NULL,
        kwh_keterangan	STRING NULL,
        kwh_foto_sebelum	TEXT NULL,
        kwh_post_peralatan	STRING NULL,	
        kwh_post_segel	STRING NULL,
        kwh_post_nomor_tahun_kode_segel	STRING NULL,
        kwh_foto_sesudah TEXT NULL,
        terminal_peralatan	STRING NULL,
        terminal_segel	STRING NULL,	
        terminal_nomor_tahun_kode_segel	STRING NULL,
        terminal_keterangan	STRING NULL,
        terminal_foto_sebelum	TEXT NULL,
        terminal_post_peralatan	STRING NULL,	
        terminal_post_segel	STRING NULL,
        terminal_post_nomor_tahun_kode_segel	STRING NULL,
        terminal_foto_sesudah TEXT NULL,
        pelindung_kwh_peralatan	STRING NULL,
        pelindung_kwh_segel	STRING NULL,	
        pelindung_kwh_nomor_tahun_kode_segel	STRING NULL,
        pelindung_kwh_keterangan	STRING NULL,
        pelindung_kwh_foto_sebelum	TEXT NULL,
        pelindung_kwh_post_peralatan	STRING NULL,	
        pelindung_kwh_post_segel	STRING NULL,
        pelindung_kwh_post_nomor_tahun_kode_segel	STRING NULL,
        pelindung_kwh_foto_sesudah TEXT NULL,
        busbar_peralatan	STRING NULL,
        busbar_segel	STRING NULL,	
        busbar_nomor_tahun_kode_segel	STRING NULL,
        busbar_keterangan	STRING NULL,
        busbar_foto_sebelum	TEXT NULL,
        busbar_post_peralatan	STRING NULL,	
        busbar_post_segel	STRING NULL,
        busbar_post_nomor_tahun_kode_segel	STRING NULL,
        busbar_foto_sesudah TEXT NULL,
        papan_ok_peralatan	STRING NULL,
        papan_ok_segel	STRING NULL,	
        papan_ok_nomor_tahun_kode_segel	STRING NULL,
        papan_ok_keterangan	STRING NULL,
        papan_ok_foto_sebelum	TEXT NULL,
        papan_ok_post_peralatan	STRING NULL,	
        papan_ok_post_segel	STRING NULL,
        papan_ok_post_nomor_tahun_kode_segel	STRING NULL,
        papan_ok_foto_sesudah TEXT NULL,
        mcb_peralatan	STRING NULL,
        mcb_segel	STRING NULL,	
        mcb_nomor_tahun_kode_segel	STRING NULL,
        mcb_keterangan	STRING NULL,
        mcb_foto_sebelum	TEXT NULL,
        mcb_post_peralatan	STRING NULL,	
        mcb_post_segel	STRING NULL,
        mcb_post_nomor_tahun_kode_segel	STRING NULL,
        mcb_foto_sesudah TEXT NULL,        
        pemeriksaan_keterangan TEXT NULL,
        pemeriksaan_arus_1	STRING NULL,	
        pemeriksaan_arus_2	STRING NULL,	
        pemeriksaan_arus_3	STRING NULL,	
        pemeriksaan_arus_netral STRING NULL,
        pemeriksaan_voltase_netral_1	STRING NULL,
        pemeriksaan_voltase_netral_2	STRING NULL,
        pemeriksaan_voltase_netral_3	STRING NULL,
        pemeriksaan_voltase_phase_1 STRING NULL,
        pemeriksaan_voltase_phase_2 STRING NULL,
        pemeriksaan_voltase_phase_3 STRING NULL,
        pemeriksaan_cos_1 STRING NULL,
        pemeriksaan_cos_2 STRING NULL,
        pemeriksaan_cos_3 STRING NULL,
        pemeriksaan_akurasi STRING NULL,
        pemeriksaan_foto_sebelum TEXT NULL,
        wiring_terminal1 STRING NULL,
        wiring_terminal2 STRING NULL,
        wiring_terminal3 STRING NULL,
        wiring_terminal4 STRING NULL,
        wiring_terminal5 STRING NULL,
        wiring_terminal6 STRING NULL,
        wiring_terminal7 STRING NULL,
        wiring_terminal8 STRING NULL,
        wiring_terminal9 STRING NULL,
        wiring_terminal11	STRING NULL,
        wiring_keterangan_wiring_app STRING NULL,
        wiring_foto TEXT NULL,
        akhir_hasil_pemeriksaan STRING NULL,	
        akhir_kesimpulan STRING NULL,	
        akhir_tindakan STRING NULL,	
        akhir_barang_bukti STRING NULL,	
        akhir_tanggal_penyelesaian STRING NULL,
        akhir_foto_barang_bukti TEXT NULL,
        akhir_labor INTEGER DEFAULT 0,
        $createdAt STRING NULL
        )
        ''');

    await db.execute('''
        CREATE TABLE $table_form_tidak_langsungs (id INTEGER PRIMARY KEY,
        works_id INTEGER NULL,
        nama_saksi STRING NULL,
        alamat_saksi STRING NULL,
        nomor_identitas STRING NULL,
        pekerjaan STRING NULL,        
        no_telpon_saksi STRING NULL,
        file_nomor_identitas TEXT NULL,
        data_tegangan_tersambung STRING NULL,
        data_jenis_pengukuran STRING NULL,
        data_tempat_kedudukan STRING NULL,
        pembatas_jenis STRING NULL,
        pembatas_merk STRING NULL,
        pembatas_rating_arus STRING NULL,
        pembatas_foto_pembatas STRING NULL,
        kwh_merk STRING NULL,
        kwh_no_reg STRING NULL,
        kwh_no_seri STRING NULL,
        kwh_tahun STRING NULL,
        kwh_konstanta STRING NULL,
        kwh_class STRING NULL,
        kwh_rating_arus STRING NULL,
        kwh_tegangan STRING NULL,
        kwh_lbp STRING NULL,
        kwh_bp STRING NULL,
        kwh_total STRING NULL,
        kwh_kvarh STRING NULL,
        kwh_foto STRING NULL,
        ct_merk STRING NULL,
        ct_cls STRING NULL,
        ct_rasio STRING NULL,
        ct_burden STRING NULL,
        ct_foto STRING NULL,
        pt_merk STRING NULL,
        pt_cls STRING NULL,
        pt_rasio STRING NULL,
        pt_burden STRING NULL,
        pt_foto STRING NULL,
        kubikel_merk STRING NULL,
        kubikel_type STRING NULL,
        kubikel_no_seri STRING NULL,
        kubikel_tahun STRING NULL,
        kubikel_foto STRING NULL,
        box_app_merk STRING NULL,
        box_app_type STRING NULL,
        box_app_no_seri STRING NULL,
        box_app_tahun STRING NULL,
        box_app_foto STRING NULL,
        pelindung_kwh_peralatan	STRING NULL,
        pelindung_kwh_segel	STRING NULL,	
        pelindung_kwh_nomor_tahun_kode_segel	STRING NULL,
        pelindung_kwh_keterangan	STRING NULL,
        pelindung_kwh_foto_sebelum	TEXT NULL,
        pelindung_kwh_post_peralatan	STRING NULL,	
        pelindung_kwh_post_segel	STRING NULL,
        pelindung_kwh_post_nomor_tahun_kode_segel	STRING NULL,
        pelindung_kwh_foto_sesudah TEXT NULL,
        pelindung_ct_peralatan	STRING NULL,
        pelindung_ct_segel	STRING NULL,	
        pelindung_ct_nomor_tahun_kode_segel	STRING NULL,
        pelindung_ct_keterangan	STRING NULL,
        pelindung_ct_foto_sebelum	TEXT NULL,
        pelindung_ct_post_peralatan	STRING NULL,	
        pelindung_ct_post_segel	STRING NULL,
        pelindung_ct_post_nomor_tahun_kode_segel STRING NULL,
        pelindung_ct_foto_sesudah TEXT NULL,
        segel_peralatan	STRING NULL,
        segel_segel	STRING NULL,	
        segel_nomor_tahun_kode_segel	STRING NULL,
        segel_keterangan	STRING NULL,
        segel_foto_sebelum	TEXT NULL,
        segel_post_peralatan	STRING NULL,	
        segel_post_segel	STRING NULL,
        segel_post_nomor_tahun_kode_segel	STRING NULL,
        segel_foto_sesudah TEXT NULL,
        tutup_terminal_peralatan	STRING NULL,
        tutup_terminal_segel	STRING NULL,	
        tutup_terminal_nomor_tahun_kode_segel	STRING NULL,
        tutup_terminal_keterangan	STRING NULL,
        tutup_terminal_foto_sebelum	TEXT NULL,
        tutup_terminal_post_peralatan	STRING NULL,	
        tutup_terminal_post_segel	STRING NULL,
        tutup_terminal_post_nomor_tahun_kode_segel	STRING NULL,
        tutup_terminal_foto_sesudah TEXT NULL,
        amr_peralatan	STRING NULL,
        amr_segel	STRING NULL,	
        amr_nomor_tahun_kode_segel	STRING NULL,
        amr_keterangan	STRING NULL,
        amr_foto_sebelum	TEXT NULL,
        amr_post_peralatan	STRING NULL,	
        amr_post_segel	STRING NULL,
        amr_post_nomor_tahun_kode_segel	STRING NULL,
        amr_foto_sesudah TEXT NULL,
        terminal_vt_peralatan	STRING NULL,
        terminal_vt_segel	STRING NULL,	
        terminal_vt_nomor_tahun_kode_segel	STRING NULL,
        terminal_vt_keterangan	STRING NULL,
        terminal_vt_foto_sebelum	TEXT NULL,
        terminal_vt_post_peralatan	STRING NULL,	
        terminal_vt_post_segel	STRING NULL,
        terminal_vt_post_nomor_tahun_kode_segel	STRING NULL,
        terminal_vt_foto_sesudah TEXT NULL,
        terminal_ct_peralatan	STRING NULL,
        terminal_ct_segel	STRING NULL,	
        terminal_ct_nomor_tahun_kode_segel	STRING NULL,
        terminal_ct_keterangan	STRING NULL,
        terminal_ct_foto_sebelum	TEXT NULL,
        terminal_ct_post_peralatan	STRING NULL,	
        terminal_ct_post_segel	STRING NULL,
        terminal_ct_post_nomor_tahun_kode_segel	STRING NULL,
        terminal_ct_foto_sesudah TEXT NULL,
        pintu_peralatan	STRING NULL,
        pintu_segel	STRING NULL,	
        pintu_nomor_tahun_kode_segel	STRING NULL,
        pintu_keterangan	STRING NULL,
        pintu_foto_sebelum	TEXT NULL,
        pintu_post_peralatan	STRING NULL,	
        pintu_post_segel	STRING NULL,
        pintu_post_nomor_tahun_kode_segel	STRING NULL,
        pintu_foto_sesudah TEXT NULL,
        pintu_keterangan_all TEXT NULL,
        wiring_terminal1 STRING NULL,
        wiring_terminal2 STRING NULL,
        wiring_terminal3 STRING NULL,
        wiring_terminal4 STRING NULL,
        wiring_terminal5 STRING NULL,
        wiring_terminal6 STRING NULL,
        wiring_terminal7 STRING NULL,
        wiring_terminal8 STRING NULL,
        wiring_terminal9 STRING NULL,
        wiring_terminal11 STRING NULL,
        wiring_grounding STRING NULL,
        wiring_keterangan STRING NULL,
        wiring_diagram STRING NULL,
        wiring_foto STRING NULL,
        pengukuran_arus_primer_r STRING NULL,
        pengukuran_arus_primer_s STRING NULL,
        pengukuran_arus_primer_t STRING NULL,
        pengukuran_arus_sekunder_r STRING NULL,
        pengukuran_arus_sekunder_s STRING NULL,
        pengukuran_arus_sekunder_t STRING NULL,
        pengukuran_ct_r STRING NULL,
        pengukuran_ct_s STRING NULL,
        pengukuran_ct_t STRING NULL,
        pengukuran_akurasi_r STRING NULL,
        pengukuran_akurasi_s STRING NULL,
        pengukuran_akurasi_t STRING NULL,
        pengukuran_voltase_primer_r STRING NULL,
        pengukuran_voltase_primer_s STRING NULL,
        pengukuran_voltase_primer_t STRING NULL,
        pengukuran_voltase_sekunder_r STRING NULL,
        pengukuran_voltase_sekunder_s STRING NULL,
        pengukuran_voltase_sekunder_t STRING NULL,
        pengukuran_cos_r STRING NULL,
        pengukuran_cos_s STRING NULL,
        pengukuran_cos_t STRING NULL,
        pengukuran_akurasi STRING NULL,
        pengukuran_keterangan STRING NULL,
        pengukuran_foto STRING NULL,
        akhir_hasil_pemeriksaan STRING NULL,	
        akhir_kesimpulan STRING NULL,	
        akhir_tindakan STRING NULL,	
        akhir_barang_bukti STRING NULL,	
        akhir_tanggal_penyelesaian STRING NULL,
        akhir_foto_barang_bukti TEXT NULL,
        akhir_labor INTEGER DEFAULT 0,
        $createdAt STRING NULL)
        ''');

    await db.execute('''
        CREATE TABLE $table_kalibrasis (id INTEGER PRIMARY KEY,
        works_id INTEGER NULL,
        nama_saksi STRING NULL,
        alamat_saksi STRING NULL,
        nomor_identitas STRING NULL,
        pekerjaan STRING NULL,        
        no_telpon_saksi STRING NULL, 
        foto_identitas STRING NULL,
        kwh_merk STRING NULL,
        kwh_no_reg STRING NULL,
        kwh_no_seri STRING NULL,
        kwh_tahun_pembuatan STRING NULL,
        kwh_konstanta STRING NULL,
        kwh_class STRING NULL,
        kwh_rating_arus STRING NULL,
        kwh_tegangan_nominal STRING NULL,
        kwh_stand_kwh STRING NULL,
        kwh_keterangan STRING NULL,
        kwh_video STRING NULL,
        posisi_atas_a STRING NULL,
        posisi_atas_b STRING NULL,
        posisi_atas_c STRING NULL,
        posisi_kanan_a STRING NULL,
        posisi_kanan_b STRING NULL,
        posisi_kanan_c STRING NULL,
        posisi_kiri_a STRING NULL,
        posisi_kiri_b STRING NULL,
        posisi_kiri_c STRING NULL,
        posisi_video STRING NULL,
        uji_tegangan_100 STRING NULL,
        uji_arus_100 STRING NULL,
        uji_nilai_akurasi_100 STRING NULL,
        uji_keterangan_100 STRING NULL,
        uji_tegangan_50 STRING NULL,
        uji_arus_50 STRING NULL,
        uji_nilai_akurasi_50 STRING NULL,
        uji_keterangan_50 STRING NULL,
        uji_tegangan_5 STRING NULL,
        uji_arus_5 STRING NULL,
        uji_nilai_akurasi_5 STRING NULL,
        uji_keterangan_5 STRING NULL,
        uji_merk STRING NULL,
        uji_type STRING NULL,
        uji_no_seri STRING NULL,
        uji_kesimpulan STRING NULL,
        uji_video STRING NULL,
        $createdAt STRING NULL)
        ''');

    await db.execute('''
        CREATE TABLE $table_pengambilan (id INTEGER PRIMARY KEY,
        works_id INTEGER NULL,
        kabel_jenis STRING NULL,
        kabel_panjang STRING NULL,
        segel_tera STRING NULL,
        segel_terminal STRING NULL,
        segel_box_ok STRING NULL,
        segel_box_app STRING NULL,
        segel_alat_pembatas STRING NULL,
        segel_alat_bantu_ukur STRING NULL,
        segel_foto STRING NULL,
        $createdAt STRING NULL)

        ''');
  }

  Future<List<WorkModel>> all() async {
    final data = await _database!.query(table);

    // data.map((e) => print(WorkModel.fromJson(e))).toList();

    List<WorkModel> result = data.map((e) => WorkModel.fromJson(e)).toList();
    print(result);
    return result;
  }

  Future<StatusModel> workStatus() async {
    var db = await _database!;

    var query_belum = await db.rawQuery(
        'SELECT COUNT (*) from $table where keterangan_p2tl == "Belum Dikerjakan" OR keterangan_p2tl IS NULL');

    var query_sudah = await db.rawQuery(
        'SELECT COUNT (*) from $table where keterangan_p2tl != "Belum Dikerjakan" AND keterangan_p2tl IS NOT NULL');

    var query_luar = await db
        .rawQuery('SELECT COUNT (*) from $table where works_id IS NULL');

    var query_dalam = await db
        .rawQuery('SELECT COUNT (*) from $table where works_id IS NOT NULL');

    int? sudah = Sqflite.firstIntValue(query_belum);
    int? belum = Sqflite.firstIntValue(query_sudah);

    int? luar = Sqflite.firstIntValue(query_luar);
    int? dalam = Sqflite.firstIntValue(query_dalam);

    var item = StatusModel.fromJson({
      'sudah': sudah,
      'belum': belum,
      'luar': luar,
      'dalam': dalam,
    });

    return item;
  }

  final String baseUrl = 'https://new.momen-kita.com/api';

  Future<int> getWork() async {
    final token = await AuthService().getToken();
    final regus_id = await AuthService().getRegu();
    final roles = await AuthService().getRoles();

    if (roles == 'PETUGAS LAPANGAN') {
      // var delete = await _database!.rawDelete("Delete from $table");
      // var delete_form_langsung =
      //     await _database!.rawDelete("Delete from $table_form_langsungs");
      // var delete_form_tidak_langsung =
      //     await _database!.rawDelete("Delete from $table_form_tidak_langsungs");

      final data = await _database!.query(table);
      print('TTTTTTTTTTTTTTTTTTTTTTTTTT');

      List<WorkModel> result = data.map((e) => WorkModel.fromJson(e)).toList();

      for (int index = 0; index < result.length; index++) {
        WorkModel listItem = result[index];

        int? work_id = 0;

        if (listItem.works_id == null || listItem.works_id == 'null') {
          final resWork = http.MultipartRequest(
              "POST", Uri.parse('$baseUrl/work-order/petugas'))
            ..headers["Content-Type"] = "application/json"
            ..headers["Authorization"] = "Bearer $token"
            ..fields['keterangan_p2tl'] = listItem.keteranganP2tl.toString()
            ..fields['id_pelanggan'] = listItem.idPelanggan.toString()
            ..fields['alamat'] = listItem.alamat.toString()
            ..fields['jenis_p2tl'] = listItem.jenis_p2tl.toString()
            ..fields['tarif'] = listItem.tarif.toString()
            ..fields['daya'] = listItem.daya.toString()
            ..fields['rbm'] = listItem.rbm.toString()
            ..fields['lgkh'] = listItem.lgkh.toString()
            ..fields['fkm'] = listItem.fkm.toString()
            ..fields['P1'] = listItem.P1.toString()
            ..fields['P2'] = listItem.P2.toString()
            ..fields['P3'] = listItem.P3.toString()
            ..fields['P4'] = listItem.P4.toString()
            ..fields['P5'] = listItem.P5.toString()
            ..fields['P6'] = listItem.P6.toString()
            ..fields['P7'] = listItem.P7.toString()
            ..fields['P8'] = listItem.P8.toString()
            ..fields['P9'] = listItem.P9.toString()
            ..fields['P10'] = listItem.P10.toString()
            ..fields['image'] = listItem.image.toString()
            ..fields['regus_id'] = listItem.regus_id.toString()
            ..fields['nama_pelanggan'] = listItem.namaPelanggan.toString()
            ..fields['latitude'] = listItem.latitude.toString()
            ..fields['longitude'] = listItem.longitude.toString();

          var multipartFile =
              await http.MultipartFile.fromPath(video, listItem.video!);

          resWork.files.add(multipartFile);

          var response = await resWork.send();

          String responseBody = await response.stream.bytesToString();

          var data = jsonDecode(responseBody);

          if (response.statusCode == 200) {
            String responseBody = await response.stream.bytesToString();
            var data = jsonDecode(responseBody);
            work_id = int.parse(jsonDecode(responseBody)['data']['id']);
          }
        } else {
          work_id = listItem.works_id;

          final resWork =
              http.MultipartRequest("POST", Uri.parse('$baseUrl/work-order'))
                ..headers["Content-Type"] = "application/json"
                ..headers["Authorization"] = "Bearer $token"
                ..fields['id'] = work_id.toString()
                ..fields['keterangan_p2tl'] = listItem.keteranganP2tl.toString()
                ..fields['image'] = listItem.image.toString();

          var multipartFile =
              await http.MultipartFile.fromPath(video, listItem.video!);

          resWork.files.add(multipartFile);

          var response = await resWork.send();

          String responseBody = await response.stream.bytesToString();

          var data = jsonDecode(responseBody);

          if (response.statusCode == 200) {
            String responseBody = await response.stream.bytesToString();

            var data = jsonDecode(responseBody);
          }
        }

        if (listItem.jenis_p2tl == '3TL') {
          TidakLangsungModel ba = await searchFormTidakLangsung(work_id!);

          final res = await http.post(
            Uri.parse('$baseUrl/new-form-tidak-langsung'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'works_id': listItem.works_id.toString(),
              'regus_id': regus_id.toString(),
              'nama_saksi': ba.nama_saksi.toString(),
              'alamat_saksi': ba.alamat_saksi.toString(),
              'nomor_identitas': ba.nomor_identitas.toString(),
              'pekerjaan': ba.pekerjaan.toString(),
              'no_telpon_saksi': ba.no_telpon_saksi.toString(),
              'file_nomor_identitas': ba.file_nomor_identitas.toString(),
              'data_tegangan_tersambung':
                  ba.data_tegangan_tersambung.toString(),
              'data_jenis_pengukuran': ba.data_jenis_pengukuran.toString(),
              'data_tempat_kedudukan': ba.data_tempat_kedudukan.toString(),
              'pembatas_jenis': ba.pembatas_jenis.toString(),
              'pembatas_merk': ba.pembatas_merk.toString(),
              'pembatas_rating_arus': ba.pembatas_rating_arus.toString(),
              'pembatas_foto_pembatas': ba.pembatas_foto_pembatas.toString(),
              'kwh_merk': ba.kwh_merk.toString(),
              'kwh_no_reg': ba.kwh_no_reg.toString(),
              'kwh_no_seri': ba.kwh_no_seri.toString(),
              'kwh_tahun': ba.kwh_tahun.toString(),
              'kwh_konstanta': ba.kwh_konstanta.toString(),
              'kwh_class': ba.kwh_class.toString(),
              'kwh_rating_arus': ba.kwh_rating_arus.toString(),
              'kwh_tegangan': ba.kwh_tegangan.toString(),
              'kwh_lbp': ba.kwh_lbp.toString(),
              'kwh_bp': ba.kwh_bp.toString(),
              'kwh_total': ba.kwh_total.toString(),
              'kwh_kvarh': ba.kwh_kvarh.toString(),
              'kwh_foto': ba.kwh_foto.toString(),
              'ct_merk': ba.ct_merk.toString(),
              'ct_cls': ba.ct_cls.toString(),
              'ct_rasio': ba.ct_rasio.toString(),
              'ct_burden': ba.ct_burden.toString(),
              'ct_foto': ba.ct_foto.toString(),
              'pt_merk': ba.pt_merk.toString(),
              'pt_cls': ba.pt_cls.toString(),
              'pt_rasio': ba.pt_rasio.toString(),
              'pt_burden': ba.pt_burden.toString(),
              'pt_foto': ba.pt_foto.toString(),
              'kubikel_merk': ba.kubikel_merk.toString(),
              'kubikel_type': ba.kubikel_type.toString(),
              'kubikel_no_seri': ba.kubikel_no_seri.toString(),
              'kubikel_tahun': ba.kubikel_tahun.toString(),
              'kubikel_foto': ba.kubikel_foto.toString(),
              'box_app_merk': ba.box_app_merk.toString(),
              'box_app_type': ba.box_app_type.toString(),
              'box_app_no_seri': ba.box_app_no_seri.toString(),
              'box_app_tahun': ba.box_app_tahun.toString(),
              'box_app_foto': ba.box_app_foto.toString(),
              'pelindung_kwh_peralatan': ba.pelindung_kwh_peralatan.toString(),
              'pelindung_kwh_segel': ba.pelindung_kwh_segel.toString(),
              'pelindung_kwh_nomor_tahun_kode_segel':
                  ba.pelindung_kwh_nomor_tahun_kode_segel.toString(),
              'pelindung_kwh_keterangan':
                  ba.pelindung_kwh_keterangan.toString(),
              'pelindung_kwh_foto_sebelum':
                  ba.pelindung_kwh_foto_sebelum.toString(),
              'pelindung_kwh_post_peralatan':
                  ba.pelindung_kwh_post_peralatan.toString(),
              'pelindung_kwh_post_segel':
                  ba.pelindung_kwh_post_segel.toString(),
              'pelindung_kwh_post_nomor_tahun_kode_segel':
                  ba.pelindung_kwh_post_nomor_tahun_kode_segel.toString(),
              'pelindung_kwh_foto_sesudah':
                  ba.pelindung_kwh_foto_sesudah.toString(),
              'pelindung_ct_peralatan': ba.pelindung_ct_peralatan.toString(),
              'pelindung_ct_segel': ba.pelindung_ct_segel.toString(),
              'pelindung_ct_nomor_tahun_kode_segel':
                  ba.pelindung_ct_nomor_tahun_kode_segel.toString(),
              'pelindung_ct_keterangan': ba.pelindung_ct_keterangan.toString(),
              'pelindung_ct_foto_sebelum':
                  ba.pelindung_ct_foto_sebelum.toString(),
              'pelindung_ct_post_peralatan':
                  ba.pelindung_ct_post_peralatan.toString(),
              'pelindung_ct_post_segel': ba.pelindung_ct_post_segel.toString(),
              'pelindung_ct_post_nomor_tahun_kode_segel':
                  ba.pelindung_ct_post_nomor_tahun_kode_segel.toString(),
              'pelindung_ct_foto_sesudah':
                  ba.pelindung_ct_foto_sesudah.toString(),
              'segel_peralatan': ba.segel_peralatan.toString(),
              'segel_segel': ba.segel_segel.toString(),
              'segel_nomor_tahun_kode_segel':
                  ba.segel_nomor_tahun_kode_segel.toString(),
              'segel_keterangan': ba.segel_keterangan.toString(),
              'segel_foto_sebelum': ba.segel_foto_sebelum.toString(),
              'segel_post_peralatan': ba.segel_post_peralatan.toString(),
              'segel_post_segel': ba.segel_post_segel.toString(),
              'segel_post_nomor_tahun_kode_segel':
                  ba.segel_post_nomor_tahun_kode_segel.toString(),
              'segel_foto_sesudah': ba.segel_foto_sesudah.toString(),
              'tutup_terminal_peralatan':
                  ba.tutup_terminal_peralatan.toString(),
              'tutup_terminal_segel': ba.tutup_terminal_segel.toString(),
              'tutup_terminal_nomor_tahun_kode_segel':
                  ba.tutup_terminal_nomor_tahun_kode_segel.toString(),
              'tutup_terminal_keterangan':
                  ba.tutup_terminal_keterangan.toString(),
              'tutup_terminal_foto_sebelum':
                  ba.tutup_terminal_foto_sebelum.toString(),
              'tutup_terminal_post_peralatan':
                  ba.tutup_terminal_post_peralatan.toString(),
              'tutup_terminal_post_segel':
                  ba.tutup_terminal_post_segel.toString(),
              'tutup_terminal_post_nomor_tahun_kode_segel':
                  ba.tutup_terminal_post_nomor_tahun_kode_segel.toString(),
              'tutup_terminal_foto_sesudah':
                  ba.tutup_terminal_foto_sesudah.toString(),
              'amr_peralatan': ba.amr_peralatan.toString(),
              'amr_segel': ba.amr_segel.toString(),
              'amr_nomor_tahun_kode_segel':
                  ba.amr_nomor_tahun_kode_segel.toString(),
              'amr_keterangan': ba.amr_keterangan.toString(),
              'amr_foto_sebelum': ba.amr_foto_sebelum.toString(),
              'amr_post_peralatan': ba.amr_post_peralatan.toString(),
              'amr_post_segel': ba.amr_post_segel.toString(),
              'amr_post_nomor_tahun_kode_segel':
                  ba.amr_post_nomor_tahun_kode_segel.toString(),
              'amr_foto_sesudah': ba.amr_foto_sesudah.toString(),
              'terminal_vt_peralatan': ba.terminal_vt_peralatan.toString(),
              'terminal_vt_segel': ba.terminal_vt_segel.toString(),
              'terminal_vt_nomor_tahun_kode_segel':
                  ba.terminal_vt_nomor_tahun_kode_segel.toString(),
              'terminal_vt_keterangan': ba.terminal_vt_keterangan.toString(),
              'terminal_vt_foto_sebelum':
                  ba.terminal_vt_foto_sebelum.toString(),
              'terminal_vt_post_peralatan':
                  ba.terminal_vt_post_peralatan.toString(),
              'terminal_vt_post_segel': ba.terminal_vt_post_segel.toString(),
              'terminal_vt_post_nomor_tahun_kode_segel':
                  ba.terminal_vt_post_nomor_tahun_kode_segel.toString(),
              'terminal_vt_foto_sesudah':
                  ba.terminal_vt_foto_sesudah.toString(),
              'terminal_ct_peralatan': ba.terminal_ct_peralatan.toString(),
              'terminal_ct_segel': ba.terminal_ct_segel.toString(),
              'terminal_ct_nomor_tahun_kode_segel':
                  ba.terminal_ct_nomor_tahun_kode_segel.toString(),
              'terminal_ct_keterangan': ba.terminal_ct_keterangan.toString(),
              'terminal_ct_foto_sebelum':
                  ba.terminal_ct_foto_sebelum.toString(),
              'terminal_ct_post_peralatan':
                  ba.terminal_ct_post_peralatan.toString(),
              'terminal_ct_post_segel': ba.terminal_ct_post_segel.toString(),
              'terminal_ct_post_nomor_tahun_kode_segel':
                  ba.terminal_ct_post_nomor_tahun_kode_segel.toString(),
              'terminal_ct_foto_sesudah':
                  ba.terminal_ct_foto_sesudah.toString(),
              'pintu_peralatan': ba.pintu_peralatan.toString(),
              'pintu_segel': ba.pintu_segel.toString(),
              'pintu_nomor_tahun_kode_segel':
                  ba.pintu_nomor_tahun_kode_segel.toString(),
              'pintu_keterangan': ba.pintu_keterangan.toString(),
              'pintu_foto_sebelum': ba.pintu_foto_sebelum.toString(),
              'pintu_post_peralatan': ba.pintu_post_peralatan.toString(),
              'pintu_post_segel': ba.pintu_post_segel.toString(),
              'pintu_post_nomor_tahun_kode_segel':
                  ba.pintu_post_nomor_tahun_kode_segel.toString(),
              'pintu_foto_sesudah': ba.pintu_foto_sesudah.toString(),
              'pintu_keterangan_all': ba.pintu_keterangan_all.toString(),
              'wiring_terminal1': ba.wiring_terminal1.toString(),
              'wiring_terminal2': ba.wiring_terminal2.toString(),
              'wiring_terminal3': ba.wiring_terminal3.toString(),
              'wiring_terminal4': ba.wiring_terminal4.toString(),
              'wiring_terminal5': ba.wiring_terminal5.toString(),
              'wiring_terminal6': ba.wiring_terminal6.toString(),
              'wiring_terminal7': ba.wiring_terminal7.toString(),
              'wiring_terminal8': ba.wiring_terminal8.toString(),
              'wiring_terminal9': ba.wiring_terminal9.toString(),
              'wiring_terminal11': ba.wiring_terminal11.toString(),
              'wiring_grounding': ba.wiring_grounding.toString(),
              'wiring_keterangan': ba.wiring_keterangan.toString(),
              'wiring_diagram': ba.wiring_diagram.toString(),
              'wiring_foto': ba.wiring_foto.toString(),
              'pengukuran_arus_primer_r':
                  ba.pengukuran_arus_primer_r.toString(),
              'pengukuran_arus_primer_s':
                  ba.pengukuran_arus_primer_s.toString(),
              'pengukuran_arus_primer_t':
                  ba.pengukuran_arus_primer_t.toString(),
              'pengukuran_arus_sekunder_r':
                  ba.pengukuran_arus_sekunder_r.toString(),
              'pengukuran_arus_sekunder_s':
                  ba.pengukuran_arus_sekunder_s.toString(),
              'pengukuran_arus_sekunder_t':
                  ba.pengukuran_arus_sekunder_t.toString(),
              'pengukuran_ct_r': ba.pengukuran_ct_r.toString(),
              'pengukuran_ct_s': ba.pengukuran_ct_s.toString(),
              'pengukuran_ct_t': ba.pengukuran_ct_t.toString(),
              'pengukuran_akurasi_r': ba.pengukuran_akurasi_r.toString(),
              'pengukuran_akurasi_s': ba.pengukuran_akurasi_s.toString(),
              'pengukuran_akurasi_t': ba.pengukuran_akurasi_t.toString(),
              'pengukuran_voltase_primer_r':
                  ba.pengukuran_voltase_primer_r.toString(),
              'pengukuran_voltase_primer_s':
                  ba.pengukuran_voltase_primer_s.toString(),
              'pengukuran_voltase_primer_t':
                  ba.pengukuran_voltase_primer_t.toString(),
              'pengukuran_voltase_sekunder_r':
                  ba.pengukuran_voltase_sekunder_r.toString(),
              'pengukuran_voltase_sekunder_s':
                  ba.pengukuran_voltase_sekunder_s.toString(),
              'pengukuran_voltase_sekunder_t':
                  ba.pengukuran_voltase_sekunder_t.toString(),
              'pengukuran_cos_r': ba.pengukuran_cos_r.toString(),
              'pengukuran_cos_s': ba.pengukuran_cos_s.toString(),
              'pengukuran_cos_t': ba.pengukuran_cos_t.toString(),
              'pengukuran_akurasi': ba.pengukuran_akurasi.toString(),
              'pengukuran_keterangan': ba.pengukuran_keterangan.toString(),
              'pengukuran_foto': ba.pengukuran_foto.toString(),
              'akhir_hasil_pemeriksaan': ba.akhir_hasil_pemeriksaan.toString(),
              'akhir_kesimpulan': ba.akhir_kesimpulan.toString(),
              'akhir_tindakan': ba.akhir_tindakan.toString(),
              'akhir_barang_bukti': ba.akhir_barang_bukti.toString(),
              'akhir_tanggal_penyelesaian':
                  ba.akhir_tanggal_penyelesaian.toString(),
              'akhir_foto_barang_bukti': ba.akhir_foto_barang_bukti.toString(),
              'akhir_labor': ba.akhir_labor.toString(),
            },
          );
        } else if ((listItem.jenis_p2tl == '3L' ||
            listItem.jenis_p2tl == '1L' &&
                listItem.keteranganP2tl != "Belum Dikerjakan")) {
          LangsungModel ba = await searchFormLangsung(work_id!);
          final res = await http.post(
            Uri.parse('$baseUrl/new-form-langsung'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'works_id': listItem.works_id.toString(),
              'regus_id': regus_id.toString() ?? null,
              'nama_saksi': ba.nama_saksi.toString() ?? null,
              'alamat_saksi': ba.alamat_saksi.toString() ?? null,
              'nomor_identitas': ba.nomor_identitas.toString() ?? null,
              'no_telpon_saksi': ba.no_telpon_saksi.toString() ?? null,
              'file_nomor_identitas':
                  ba.file_nomor_identitas.toString() ?? null,
              'data_lama_merk': ba.data_lama_merk.toString(),
              'data_lama_no_reg': ba.data_lama_no_reg.toString(),
              'data_lama_no_seri': ba.data_lama_no_seri.toString(),
              'data_lama_tahun_pembuatan':
                  ba.data_lama_tahun_pembuatan.toString(),
              'data_lama_class': ba.data_lama_class.toString(),
              'data_lama_konstanta': ba.data_lama_konstanta.toString(),
              'data_lama_rating_arus': ba.data_lama_rating_arus.toString(),
              'data_lama_tegangan_nominal':
                  ba.data_lama_tegangan_nominal.toString(),
              'data_lama_stand_kwh_meter':
                  ba.data_lama_stand_kwh_meter.toString(),
              'data_lama_jenis_pembatas':
                  ba.data_lama_jenis_pembatas.toString(),
              'data_lama_alat_pembatas_merk':
                  ba.data_lama_alat_pembatas_merk.toString(),
              'data_lama_rating_arus_2': ba.data_lama_rating_arus_2.toString(),
              'data_lama_foto_kwh_meter':
                  ba.data_lama_foto_kwh_meter.toString(),
              'data_lama_foto_pembatas': ba.data_lama_foto_pembatas.toString(),
              'data_baru_merk': ba.data_baru_merk.toString(),
              'data_baru_no_reg': ba.data_baru_no_reg.toString(),
              'data_baru_no_seri': ba.data_baru_no_seri.toString(),
              'data_baru_tahun_pembuatan':
                  ba.data_baru_tahun_pembuatan.toString(),
              'data_baru_class': ba.data_baru_class.toString(),
              'data_baru_konstanta': ba.data_baru_konstanta.toString(),
              'data_baru_rating_arus': ba.data_baru_rating_arus.toString(),
              'data_baru_tegangan_nominal':
                  ba.data_baru_tegangan_nominal.toString(),
              'data_baru_stand_kwh_meter':
                  ba.data_baru_stand_kwh_meter.toString(),
              'data_baru_jenis_pembatas':
                  ba.data_baru_jenis_pembatas.toString(),
              'data_baru_alat_pembatas_merk':
                  ba.data_baru_alat_pembatas_merk.toString(),
              'data_baru_rating_arus_2': ba.data_baru_rating_arus_2.toString(),
              'data_baru_foto_kwh_meter':
                  ba.data_baru_foto_kwh_meter.toString(),
              'data_baru_foto_pembatas': ba.data_baru_foto_pembatas.toString(),
              'kwh_peralatan': ba.kwh_peralatan.toString(),
              'kwh_segel': ba.kwh_segel.toString(),
              'kwh_nomor_tahun_kode_segel':
                  ba.kwh_nomor_tahun_kode_segel.toString(),
              'kwh_keterangan': ba.kwh_keterangan.toString(),
              'kwh_foto_sebelum': ba.kwh_foto_sebelum.toString(),
              'kwh_post_peralatan': ba.kwh_post_peralatan.toString(),
              'kwh_post_segel': ba.kwh_post_segel.toString(),
              'kwh_post_nomor_tahun_kode_segel':
                  ba.kwh_post_nomor_tahun_kode_segel.toString(),
              'kwh_foto_sesudah': ba.kwh_foto_sesudah.toString(),
              'terminal_peralatan': ba.terminal_peralatan.toString(),
              'terminal_segel': ba.terminal_segel.toString(),
              'terminal_nomor_tahun_kode_segel':
                  ba.terminal_nomor_tahun_kode_segel.toString(),
              'terminal_keterangan': ba.terminal_keterangan.toString(),
              'terminal_foto_sebelum': ba.terminal_foto_sebelum.toString(),
              'terminal_post_peralatan': ba.terminal_post_peralatan.toString(),
              'terminal_post_segel': ba.terminal_post_segel.toString(),
              'terminal_post_nomor_tahun_kode_segel':
                  ba.terminal_post_nomor_tahun_kode_segel.toString(),
              'terminal_foto_sesudah': ba.terminal_foto_sesudah.toString(),
              'pelindung_kwh_peralatan': ba.pelindung_kwh_peralatan.toString(),
              'pelindung_kwh_segel': ba.pelindung_kwh_segel.toString(),
              'pelindung_kwh_nomor_tahun_kode_segel':
                  ba.pelindung_kwh_nomor_tahun_kode_segel.toString(),
              'pelindung_kwh_keterangan':
                  ba.pelindung_kwh_keterangan.toString(),
              'pelindung_kwh_foto_sebelum':
                  ba.pelindung_kwh_foto_sebelum.toString(),
              'pelindung_kwh_post_peralatan':
                  ba.pelindung_kwh_post_peralatan.toString(),
              'pelindung_kwh_post_segel':
                  ba.pelindung_kwh_post_segel.toString(),
              'pelindung_kwh_post_nomor_tahun_kode_segel':
                  ba.pelindung_kwh_post_nomor_tahun_kode_segel.toString(),
              'pelindung_kwh_foto_sesudah':
                  ba.pelindung_kwh_foto_sesudah.toString(),
              'busbar_peralatan': ba.busbar_peralatan.toString(),
              'busbar_segel': ba.busbar_segel.toString(),
              'busbar_nomor_tahun_kode_segel':
                  ba.busbar_nomor_tahun_kode_segel.toString(),
              'busbar_keterangan': ba.busbar_keterangan.toString(),
              'busbar_foto_sebelum': ba.busbar_foto_sebelum.toString(),
              'busbar_post_peralatan': ba.busbar_post_peralatan.toString(),
              'busbar_post_segel': ba.busbar_post_segel.toString(),
              'busbar_post_nomor_tahun_kode_segel':
                  ba.busbar_post_nomor_tahun_kode_segel.toString(),
              'busbar_foto_sesudah': ba.busbar_foto_sesudah.toString(),
              'papan_ok_peralatan': ba.papan_ok_peralatan.toString(),
              'papan_ok_segel': ba.papan_ok_segel.toString(),
              'papan_ok_nomor_tahun_kode_segel':
                  ba.papan_ok_nomor_tahun_kode_segel.toString(),
              'papan_ok_keterangan': ba.papan_ok_keterangan.toString(),
              'papan_ok_foto_sebelum': ba.papan_ok_foto_sebelum.toString(),
              'papan_ok_post_peralatan': ba.papan_ok_post_peralatan.toString(),
              'papan_ok_post_segel': ba.papan_ok_post_segel.toString(),
              'papan_ok_post_nomor_tahun_kode_segel':
                  ba.papan_ok_post_nomor_tahun_kode_segel.toString(),
              'papan_ok_foto_sesudah': ba.papan_ok_foto_sesudah.toString(),
              'mcb_peralatan': ba.mcb_peralatan.toString(),
              'mcb_segel': ba.mcb_segel.toString(),
              'mcb_nomor_tahun_kode_segel':
                  ba.mcb_nomor_tahun_kode_segel.toString(),
              'mcb_keterangan': ba.mcb_keterangan.toString(),
              'mcb_foto_sebelum': ba.mcb_foto_sebelum.toString(),
              'mcb_post_peralatan': ba.mcb_post_peralatan.toString(),
              'mcb_post_segel': ba.mcb_post_segel.toString(),
              'mcb_post_nomor_tahun_kode_segel':
                  ba.mcb_post_nomor_tahun_kode_segel.toString(),
              'mcb_foto_sesudah': ba.mcb_foto_sesudah.toString(),
              'pemeriksaan_keterangan': ba.pemeriksaan_keterangan.toString(),
              'pemeriksaan_arus_1': ba.pemeriksaan_arus_1.toString(),
              'pemeriksaan_arus_2': ba.pemeriksaan_arus_2.toString(),
              'pemeriksaan_arus_3': ba.pemeriksaan_arus_3.toString(),
              'pemeriksaan_arus_netral': ba.pemeriksaan_arus_netral.toString(),
              'pemeriksaan_voltase_netral_1':
                  ba.pemeriksaan_voltase_netral_1.toString(),
              'pemeriksaan_voltase_netral_2':
                  ba.pemeriksaan_voltase_netral_2.toString(),
              'pemeriksaan_voltase_netral_3':
                  ba.pemeriksaan_voltase_netral_3.toString(),
              'pemeriksaan_voltase_phase_1':
                  ba.pemeriksaan_voltase_phase_1.toString(),
              'pemeriksaan_voltase_phase_2':
                  ba.pemeriksaan_voltase_phase_2.toString(),
              'pemeriksaan_voltase_phase_3':
                  ba.pemeriksaan_voltase_phase_3.toString(),
              'pemeriksaan_cos_1': ba.pemeriksaan_cos_1.toString(),
              'pemeriksaan_cos_2': ba.pemeriksaan_cos_2.toString(),
              'pemeriksaan_cos_3': ba.pemeriksaan_cos_3.toString(),
              'pemeriksaan_akurasi': ba.pemeriksaan_akurasi.toString(),
              'pemeriksaan_foto_sebelum':
                  ba.pemeriksaan_foto_sebelum.toString(),
              'wiring_terminal1': ba.wiring_terminal1.toString(),
              'wiring_terminal2': ba.wiring_terminal2.toString(),
              'wiring_terminal3': ba.wiring_terminal3.toString(),
              'wiring_terminal4': ba.wiring_terminal4.toString(),
              'wiring_terminal5': ba.wiring_terminal5.toString(),
              'wiring_terminal6': ba.wiring_terminal6.toString(),
              'wiring_terminal7': ba.wiring_terminal7.toString(),
              'wiring_terminal8': ba.wiring_terminal8.toString(),
              'wiring_terminal9': ba.wiring_terminal9.toString(),
              'wiring_terminal11': ba.wiring_terminal11.toString(),
              'wiring_keterangan_wiring_app':
                  ba.wiring_keterangan_wiring_app.toString(),
              'wiring_foto': ba.wiring_foto.toString(),
              'akhir_hasil_pemeriksaan': ba.akhir_hasil_pemeriksaan.toString(),
              'akhir_kesimpulan': ba.akhir_kesimpulan.toString(),
              'akhir_tindakan': ba.akhir_tindakan.toString(),
              'akhir_barang_bukti': ba.akhir_barang_bukti.toString(),
              'akhir_tanggal_penyelesaian':
                  ba.akhir_tanggal_penyelesaian.toString(),
              'akhir_foto_barang_bukti': ba.akhir_foto_barang_bukti.toString(),
              'akhir_labor': ba.akhir_labor.toString(),
            },
          );
        }
        ;
      }

      //// batas
      // var delete = await _database!.rawDelete("Delete from $table");
      // var delete_form_langsung =
      //     await _database!.rawDelete("Delete from $table_form_langsungs");
      // var delete_form_tidak_langsung =
      //     await _database!.rawDelete("Delete from $table_form_tidak_langsungs");

      // final res = await http.post(
      //   Uri.parse('$baseUrl/work-order/regu'),
      //   headers: {
      //     'Authorization': 'Bearer $token',
      //   },
      //   body: {
      //     'regus_id': regus_id,
      //   },
      // );

      // if (res.statusCode == 200) {
      //   for (int i = 0; i < jsonDecode(res.body)['data'].length; i++) {
      //     final data = await _database!.insert(table, {
      //       'works_id': jsonDecode(res.body)['data'][i]['id'],
      //       'id_pelanggan': jsonDecode(res.body)['data'][i]['id_pelanggan'],
      //       'nama_pelanggan': jsonDecode(res.body)['data'][i]['nama_pelanggan'],
      //       'latitude': jsonDecode(res.body)['data'][i]['latitude'],
      //       'longitude': jsonDecode(res.body)['data'][i]['longitude'],
      //       'alamat': jsonDecode(res.body)['data'][i]['alamat'],
      //       'jenis_p2tl': jsonDecode(res.body)['data'][i]['jenis_p2tl'],
      //       'tarif': jsonDecode(res.body)['data'][i]['tarif'],
      //       'daya': jsonDecode(res.body)['data'][i]['daya'],
      //       'rbm': jsonDecode(res.body)['data'][i]['rbm'],
      //       'lgkh': jsonDecode(res.body)['data'][i]['lgkh'],
      //       'fkm': jsonDecode(res.body)['data'][i]['fkm'],
      //       'keterangan_p2tl': jsonDecode(res.body)['data'][i]
      //           ['keterangan_p2tl'],
      //       'status': jsonDecode(res.body)['data'][i]['status'],
      //       'surat_tugas_p2tl': jsonDecode(res.body)['data'][i]
      //           ['surat_tugas_p2tl'],
      //       'tanggal_surat_tugas_p2tl': jsonDecode(res.body)['data'][i]
      //           ['tanggal_surat_tugas_p2tl'],
      //       'surat_tugas_tni': jsonDecode(res.body)['data'][i]
      //           ['surat_tugas_tni'],
      //       'tanggal_surat_tugas_tni': jsonDecode(res.body)['data'][i]
      //           ['tanggal_surat_tugas_tni'],
      //       'komentar': jsonDecode(res.body)['data'][i]['komentar'],
      //       'P1': jsonDecode(res.body)['data'][i]['P1'],
      //       'P2': jsonDecode(res.body)['data'][i]['P2'],
      //       'P3': jsonDecode(res.body)['data'][i]['P3'],
      //       'P4': jsonDecode(res.body)['data'][i]['P4'],
      //       'P5': jsonDecode(res.body)['data'][i]['P5'],
      //       'P6': jsonDecode(res.body)['data'][i]['P6'],
      //       'P7': jsonDecode(res.body)['data'][i]['P7'],
      //       'P8': jsonDecode(res.body)['data'][i]['P8'],
      //       'P9': jsonDecode(res.body)['data'][i]['P9'],
      //       'P10': jsonDecode(res.body)['data'][i]['P10'],
      //       'image': jsonDecode(res.body)['data'][i]['image'],
      //       'video': jsonDecode(res.body)['data'][i]['video'],
      //       'labor': jsonDecode(res.body)['data'][i]['labor'],
      //       'createdAt': DateTime.now().toIso8601String().split('T').first,
      //     });
      //   }
      //   return 1;
      // }

      // return 0;
    }

    if (roles == 'LABOR') {
      final res = await http.get(
        Uri.parse('$baseUrl/labor/work-order'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body)['data'].length; i++) {
          final data = await _database!.insert(table, {
            'works_id': jsonDecode(res.body)['data'][i]['id'],
            'id_pelanggan': jsonDecode(res.body)['data'][i]['id_pelanggan'],
            'nama_pelanggan': jsonDecode(res.body)['data'][i]['nama_pelanggan'],
            'latitude': jsonDecode(res.body)['data'][i]['latitude'],
            'longitude': jsonDecode(res.body)['data'][i]['longitude'],
            'alamat': jsonDecode(res.body)['data'][i]['alamat'],
            'jenis_p2tl': jsonDecode(res.body)['data'][i]['jenis_p2tl'],
            'tarif': jsonDecode(res.body)['data'][i]['tarif'],
            'daya': jsonDecode(res.body)['data'][i]['daya'],
            'rbm': jsonDecode(res.body)['data'][i]['rbm'],
            'lgkh': jsonDecode(res.body)['data'][i]['lgkh'],
            'fkm': jsonDecode(res.body)['data'][i]['fkm'],
            'keterangan_p2tl': jsonDecode(res.body)['data'][i]
                ['keterangan_p2tl'],
            'status': jsonDecode(res.body)['data'][i]['status'],
            'surat_tugas_p2tl': jsonDecode(res.body)['data'][i]
                ['surat_tugas_p2tl'],
            'tanggal_surat_tugas_p2tl': jsonDecode(res.body)['data'][i]
                ['tanggal_surat_tugas_p2tl'],
            'surat_tugas_tni': jsonDecode(res.body)['data'][i]
                ['surat_tugas_tni'],
            'tanggal_surat_tugas_tni': jsonDecode(res.body)['data'][i]
                ['tanggal_surat_tugas_tni'],
            'komentar': jsonDecode(res.body)['data'][i]['komentar'],
            'P1': jsonDecode(res.body)['data'][i]['P1'],
            'P2': jsonDecode(res.body)['data'][i]['P2'],
            'P3': jsonDecode(res.body)['data'][i]['P3'],
            'P4': jsonDecode(res.body)['data'][i]['P4'],
            'P5': jsonDecode(res.body)['data'][i]['P5'],
            'P6': jsonDecode(res.body)['data'][i]['P6'],
            'P7': jsonDecode(res.body)['data'][i]['P7'],
            'P8': jsonDecode(res.body)['data'][i]['P8'],
            'P9': jsonDecode(res.body)['data'][i]['P9'],
            'P10': jsonDecode(res.body)['data'][i]['P10'],
            'image': jsonDecode(res.body)['data'][i]['image'],
            'video': jsonDecode(res.body)['data'][i]['video'],
            'labor': jsonDecode(res.body)['data'][i]['labor'],
            'createdAt': DateTime.now().toIso8601String().split('T').first,
          });
        }
        return 1;
      }
    }
    return 0;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(table, row);

    return query;
  }

  Future<PengambilanModel> searchFormPengambilan(int idParam) async {
    final query = await _database!
        .rawQuery('SELECT * FROM table_pengambilan WHERE works_id = $idParam');

    if (query.isNotEmpty) {
      return PengambilanModel.fromJson(query[0]);
    }

    return PengambilanModel();
  }

  Future<int> insertFormPengambilan(Map<String, dynamic> row) async {
    final query = await _database!.insert('table_pengambilan', row);

    return query;
  }

  Future<int> updateFormPengambilan(
      int idParam, Map<String, dynamic> row) async {
    final query = await _database!.update('table_pengambilan', row,
        where: '$id = ?', whereArgs: [idParam]);

    return query;
  }

  Future<LangsungModel> searchFormLangsung(int idParam) async {
    final query = await _database!
        .rawQuery('SELECT * FROM form_langsungs WHERE works_id = $idParam');

    if (query.isNotEmpty) {
      return LangsungModel.fromJson(query[0]);
    }

    return LangsungModel();
  }

  Future<int> insertFormLangsung(Map<String, dynamic> row) async {
    final query = await _database!.insert('form_langsungs', row);

    return query;
  }

  Future<int> updateFormLangsung(int idParam, Map<String, dynamic> row) async {
    print(idParam);
    final query = await _database!
        .update('form_langsungs', row, where: '$id = ?', whereArgs: [idParam]);

    return query;
  }

  Future<TidakLangsungModel> searchFormTidakLangsung(int idParam) async {
    final query = await _database!.rawQuery(
        'SELECT * FROM $table_form_tidak_langsungs WHERE works_id = $idParam');

    if (query.isNotEmpty) {
      print('not Empty');
      return TidakLangsungModel.fromJson(query[0]);
    }

    print('Empty');

    return TidakLangsungModel();
  }

  Future<int> insertFormTidakLangsung(Map<String, dynamic> row) async {
    final query = await _database!.insert('form_tidak_langsungs', row);

    return query;
  }

  Future<int> updateFormTidakLangsung(
      int idParam, Map<String, dynamic> row) async {
    final query = await _database!.update('form_tidak_langsungs', row,
        where: '$id = ?', whereArgs: [idParam]);
    return query;
  }

  Future<KalibrasiModel> searchFormKalibrasi(int idParam) async {
    final query = await _database!
        .rawQuery('SELECT * FROM table_kalibrasis WHERE works_id = $idParam');

    if (query.isNotEmpty) {
      return KalibrasiModel.fromJson(query[0]);
    }

    return KalibrasiModel();
  }

  Future<int> insertFormKalibrasi(Map<String, dynamic> row) async {
    final query = await _database!.insert('table_kalibrasis', row);

    return query;
  }

  Future<int> updateFormKalibrasi(int idParam, Map<String, dynamic> row) async {
    final query = await _database!.update('table_kalibrasis', row,
        where: '$id = ?', whereArgs: [idParam]);
    return query;
  }

  Future<int> update(int idParam, Map<String, dynamic> row) async {
    final query = await _database!
        .update(table, row, where: '$id = ?', whereArgs: [idParam]);
    return query;
  }

  Future delete(int idParam) async {
    await _database!.delete(table, where: '$id = ?', whereArgs: [idParam]);
  }

  Future deleteAll() async {
    return await _database!.rawDelete("Delete from $table");
  }
}
