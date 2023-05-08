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
  final String _databaseName = 'test9876543.db';
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
  final String isluar = 'isLuar';
  final String newWork = 'newWork';
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
        $isluar STRING NULL,
        $newWork INTEGER NULL,
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
        akhir_kesimpulan_video STRING NULL,
        akhir_temuan STRING NULL,
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
        akhir_kesimpulan_video STRING NULL,
        akhir_temuan STRING NULL,
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
        nama_saksi STRING NULL,
        alamat_saksi STRING NULL,
        nomor_identitas STRING NULL,  
        no_telpon_saksi STRING NULL, 
        foto_identitas STRING NULL,
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
        .rawQuery('SELECT COUNT (*) from $table where isLuar IS NOT NULL');

    var query_dalam =
        await db.rawQuery('SELECT COUNT (*) from $table where isLuar IS NULL');

    int? belum = Sqflite.firstIntValue(query_belum);
    int? sudah = Sqflite.firstIntValue(query_sudah);

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

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(table, row);

    return query;
  }

  Future<int> updateWorkOrder(int idParam, Map<String, dynamic> row) async {
    final query = await _database!
        .update('works', row, where: '$id = ?', whereArgs: [idParam]);
    return query;
  }

  Future<int> searchWork(int idParam) async {
    final query = await _database!
        .rawQuery('SELECT * FROM works WHERE works_id = $idParam');

    if (query.isNotEmpty) {
      return 1;
    }

    return 0;
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

  Future<void> deleteAll() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    if (appDir.existsSync()) {
      appDir.listSync().forEach((entity) {
        if (entity is File) {
          entity.deleteSync();
        }
      });
    }

    var delete_form_kalibrasi =
        await _database!.rawDelete("Delete from $table_kalibrasis");
    var delete_form_pengambilan =
        await _database!.rawDelete("Delete from $table_pengambilan");
    var delete_form_langsung =
        await _database!.rawDelete("Delete from $table_form_langsungs");
    var delete_form_tidak_langsung =
        await _database!.rawDelete("Delete from $table_form_tidak_langsungs");

    var delete_work = await _database!.rawDelete("Delete from $table");
  }

  final String baseUrl = 'https://p2tl.bright.id/api';

  Future<int> getWork() async {
    final token = await AuthService().getToken();
    final regus_id = await AuthService().getRegu();
    final roles = await AuthService().getRoles();

    if (roles == 'PETUGAS LAPANGAN') {
      final data = await _database!.query(table);

      if (data.length != 0) {
        List<WorkModel> result =
            data.map((e) => WorkModel.fromJson(e)).toList();

        for (int index = 0; index < result.length; index++) {
          WorkModel listItem = result[index];

          int? work_id = 0;

          print(listItem.isLuar);
          print(listItem.newWork);

          if (listItem.isLuar == '1' && listItem.newWork.toString() == 'null') {
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
              ..fields['regus_id'] = regus_id.toString()
              ..fields['nama_pelanggan'] = listItem.namaPelanggan.toString()
              ..fields['latitude'] = listItem.latitude.toString()
              ..fields['longitude'] = listItem.longitude.toString();

            if (listItem.image != 'null') {
              var multipartFile =
                  await http.MultipartFile.fromPath('image', listItem.image!);

              resWork.files.add(multipartFile);
            }

            if (listItem.video != 'null') {
              var multipartFile2 =
                  await http.MultipartFile.fromPath("video", listItem.video!);

              resWork.files.add(multipartFile2);
            }

            var response = await resWork.send();

            print(response.statusCode);

            if (response.statusCode == 200) {
              String responseBody = await response.stream.bytesToString();
              var data = jsonDecode(responseBody);
              var updateWo = await updateWorkOrder(listItem.id!,
                  {'newWork': jsonDecode(responseBody)['data']['id']});
            }
          } else {
            work_id = listItem.works_id;
            final resWork = http.MultipartRequest(
                "POST", Uri.parse('$baseUrl/work-order'))
              ..headers["Content-Type"] = "application/json"
              ..headers["Authorization"] = "Bearer $token"
              ..fields['id'] = work_id.toString()
              ..fields['keterangan_p2tl'] = listItem.keteranganP2tl.toString();

            if (listItem.image != 'null') {
              var multipartFile =
                  await http.MultipartFile.fromPath(image, listItem.image!);

              resWork.files.add(multipartFile);
            }

            if (listItem.video != 'null') {
              var multipartFile2 =
                  await http.MultipartFile.fromPath(video, listItem.video!);

              resWork.files.add(multipartFile2);
            }

            var response = await resWork.send();

            if (response.statusCode == 200) {
              String responseBody = await response.stream.bytesToString();

              var data = jsonDecode(responseBody);
            }
          }

          if (listItem.jenis_p2tl == '3TL' &&
              listItem.keteranganP2tl != "Belum Dikerjakan") {
            work_id = listItem.works_id;

            if (listItem.newWork != null) {
              if (listItem.newWork != 'null') {
                work_id = listItem.newWork;
              }
            }

            TidakLangsungModel ba =
                await searchFormTidakLangsung(listItem.works_id!);

            final resNot = http.MultipartRequest(
                "POST", Uri.parse('$baseUrl/new-form-tidak-langsung'))
              ..headers["Content-Type"] = "application/json"
              ..headers["Authorization"] = "Bearer $token"
              ..fields['works_id'] = work_id.toString()
              ..fields['regus_id'] = regus_id.toString()
              ..fields['nama_saksi'] = ba.nama_saksi.toString()
              ..fields['alamat_saksi'] = ba.alamat_saksi.toString()
              ..fields['nomor_identitas'] = ba.nomor_identitas.toString()
              ..fields['pekerjaan'] = ba.pekerjaan.toString()
              ..fields['no_telpon_saksi'] = ba.no_telpon_saksi.toString()
              ..fields['data_tegangan_tersambung'] =
                  ba.data_tegangan_tersambung.toString()
              ..fields['data_jenis_pengukuran'] =
                  ba.data_jenis_pengukuran.toString()
              ..fields['data_tempat_kedudukan'] =
                  ba.data_tempat_kedudukan.toString()
              ..fields['pembatas_jenis'] = ba.pembatas_jenis.toString()
              ..fields['pembatas_merk'] = ba.pembatas_merk.toString()
              ..fields['pembatas_rating_arus'] =
                  ba.pembatas_rating_arus.toString()
              ..fields['kwh_merk'] = ba.kwh_merk.toString()
              ..fields['kwh_no_reg'] = ba.kwh_no_reg.toString()
              ..fields['kwh_no_seri'] = ba.kwh_no_seri.toString()
              ..fields['kwh_tahun'] = ba.kwh_tahun.toString()
              ..fields['kwh_konstanta'] = ba.kwh_konstanta.toString()
              ..fields['kwh_class'] = ba.kwh_class.toString()
              ..fields['kwh_rating_arus'] = ba.kwh_rating_arus.toString()
              ..fields['kwh_tegangan'] = ba.kwh_tegangan.toString()
              ..fields['kwh_lbp'] = ba.kwh_lbp.toString()
              ..fields['kwh_bp'] = ba.kwh_bp.toString()
              ..fields['kwh_total'] = ba.kwh_total.toString()
              ..fields['kwh_kvarh'] = ba.kwh_kvarh.toString()
              ..fields['ct_merk'] = ba.ct_merk.toString()
              ..fields['ct_cls'] = ba.ct_cls.toString()
              ..fields['ct_rasio'] = ba.ct_rasio.toString()
              ..fields['ct_burden'] = ba.ct_burden.toString()
              ..fields['pt_merk'] = ba.pt_merk.toString()
              ..fields['pt_cls'] = ba.pt_cls.toString()
              ..fields['pt_rasio'] = ba.pt_rasio.toString()
              ..fields['pt_burden'] = ba.pt_burden.toString()
              ..fields['kubikel_merk'] = ba.kubikel_merk.toString()
              ..fields['kubikel_type'] = ba.kubikel_type.toString()
              ..fields['kubikel_no_seri'] = ba.kubikel_no_seri.toString()
              ..fields['kubikel_tahun'] = ba.kubikel_tahun.toString()
              ..fields['box_app_merk'] = ba.kubikel_merk.toString()
              ..fields['box_app_type'] = ba.kubikel_type.toString()
              ..fields['box_app_no_seri'] = ba.kubikel_no_seri.toString()
              ..fields['box_app_tahun'] = ba.kubikel_tahun.toString()
              ..fields['pelindung_kwh_peralatan'] =
                  ba.pelindung_kwh_peralatan.toString()
              ..fields['pelindung_kwh_segel'] =
                  ba.pelindung_kwh_segel.toString()
              ..fields['pelindung_kwh_nomor_tahun_kode_segel'] =
                  ba.pelindung_kwh_nomor_tahun_kode_segel.toString()
              ..fields['pelindung_kwh_keterangan'] =
                  ba.pelindung_kwh_keterangan.toString()
              ..fields['pelindung_kwh_post_peralatan'] =
                  ba.pelindung_kwh_post_peralatan.toString()
              ..fields['pelindung_kwh_post_segel'] =
                  ba.pelindung_kwh_post_segel.toString()
              ..fields['pelindung_kwh_post_nomor_tahun_kode_segel'] =
                  ba.pelindung_kwh_post_nomor_tahun_kode_segel.toString()
              ..fields['pelindung_ct_peralatan'] =
                  ba.pelindung_ct_peralatan.toString()
              ..fields['pelindung_ct_segel'] = ba.pelindung_ct_segel.toString()
              ..fields['pelindung_ct_nomor_tahun_kode_segel'] =
                  ba.pelindung_ct_nomor_tahun_kode_segel.toString()
              ..fields['pelindung_ct_keterangan'] =
                  ba.pelindung_ct_keterangan.toString()
              ..fields['pelindung_ct_post_peralatan'] =
                  ba.pelindung_ct_post_peralatan.toString()
              ..fields['pelindung_ct_post_segel'] =
                  ba.pelindung_ct_post_segel.toString()
              ..fields['pelindung_ct_post_nomor_tahun_kode_segel'] =
                  ba.pelindung_ct_post_nomor_tahun_kode_segel.toString()
              ..fields['segel_peralatan'] = ba.segel_peralatan.toString()
              ..fields['segel_segel'] = ba.segel_segel.toString()
              ..fields['segel_nomor_tahun_kode_segel'] =
                  ba.segel_nomor_tahun_kode_segel.toString()
              ..fields['segel_keterangan'] = ba.segel_keterangan.toString()
              ..fields['segel_post_peralatan'] =
                  ba.segel_post_peralatan.toString()
              ..fields['segel_post_segel'] = ba.segel_post_segel.toString()
              ..fields['segel_post_nomor_tahun_kode_segel'] =
                  ba.segel_post_nomor_tahun_kode_segel.toString()
              ..fields['tutup_terminal_peralatan'] =
                  ba.tutup_terminal_peralatan.toString()
              ..fields['tutup_terminal_segel'] =
                  ba.tutup_terminal_segel.toString()
              ..fields['tutup_terminal_nomor_tahun_kode_segel'] =
                  ba.tutup_terminal_nomor_tahun_kode_segel.toString()
              ..fields['tutup_terminal_keterangan'] =
                  ba.tutup_terminal_keterangan.toString()
              ..fields['tutup_terminal_post_peralatan'] =
                  ba.tutup_terminal_post_peralatan.toString()
              ..fields['tutup_terminal_post_segel'] =
                  ba.tutup_terminal_post_segel.toString()
              ..fields['tutup_terminal_post_nomor_tahun_kode_segel'] =
                  ba.tutup_terminal_post_nomor_tahun_kode_segel.toString()
              ..fields['amr_peralatan'] = ba.amr_peralatan.toString()
              ..fields['amr_segel'] = ba.amr_segel.toString()
              ..fields['amr_nomor_tahun_kode_segel'] =
                  ba.amr_nomor_tahun_kode_segel.toString()
              ..fields['amr_keterangan'] = ba.amr_keterangan.toString()
              ..fields['amr_post_peralatan'] = ba.amr_post_peralatan.toString()
              ..fields['amr_post_segel'] = ba.amr_post_segel.toString()
              ..fields['amr_post_nomor_tahun_kode_segel'] =
                  ba.amr_post_nomor_tahun_kode_segel.toString()
              ..fields['terminal_vt_peralatan'] =
                  ba.terminal_vt_peralatan.toString()
              ..fields['terminal_vt_segel'] = ba.terminal_vt_segel.toString()
              ..fields['terminal_vt_nomor_tahun_kode_segel'] =
                  ba.terminal_vt_nomor_tahun_kode_segel.toString()
              ..fields['terminal_vt_keterangan'] =
                  ba.terminal_vt_keterangan.toString()
              ..fields['terminal_vt_post_peralatan'] =
                  ba.terminal_vt_post_peralatan.toString()
              ..fields['terminal_vt_post_segel'] =
                  ba.terminal_vt_post_segel.toString()
              ..fields['terminal_vt_post_nomor_tahun_kode_segel'] =
                  ba.terminal_vt_post_nomor_tahun_kode_segel.toString()
              ..fields['terminal_ct_peralatan'] =
                  ba.terminal_ct_peralatan.toString()
              ..fields['terminal_ct_segel'] = ba.terminal_ct_segel.toString()
              ..fields['terminal_ct_nomor_tahun_kode_segel'] =
                  ba.terminal_ct_nomor_tahun_kode_segel.toString()
              ..fields['terminal_ct_keterangan'] =
                  ba.terminal_ct_keterangan.toString()
              ..fields['terminal_ct_post_peralatan'] =
                  ba.terminal_ct_post_peralatan.toString()
              ..fields['terminal_ct_post_segel'] =
                  ba.terminal_ct_post_segel.toString()
              ..fields['terminal_ct_post_nomor_tahun_kode_segel'] =
                  ba.terminal_ct_post_nomor_tahun_kode_segel.toString()
              ..fields['pintu_peralatan'] = ba.pintu_peralatan.toString()
              ..fields['pintu_segel'] = ba.pintu_segel.toString()
              ..fields['pintu_nomor_tahun_kode_segel'] =
                  ba.pintu_nomor_tahun_kode_segel.toString()
              ..fields['pintu_keterangan'] = ba.pintu_keterangan.toString()
              ..fields['pintu_post_peralatan'] =
                  ba.pintu_post_peralatan.toString()
              ..fields['pintu_post_segel'] = ba.pintu_post_segel.toString()
              ..fields['pintu_post_nomor_tahun_kode_segel'] =
                  ba.pintu_post_nomor_tahun_kode_segel.toString()
              ..fields['pintu_keterangan_all'] =
                  ba.pintu_keterangan_all.toString()
              ..fields['wiring_terminal1'] = ba.wiring_terminal1.toString()
              ..fields['wiring_terminal2'] = ba.wiring_terminal2.toString()
              ..fields['wiring_terminal3'] = ba.wiring_terminal3.toString()
              ..fields['wiring_terminal4'] = ba.wiring_terminal4.toString()
              ..fields['wiring_terminal5'] = ba.wiring_terminal5.toString()
              ..fields['wiring_terminal6'] = ba.wiring_terminal6.toString()
              ..fields['wiring_terminal7'] = ba.wiring_terminal7.toString()
              ..fields['wiring_terminal8'] = ba.wiring_terminal8.toString()
              ..fields['wiring_terminal9'] = ba.wiring_terminal9.toString()
              ..fields['wiring_terminal11'] = ba.wiring_terminal11.toString()
              ..fields['wiring_grounding'] = ba.wiring_grounding.toString()
              ..fields['wiring_keterangan'] = ba.wiring_keterangan.toString()
              ..fields['wiring_diagram'] = ba.wiring_diagram.toString()
              ..fields['pengukuran_arus_primer_r'] =
                  ba.pengukuran_arus_primer_r.toString()
              ..fields['pengukuran_arus_primer_s'] =
                  ba.pengukuran_arus_primer_s.toString()
              ..fields['pengukuran_arus_primer_t'] =
                  ba.pengukuran_arus_primer_t.toString()
              ..fields['pengukuran_arus_sekunder_r'] =
                  ba.pengukuran_arus_sekunder_r.toString()
              ..fields['pengukuran_arus_sekunder_s'] =
                  ba.pengukuran_arus_sekunder_s.toString()
              ..fields['pengukuran_arus_sekunder_t'] =
                  ba.pengukuran_arus_sekunder_t.toString()
              ..fields['pengukuran_ct_r'] = ba.pengukuran_ct_r.toString()
              ..fields['pengukuran_ct_s'] = ba.pengukuran_ct_s.toString()
              ..fields['pengukuran_ct_t'] = ba.pengukuran_ct_t.toString()
              ..fields['pengukuran_akurasi_r'] =
                  ba.pengukuran_akurasi_r.toString()
              ..fields['pengukuran_akurasi_s'] =
                  ba.pengukuran_akurasi_s.toString()
              ..fields['pengukuran_akurasi_t'] =
                  ba.pengukuran_akurasi_t.toString()
              ..fields['pengukuran_voltase_primer_r'] =
                  ba.pengukuran_voltase_primer_r.toString()
              ..fields['pengukuran_voltase_primer_s'] =
                  ba.pengukuran_voltase_primer_s.toString()
              ..fields['pengukuran_voltase_primer_t'] =
                  ba.pengukuran_voltase_primer_t.toString()
              ..fields['pengukuran_voltase_sekunder_r'] =
                  ba.pengukuran_voltase_sekunder_r.toString()
              ..fields['pengukuran_voltase_sekunder_s'] =
                  ba.pengukuran_voltase_sekunder_s.toString()
              ..fields['pengukuran_voltase_sekunder_t'] =
                  ba.pengukuran_voltase_sekunder_t.toString()
              ..fields['pengukuran_cos_r'] = ba.pengukuran_cos_r.toString()
              ..fields['pengukuran_cos_s'] = ba.pengukuran_cos_s.toString()
              ..fields['pengukuran_cos_t'] = ba.pengukuran_cos_t.toString()
              ..fields['pengukuran_akurasi'] = ba.pengukuran_akurasi.toString()
              ..fields['pengukuran_keterangan'] =
                  ba.pengukuran_keterangan.toString()
              ..fields['akhir_hasil_pemeriksaan'] =
                  ba.akhir_hasil_pemeriksaan.toString()
              ..fields['akhir_kesimpulan'] = ba.akhir_kesimpulan.toString()
              ..fields['akhir_tindakan'] = ba.akhir_tindakan.toString()
              ..fields['akhir_barang_bukti'] = ba.akhir_barang_bukti.toString()
              ..fields['akhir_tanggal_penyelesaian'] =
                  ba.akhir_tanggal_penyelesaian.toString()
              ..fields['akhir_labor'] = ba.akhir_labor.toString()
              ..fields['akhir_temuan'] = ba.akhir_temuan.toString();

            if (ba.file_nomor_identitas != 'null') {
              var multipartFile = await http.MultipartFile.fromPath(
                  'file_nomor_identitas', ba.file_nomor_identitas!);

              resNot.files.add(multipartFile);
            }

            if (ba.pembatas_foto_pembatas != 'null') {
              var multipartFile1 = await http.MultipartFile.fromPath(
                  'pembatas_foto_pembatas', ba.pembatas_foto_pembatas!);

              resNot.files.add(multipartFile1);
            }

            if (ba.kwh_foto != 'null') {
              var multipartFile2 =
                  await http.MultipartFile.fromPath('kwh_foto', ba.kwh_foto!);

              resNot.files.add(multipartFile2);
            }

            if (ba.ct_foto != 'null') {
              var multipartFile3 =
                  await http.MultipartFile.fromPath('ct_foto', ba.ct_foto!);

              resNot.files.add(multipartFile3);
            }

            if (ba.pt_foto != 'null') {
              var multipartFile4 =
                  await http.MultipartFile.fromPath('pt_foto', ba.pt_foto!);

              resNot.files.add(multipartFile4);
            }

            if (ba.kubikel_foto != 'null') {
              var multipartFile5 = await http.MultipartFile.fromPath(
                  'kubikel_foto', ba.kubikel_foto!);

              resNot.files.add(multipartFile5);
            }

            if (ba.box_app_foto != 'null') {
              var multipartFile6 = await http.MultipartFile.fromPath(
                  'box_app_foto', ba.box_app_foto!);

              resNot.files.add(multipartFile6);
            }

            if (ba.pelindung_kwh_foto_sebelum != 'null') {
              var multipartFile7 = await http.MultipartFile.fromPath(
                  'pelindung_kwh_foto_sebelum', ba.pelindung_kwh_foto_sebelum!);

              resNot.files.add(multipartFile7);
            }

            if (ba.pelindung_kwh_foto_sesudah != 'null') {
              var multipartFile8 = await http.MultipartFile.fromPath(
                  'pelindung_kwh_foto_sesudah', ba.pelindung_kwh_foto_sesudah!);

              resNot.files.add(multipartFile8);
            }

            if (ba.pelindung_ct_foto_sebelum != 'null') {
              var multipartFile9 = await http.MultipartFile.fromPath(
                  'pelindung_ct_foto_sebelum', ba.pelindung_ct_foto_sebelum!);

              resNot.files.add(multipartFile9);
            }

            if (ba.pelindung_ct_foto_sesudah != 'null') {
              var multipartFile10 = await http.MultipartFile.fromPath(
                  'pelindung_ct_foto_sesudah', ba.pelindung_ct_foto_sesudah!);

              resNot.files.add(multipartFile10);
            }

            if (ba.segel_foto_sebelum != 'null') {
              var multipartFile11 = await http.MultipartFile.fromPath(
                  'segel_foto_sebelum', ba.segel_foto_sebelum!);

              resNot.files.add(multipartFile11);
            }

            if (ba.segel_foto_sesudah != 'null') {
              var multipartFile12 = await http.MultipartFile.fromPath(
                  'segel_foto_sesudah', ba.segel_foto_sesudah!);

              resNot.files.add(multipartFile12);
            }

            if (ba.tutup_terminal_foto_sebelum != 'null') {
              var multipartFile13 = await http.MultipartFile.fromPath(
                  'tutup_terminal_foto_sebelum',
                  ba.tutup_terminal_foto_sebelum!);

              resNot.files.add(multipartFile13);
            }

            if (ba.tutup_terminal_foto_sesudah != 'null') {
              var multipartFile14 = await http.MultipartFile.fromPath(
                  'tutup_terminal_foto_sesudah',
                  ba.tutup_terminal_foto_sesudah!);

              resNot.files.add(multipartFile14);
            }

            if (ba.amr_foto_sebelum != 'null') {
              var multipartFile15 = await http.MultipartFile.fromPath(
                  'amr_foto_sebelum', ba.amr_foto_sebelum!);

              resNot.files.add(multipartFile15);
            }

            if (ba.amr_foto_sesudah != 'null') {
              var multipartFile16 = await http.MultipartFile.fromPath(
                  'amr_foto_sesudah', ba.amr_foto_sesudah!);

              resNot.files.add(multipartFile16);
            }

            if (ba.terminal_vt_foto_sebelum != 'null') {
              var multipartFile17 = await http.MultipartFile.fromPath(
                  'terminal_vt_foto_sebelum', ba.terminal_vt_foto_sebelum!);

              resNot.files.add(multipartFile17);
            }

            if (ba.terminal_vt_foto_sesudah != 'null') {
              var multipartFile18 = await http.MultipartFile.fromPath(
                  'terminal_vt_foto_sesudah', ba.terminal_vt_foto_sesudah!);

              resNot.files.add(multipartFile18);
            }

            if (ba.terminal_ct_foto_sebelum != 'null') {
              var multipartFile19 = await http.MultipartFile.fromPath(
                  'terminal_ct_foto_sebelum', ba.terminal_ct_foto_sebelum!);

              resNot.files.add(multipartFile19);
            }

            if (ba.terminal_ct_foto_sesudah != 'null') {
              var multipartFile20 = await http.MultipartFile.fromPath(
                  'terminal_ct_foto_sesudah', ba.terminal_ct_foto_sesudah!);

              resNot.files.add(multipartFile20);
            }

            if (ba.pintu_foto_sebelum != 'null') {
              var multipartFile21 = await http.MultipartFile.fromPath(
                  'pintu_foto_sebelum', ba.pintu_foto_sebelum!);

              resNot.files.add(multipartFile21);
            }

            if (ba.pintu_foto_sesudah != 'null') {
              var multipartFile22 = await http.MultipartFile.fromPath(
                  'pintu_foto_sesudah', ba.pintu_foto_sesudah!);

              resNot.files.add(multipartFile22);
            }

            if (ba.wiring_foto != 'null') {
              var multipartFile23 = await http.MultipartFile.fromPath(
                  'wiring_foto', ba.wiring_foto!);

              resNot.files.add(multipartFile23);
            }

            if (ba.pengukuran_foto != 'null') {
              var multipartFile24 = await http.MultipartFile.fromPath(
                  'pengukuran_foto', ba.pengukuran_foto!);

              resNot.files.add(multipartFile24);
            }

            if (ba.akhir_foto_barang_bukti != 'null') {
              var multipartFile25 = await http.MultipartFile.fromPath(
                  'akhir_foto_barang_bukti', ba.akhir_foto_barang_bukti!);

              resNot.files.add(multipartFile25);
            }

            if (ba.akhir_kesimpulan_video != 'null') {
              var multipartFile25 = await http.MultipartFile.fromPath(
                  'kesimpulan_video', ba.akhir_kesimpulan_video!);

              resNot.files.add(multipartFile25);
            }

            var resTidak = await resNot.send();

            if (resTidak.statusCode == 200) {
              String responseBody = await resTidak.stream.bytesToString();

              var data = jsonDecode(responseBody);
            }
          } else if (listItem.jenis_p2tl == '3L' ||
              listItem.jenis_p2tl == '1L' &&
                  listItem.keteranganP2tl != "Belum Dikerjakan") {
            work_id = listItem.works_id;

            if (listItem.newWork != null) {
              if (listItem.newWork != 'null') {
                work_id = listItem.newWork;
              }
            }

            LangsungModel ba = await searchFormLangsung(listItem.works_id!);
            print('work_id');
            print(work_id);
            print('ba');
            print(ba.works_id);
            print('newWork');
            print(listItem.newWork);

            final resWork = http.MultipartRequest(
                "POST", Uri.parse('$baseUrl/new-form-langsung'))
              ..headers["Content-Type"] = "application/json"
              ..headers["Authorization"] = "Bearer $token"
              ..fields['works_id'] = work_id.toString()
              ..fields['nama_saksi'] = ba.nama_saksi.toString()
              ..fields['alamat_saksi'] = ba.alamat_saksi.toString()
              ..fields['nomor_identitas'] = ba.nomor_identitas.toString()
              ..fields['no_telpon_saksi'] = ba.no_telpon_saksi.toString()
              ..fields['data_lama_merk'] = ba.data_lama_merk.toString()
              ..fields['data_lama_no_reg'] = ba.data_lama_no_reg.toString()
              ..fields['data_lama_no_seri'] = ba.data_lama_no_seri.toString()
              ..fields['data_lama_tahun_pembuatan'] =
                  ba.data_lama_tahun_pembuatan.toString()
              ..fields['data_lama_class'] = ba.data_lama_class.toString()
              ..fields['data_lama_konstanta'] =
                  ba.data_lama_konstanta.toString()
              ..fields['data_lama_rating_arus'] =
                  ba.data_lama_rating_arus.toString()
              ..fields['data_lama_tegangan_nominal'] =
                  ba.data_lama_tegangan_nominal.toString()
              ..fields['data_lama_stand_kwh_meter'] =
                  ba.data_lama_stand_kwh_meter.toString()
              ..fields['data_lama_jenis_pembatas'] =
                  ba.data_lama_jenis_pembatas.toString()
              ..fields['data_lama_alat_pembatas_merk'] =
                  ba.data_lama_alat_pembatas_merk.toString()
              ..fields['data_lama_rating_arus_2'] =
                  ba.data_lama_rating_arus_2.toString()
              ..fields['data_baru_merk'] = ba.data_baru_merk.toString()
              ..fields['data_baru_no_reg'] = ba.data_baru_no_reg.toString()
              ..fields['data_baru_no_seri'] = ba.data_baru_no_seri.toString()
              ..fields['data_baru_tahun_pembuatan'] =
                  ba.data_baru_tahun_pembuatan.toString()
              ..fields['data_baru_class'] = ba.data_baru_class.toString()
              ..fields['data_baru_konstanta'] =
                  ba.data_baru_konstanta.toString()
              ..fields['data_baru_rating_arus'] =
                  ba.data_baru_rating_arus.toString()
              ..fields['data_baru_tegangan_nominal'] =
                  ba.data_baru_tegangan_nominal.toString()
              ..fields['data_baru_stand_kwh_meter'] =
                  ba.data_baru_stand_kwh_meter.toString()
              ..fields['data_baru_jenis_pembatas'] =
                  ba.data_baru_jenis_pembatas.toString()
              ..fields['data_baru_alat_pembatas_merk'] =
                  ba.data_baru_alat_pembatas_merk.toString()
              ..fields['data_baru_rating_arus_2'] =
                  ba.data_baru_rating_arus_2.toString()
              ..fields['kwh_peralatan'] = ba.kwh_peralatan.toString()
              ..fields['kwh_segel'] = ba.kwh_segel.toString()
              ..fields['kwh_nomor_tahun_kode_segel'] =
                  ba.kwh_nomor_tahun_kode_segel.toString()
              ..fields['kwh_keterangan'] = ba.kwh_keterangan.toString()
              ..fields['kwh_post_peralatan'] = ba.kwh_post_peralatan.toString()
              ..fields['kwh_post_segel'] = ba.kwh_post_segel.toString()
              ..fields['kwh_post_nomor_tahun_kode_segel'] =
                  ba.kwh_post_nomor_tahun_kode_segel.toString()
              ..fields['kwh_post_nomor_tahun_kode_segel'] =
                  ba.kwh_post_nomor_tahun_kode_segel.toString()
              ..fields['terminal_peralatan'] = ba.terminal_peralatan.toString()
              ..fields['terminal_segel'] = ba.terminal_segel.toString()
              ..fields['terminal_nomor_tahun_kode_segel'] =
                  ba.terminal_nomor_tahun_kode_segel.toString()
              ..fields['terminal_keterangan'] =
                  ba.terminal_keterangan.toString()
              ..fields['terminal_post_peralatan'] =
                  ba.terminal_post_peralatan.toString()
              ..fields['terminal_post_segel'] =
                  ba.terminal_post_segel.toString()
              ..fields['terminal_post_nomor_tahun_kode_segel'] =
                  ba.terminal_post_nomor_tahun_kode_segel.toString()
              ..fields['pelindung_kwh_peralatan'] =
                  ba.pelindung_kwh_peralatan.toString()
              ..fields['pelindung_kwh_segel'] =
                  ba.pelindung_kwh_segel.toString()
              ..fields['pelindung_kwh_nomor_tahun_kode_segel'] =
                  ba.pelindung_kwh_nomor_tahun_kode_segel.toString()
              ..fields['pelindung_kwh_keterangan'] =
                  ba.pelindung_kwh_keterangan.toString()
              ..fields['pelindung_kwh_post_peralatan'] =
                  ba.pelindung_kwh_post_peralatan.toString()
              ..fields['pelindung_kwh_post_segel'] =
                  ba.pelindung_kwh_post_segel.toString()
              ..fields['pelindung_kwh_post_nomor_tahun_kode_segel'] =
                  ba.pelindung_kwh_post_nomor_tahun_kode_segel.toString()
              ..fields['busbar_peralatan'] = ba.busbar_peralatan.toString()
              ..fields['busbar_segel'] = ba.busbar_segel.toString()
              ..fields['busbar_nomor_tahun_kode_segel'] =
                  ba.busbar_nomor_tahun_kode_segel.toString()
              ..fields['busbar_keterangan'] = ba.busbar_keterangan.toString()
              ..fields['busbar_post_peralatan'] =
                  ba.busbar_post_peralatan.toString()
              ..fields['busbar_post_segel'] = ba.busbar_post_segel.toString()
              ..fields['busbar_post_nomor_tahun_kode_segel'] =
                  ba.busbar_post_nomor_tahun_kode_segel.toString()
              ..fields['busbar_post_nomor_tahun_kode_segel'] =
                  ba.busbar_post_nomor_tahun_kode_segel.toString()
              ..fields['papan_ok_peralatan'] = ba.papan_ok_peralatan.toString()
              ..fields['papan_ok_segel'] = ba.papan_ok_segel.toString()
              ..fields['papan_ok_nomor_tahun_kode_segel'] =
                  ba.papan_ok_nomor_tahun_kode_segel.toString()
              ..fields['papan_ok_keterangan'] =
                  ba.papan_ok_keterangan.toString()
              ..fields['papan_ok_post_peralatan'] =
                  ba.papan_ok_post_peralatan.toString()
              ..fields['papan_ok_post_segel'] =
                  ba.papan_ok_post_segel.toString()
              ..fields['papan_ok_post_nomor_tahun_kode_segel'] =
                  ba.papan_ok_post_nomor_tahun_kode_segel.toString()
              ..fields['papan_ok_post_nomor_tahun_kode_segel'] =
                  ba.papan_ok_post_nomor_tahun_kode_segel.toString()
              ..fields['mcb_peralatan'] = ba.mcb_peralatan.toString()
              ..fields['mcb_segel'] = ba.mcb_segel.toString()
              ..fields['mcb_nomor_tahun_kode_segel'] =
                  ba.mcb_nomor_tahun_kode_segel.toString()
              ..fields['mcb_keterangan'] = ba.mcb_keterangan.toString()
              ..fields['mcb_post_peralatan'] = ba.mcb_post_peralatan.toString()
              ..fields['mcb_post_segel'] = ba.mcb_post_segel.toString()
              ..fields['mcb_post_nomor_tahun_kode_segel'] =
                  ba.mcb_post_nomor_tahun_kode_segel.toString()
              ..fields['pemeriksaan_keterangan'] =
                  ba.pemeriksaan_keterangan.toString()
              ..fields['pemeriksaan_arus_1'] = ba.pemeriksaan_arus_1.toString()
              ..fields['pemeriksaan_arus_2'] = ba.pemeriksaan_arus_2.toString()
              ..fields['pemeriksaan_arus_3'] = ba.pemeriksaan_arus_3.toString()
              ..fields['pemeriksaan_arus_netral'] =
                  ba.pemeriksaan_arus_netral.toString()
              ..fields['pemeriksaan_voltase_netral_1'] =
                  ba.pemeriksaan_voltase_netral_1.toString()
              ..fields['pemeriksaan_voltase_netral_2'] =
                  ba.pemeriksaan_voltase_netral_2.toString()
              ..fields['pemeriksaan_voltase_netral_3'] =
                  ba.pemeriksaan_voltase_netral_3.toString()
              ..fields['pemeriksaan_voltase_phase_1'] =
                  ba.pemeriksaan_voltase_phase_1.toString()
              ..fields['pemeriksaan_voltase_phase_2'] =
                  ba.pemeriksaan_voltase_phase_2.toString()
              ..fields['pemeriksaan_voltase_phase_3'] =
                  ba.pemeriksaan_voltase_phase_3.toString()
              ..fields['pemeriksaan_cos_1'] = ba.pemeriksaan_cos_1.toString()
              ..fields['pemeriksaan_cos_2'] = ba.pemeriksaan_cos_2.toString()
              ..fields['pemeriksaan_cos_3'] = ba.pemeriksaan_cos_3.toString()
              ..fields['pemeriksaan_akurasi'] =
                  ba.pemeriksaan_akurasi.toString()
              ..fields['wiring_terminal1'] = ba.wiring_terminal1.toString()
              ..fields['wiring_terminal2'] = ba.wiring_terminal2.toString()
              ..fields['wiring_terminal3'] = ba.wiring_terminal3.toString()
              ..fields['wiring_terminal4'] = ba.wiring_terminal4.toString()
              ..fields['wiring_terminal5'] = ba.wiring_terminal5.toString()
              ..fields['wiring_terminal6'] = ba.wiring_terminal6.toString()
              ..fields['wiring_terminal7'] = ba.wiring_terminal7.toString()
              ..fields['wiring_terminal8'] = ba.wiring_terminal8.toString()
              ..fields['wiring_terminal9'] = ba.wiring_terminal9.toString()
              ..fields['wiring_terminal11'] = ba.wiring_terminal11.toString()
              ..fields['wiring_keterangan_wiring_app'] =
                  ba.wiring_keterangan_wiring_app.toString()
              ..fields['akhir_hasil_pemeriksaan'] =
                  ba.akhir_hasil_pemeriksaan.toString()
              ..fields['akhir_kesimpulan'] = ba.akhir_kesimpulan.toString()
              ..fields['akhir_tindakan'] =
                  ba.wiring_keterangan_wiring_app.toString()
              ..fields['akhir_barang_bukti'] = ba.akhir_barang_bukti.toString()
              ..fields['akhir_tanggal_penyelesaian'] =
                  ba.akhir_tanggal_penyelesaian.toString()
              ..fields['akhir_temuan'] = ba.akhir_temuan.toString()
              ..fields['akhir_labor'] = ba.akhir_labor.toString();

            if (ba.file_nomor_identitas != 'null') {
              var multipartFile = await http.MultipartFile.fromPath(
                  'file_nomor_identitas', ba.file_nomor_identitas!);

              resWork.files.add(multipartFile);
            }

            if (ba.data_lama_foto_kwh_meter != 'null') {
              var multipartFile1 = await http.MultipartFile.fromPath(
                  'data_lama_foto_kwh_meter', ba.data_lama_foto_kwh_meter!);

              resWork.files.add(multipartFile1);
            }

            if (ba.data_lama_foto_pembatas != 'null') {
              var multipartFile2 = await http.MultipartFile.fromPath(
                  'data_lama_foto_pembatas', ba.data_lama_foto_pembatas!);

              resWork.files.add(multipartFile2);
            }

            if (ba.data_baru_foto_kwh_meter != 'null') {
              var multipartFile3 = await http.MultipartFile.fromPath(
                  'data_baru_foto_kwh_meter', ba.data_baru_foto_kwh_meter!);

              resWork.files.add(multipartFile3);
            }

            if (ba.data_baru_foto_pembatas != 'null') {
              var multipartFile4 = await http.MultipartFile.fromPath(
                  'data_baru_foto_pembatas', ba.data_baru_foto_pembatas!);

              resWork.files.add(multipartFile4);
            }

            if (ba.kwh_foto_sebelum != 'null') {
              var multipartFile5 = await http.MultipartFile.fromPath(
                  'kwh_foto_sebelum', ba.kwh_foto_sebelum!);

              resWork.files.add(multipartFile5);
            }

            if (ba.kwh_foto_sesudah != 'null') {
              var multipartFile6 = await http.MultipartFile.fromPath(
                  'kwh_foto_sesudah', ba.kwh_foto_sesudah!);

              resWork.files.add(multipartFile6);
            }

            if (ba.terminal_foto_sebelum != 'null') {
              var multipartFile7 = await http.MultipartFile.fromPath(
                  'terminal_foto_sebelum', ba.terminal_foto_sebelum!);

              resWork.files.add(multipartFile7);
            }

            if (ba.terminal_foto_sesudah != 'null') {
              var multipartFile8 = await http.MultipartFile.fromPath(
                  'terminal_foto_sesudah', ba.terminal_foto_sesudah!);

              resWork.files.add(multipartFile8);
            }

            if (ba.pelindung_kwh_foto_sebelum != 'null') {
              var multipartFile9 = await http.MultipartFile.fromPath(
                  'pelindung_kwh_foto_sebelum', ba.pelindung_kwh_foto_sebelum!);

              resWork.files.add(multipartFile9);
            }

            if (ba.pelindung_kwh_foto_sesudah != 'null') {
              var multipartFile10 = await http.MultipartFile.fromPath(
                  'pelindung_kwh_foto_sesudah', ba.pelindung_kwh_foto_sesudah!);

              resWork.files.add(multipartFile10);
            }

            if (ba.busbar_foto_sebelum != 'null') {
              var multipartFile11 = await http.MultipartFile.fromPath(
                  'busbar_foto_sebelum', ba.busbar_foto_sebelum!);

              resWork.files.add(multipartFile11);
            }

            if (ba.busbar_foto_sesudah != 'null') {
              var multipartFile12 = await http.MultipartFile.fromPath(
                  'busbar_foto_sesudah', ba.busbar_foto_sesudah!);

              resWork.files.add(multipartFile12);
            }

            if (ba.papan_ok_foto_sebelum != 'null') {
              var multipartFile13 = await http.MultipartFile.fromPath(
                  'papan_ok_foto_sebelum', ba.papan_ok_foto_sebelum!);

              resWork.files.add(multipartFile13);
            }

            if (ba.papan_ok_foto_sesudah != 'null') {
              var multipartFile14 = await http.MultipartFile.fromPath(
                  'papan_ok_foto_sesudah', ba.papan_ok_foto_sesudah!);

              resWork.files.add(multipartFile14);
            }

            if (ba.mcb_foto_sebelum != 'null') {
              var multipartFile15 = await http.MultipartFile.fromPath(
                  'mcb_foto_sebelum', ba.mcb_foto_sebelum!);

              resWork.files.add(multipartFile15);
            }

            if (ba.mcb_foto_sesudah != 'null') {
              var multipartFile16 = await http.MultipartFile.fromPath(
                  'mcb_foto_sesudah', ba.mcb_foto_sesudah!);

              resWork.files.add(multipartFile16);
            }

            if (ba.pemeriksaan_foto_sebelum != 'null') {
              var multipartFile17 = await http.MultipartFile.fromPath(
                  'pemeriksaan_foto_sebelum', ba.pemeriksaan_foto_sebelum!);

              resWork.files.add(multipartFile17);
            }

            if (ba.wiring_foto != 'null') {
              var multipartFile18 = await http.MultipartFile.fromPath(
                  'wiring_foto', ba.wiring_foto!);

              resWork.files.add(multipartFile18);
            }

            if (ba.akhir_foto_barang_bukti != 'null') {
              var multipartFile19 = await http.MultipartFile.fromPath(
                  'akhir_foto_barang_bukti', ba.akhir_foto_barang_bukti!);

              resWork.files.add(multipartFile19);
            }

            if (ba.akhir_kesimpulan_video != 'null') {
              var multipartFile25 = await http.MultipartFile.fromPath(
                  'kesimpulan_video', ba.akhir_kesimpulan_video!);

              resWork.files.add(multipartFile25);
            }

            var response = await resWork.send();

            print(response.statusCode);

            if (response.statusCode == 200) {
              String responseBody = await response.stream.bytesToString();

              var data = jsonDecode(responseBody);
            }
          }
          ;

          PengambilanModel bb = await searchFormPengambilan(listItem.works_id!);

          final resBb = http.MultipartRequest(
              "POST", Uri.parse('$baseUrl/barang-bukti'))
            ..headers["Content-Type"] = "application/json"
            ..headers["Authorization"] = "Bearer $token"
            ..fields['works_id'] = work_id.toString()
            ..fields['nama_saksi'] = bb.nama_saksi.toString()
            ..fields['nomor_identitas'] = bb.nomor_identitas.toString()
            ..fields['no_telpon_saksi'] = bb.no_telpon_saksi.toString()
            ..fields['kabel_jenis'] = bb.kabel_jenis.toString()
            ..fields['kabel_panjang'] = bb.kabel_panjang.toString()
            ..fields['segel_tera'] = bb.segel_tera.toString()
            ..fields['segel_terminal'] = bb.segel_terminal.toString()
            ..fields['segel_box_ok'] = bb.segel_box_ok.toString()
            ..fields['segel_box_app'] = bb.segel_box_app.toString()
            ..fields['segel_alat_pembatas'] = bb.segel_alat_pembatas.toString()
            ..fields['segel_alat_bantu_ukur'] =
                bb.segel_alat_bantu_ukur.toString();

          if (bb.foto_identitas != null) {
            var multipartFile = await http.MultipartFile.fromPath(
                'foto_identitas', bb.foto_identitas!);

            resBb.files.add(multipartFile);
          }

          if (bb.segel_foto != null) {
            var multipartFile1 =
                await http.MultipartFile.fromPath('segel_foto', bb.segel_foto!);

            resBb.files.add(multipartFile1);
          }

          var response = await resBb.send();
          print('test');
          print(response.statusCode);
          print('test');

          if (response.statusCode == 200) {
            String responseBody = await response.stream.bytesToString();

            var data = jsonDecode(responseBody);
          }
        }
      }

      // //// batas
      // var delete = await _database!.rawDelete("Delete from $table");
      // var delete_form_langsung =
      //     await _database!.rawDelete("Delete from $table_form_langsungs");
      // var delete_form_tidak_langsung =
      //     await _database!.rawDelete("Delete from $table_form_tidak_langsungs");

      final res = await http.post(
        Uri.parse('$baseUrl/work-order/regu'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'regus_id': regus_id,
        },
      );

      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body)['data'].length; i++) {
          int wo = await searchWork(jsonDecode(res.body)['data'][i]['id']);

          if (wo == 1) {
            final data =
                await updateWorkOrder(jsonDecode(res.body)['data'][i]['id'], {
              'works_id': jsonDecode(res.body)['data'][i]['id'],
              'id_pelanggan': jsonDecode(res.body)['data'][i]['id_pelanggan'],
              'nama_pelanggan': jsonDecode(res.body)['data'][i]
                  ['nama_pelanggan'],
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
              // 'image': jsonDecode(res.body)['data'][i]['image'],
              // 'video': jsonDecode(res.body)['data'][i]['video'],
              'labor': jsonDecode(res.body)['data'][i]['labor'],
              'createdAt': DateTime.now().toIso8601String().split('T').first,
            });
          } else {
            final data = await _database!.insert(table, {
              'works_id': jsonDecode(res.body)['data'][i]['id'],
              'id_pelanggan': jsonDecode(res.body)['data'][i]['id_pelanggan'],
              'nama_pelanggan': jsonDecode(res.body)['data'][i]
                  ['nama_pelanggan'],
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
              // 'image': jsonDecode(res.body)['data'][i]['image'],
              // 'video': jsonDecode(res.body)['data'][i]['video'],
              'labor': jsonDecode(res.body)['data'][i]['labor'],
              'createdAt': DateTime.now().toIso8601String().split('T').first,
            });
          }
        }
        return 1;
      }

      return 0;
    }

    if (roles == "LABOR") {
      final data = await _database!.query(table);

      if (data.length != 0) {
        List<WorkModel> result =
            data.map((e) => WorkModel.fromJson(e)).toList();

        for (int index = 0; index < result.length; index++) {
          WorkModel listItem = result[index];

          KalibrasiModel kalibrasi =
              await searchFormKalibrasi(listItem.works_id!);

          final resWork = http.MultipartRequest(
              "POST", Uri.parse('$baseUrl/new-kalibrasi'))
            ..headers["Content-Type"] = "application/json"
            ..headers["Authorization"] = "Bearer $token"
            ..fields['works_id'] = listItem.works_id.toString()
            ..fields['nama_saksi'] = kalibrasi.nama_saksi.toString()
            ..fields['alamat_saksi'] = kalibrasi.alamat_saksi.toString()
            ..fields['nomor_identitas_saksi'] =
                kalibrasi.nomor_identitas.toString()
            ..fields['pekerjaan'] = kalibrasi.pekerjaan.toString()
            ..fields['no_telpon_saksi'] = kalibrasi.no_telpon_saksi.toString()
            ..fields['kwh_merk'] = kalibrasi.kwh_merk.toString()
            ..fields['kwh_no_reg'] = kalibrasi.kwh_no_reg.toString()
            ..fields['kwh_no_seri'] = kalibrasi.kwh_no_seri.toString()
            ..fields['kwh_tahun_pembuatan'] =
                kalibrasi.kwh_tahun_pembuatan.toString()
            ..fields['kwh_konstanta'] = kalibrasi.kwh_konstanta.toString()
            ..fields['kwh_class'] = kalibrasi.kwh_class.toString()
            ..fields['kwh_rating_arus'] = kalibrasi.kwh_rating_arus.toString()
            ..fields['kwh_tegangan_nominal'] =
                kalibrasi.kwh_tegangan_nominal.toString()
            ..fields['kwh_stand_kwh'] = kalibrasi.kwh_stand_kwh.toString()
            ..fields['kwh_keterangan'] = kalibrasi.kwh_keterangan.toString()
            ..fields['posisi_atas_a'] = kalibrasi.posisi_atas_a.toString()
            ..fields['posisi_atas_b'] = kalibrasi.posisi_atas_b.toString()
            ..fields['posisi_atas_c'] = kalibrasi.posisi_atas_c.toString()
            ..fields['posisi_kanan_a'] = kalibrasi.posisi_kanan_a.toString()
            ..fields['posisi_kanan_b'] = kalibrasi.posisi_kanan_b.toString()
            ..fields['posisi_kanan_c'] = kalibrasi.posisi_kanan_c.toString()
            ..fields['posisi_kiri_a'] = kalibrasi.posisi_kiri_a.toString()
            ..fields['posisi_kiri_b'] = kalibrasi.posisi_kiri_b.toString()
            ..fields['posisi_kiri_c'] = kalibrasi.posisi_kiri_c.toString()
            ..fields['uji_tegangan_100'] = kalibrasi.uji_tegangan_100.toString()
            ..fields['uji_arus_100'] = kalibrasi.uji_arus_100.toString()
            ..fields['uji_nilai_akurasi_100'] =
                kalibrasi.uji_nilai_akurasi_100.toString()
            ..fields['uji_keterangan_100'] =
                kalibrasi.uji_keterangan_100.toString()
            ..fields['uji_tegangan_50'] = kalibrasi.uji_tegangan_50.toString()
            ..fields['uji_arus_50'] = kalibrasi.uji_arus_50.toString()
            ..fields['uji_nilai_akurasi_50'] =
                kalibrasi.uji_nilai_akurasi_50.toString()
            ..fields['uji_keterangan_50'] =
                kalibrasi.uji_keterangan_50.toString()
            ..fields['uji_tegangan_5'] = kalibrasi.uji_tegangan_5.toString()
            ..fields['uji_arus_5'] = kalibrasi.uji_arus_5.toString()
            ..fields['uji_nilai_akurasi_5'] =
                kalibrasi.uji_nilai_akurasi_5.toString()
            ..fields['uji_keterangan_5'] = kalibrasi.uji_keterangan_5.toString()
            ..fields['uji_merk'] = kalibrasi.uji_merk.toString()
            ..fields['uji_type'] = kalibrasi.uji_type.toString()
            ..fields['uji_no_seri'] = kalibrasi.uji_no_seri.toString()
            ..fields['uji_kesimpulan'] = kalibrasi.uji_kesimpulan.toString();

          if (kalibrasi.foto_identitas != 'null') {
            var multipartFile = await http.MultipartFile.fromPath(
                'foto_identitas', kalibrasi.foto_identitas!);

            resWork.files.add(multipartFile);
          }

          if (kalibrasi.kwh_video != 'null') {
            var multipartFile2 = await http.MultipartFile.fromPath(
                "kwh_video", kalibrasi.kwh_video!);

            resWork.files.add(multipartFile2);
          }

          if (kalibrasi.posisi_video != 'null') {
            var multipartFile3 = await http.MultipartFile.fromPath(
                "posisi_video", kalibrasi.posisi_video!);

            resWork.files.add(multipartFile3);
          }

          if (kalibrasi.uji_video != 'null') {
            var multipartFile4 = await http.MultipartFile.fromPath(
                "uji_video", kalibrasi.uji_video!);

            resWork.files.add(multipartFile4);
          }

          var response = await resWork.send();
          if (response.statusCode == 200) {
            String responseBody = await response.stream.bytesToString();
            var data = jsonDecode(responseBody);
          }
        }
      }

      final res = await http.get(
        Uri.parse('$baseUrl/labor/work-order'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body)['data'].length; i++) {
          int wo = await searchWork(jsonDecode(res.body)['data'][i]['id']);

          if (wo == 1) {
            final data =
                await updateWorkOrder(jsonDecode(res.body)['data'][i]['id'], {
              'works_id': jsonDecode(res.body)['data'][i]['id'],
              'id_pelanggan': jsonDecode(res.body)['data'][i]['id_pelanggan'],
              'nama_pelanggan': jsonDecode(res.body)['data'][i]
                  ['nama_pelanggan'],
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
              // 'image': jsonDecode(res.body)['data'][i]['image'],
              // 'video': jsonDecode(res.body)['data'][i]['video'],
              'labor': jsonDecode(res.body)['data'][i]['labor'],
              'createdAt': DateTime.now().toIso8601String().split('T').first,
            });
          } else {
            final data = await _database!.insert(table, {
              'works_id': jsonDecode(res.body)['data'][i]['id'],
              'id_pelanggan': jsonDecode(res.body)['data'][i]['id_pelanggan'],
              'nama_pelanggan': jsonDecode(res.body)['data'][i]
                  ['nama_pelanggan'],
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
              // 'image': jsonDecode(res.body)['data'][i]['image'],
              // 'video': jsonDecode(res.body)['data'][i]['video'],
              'labor': jsonDecode(res.body)['data'][i]['labor'],
              'createdAt': DateTime.now().toIso8601String().split('T').first,
            });
          }
        }
        return 1;
      }
    }

    return 0;

    // if (roles == 'LABOR') {
    //   final res = await http.get(
    //     Uri.parse('$baseUrl/labor/work-order'),
    //     headers: {
    //       'Authorization': 'Bearer $token',
    //     },
    //   );

    //   if (res.statusCode == 200) {
    //     for (int i = 0; i < jsonDecode(res.body)['data'].length; i++) {
    //       final data = await _database!.insert(table, {
    //         'works_id': jsonDecode(res.body)['data'][i]['id'],
    //         'id_pelanggan': jsonDecode(res.body)['data'][i]['id_pelanggan'],
    //         'nama_pelanggan': jsonDecode(res.body)['data'][i]['nama_pelanggan'],
    //         'latitude': jsonDecode(res.body)['data'][i]['latitude'],
    //         'longitude': jsonDecode(res.body)['data'][i]['longitude'],
    //         'alamat': jsonDecode(res.body)['data'][i]['alamat'],
    //         'jenis_p2tl': jsonDecode(res.body)['data'][i]['jenis_p2tl'],
    //         'tarif': jsonDecode(res.body)['data'][i]['tarif'],
    //         'daya': jsonDecode(res.body)['data'][i]['daya'],
    //         'rbm': jsonDecode(res.body)['data'][i]['rbm'],
    //         'lgkh': jsonDecode(res.body)['data'][i]['lgkh'],
    //         'fkm': jsonDecode(res.body)['data'][i]['fkm'],
    //         'keterangan_p2tl': jsonDecode(res.body)['data'][i]
    //             ['keterangan_p2tl'],
    //         'status': jsonDecode(res.body)['data'][i]['status'],
    //         'surat_tugas_p2tl': jsonDecode(res.body)['data'][i]
    //             ['surat_tugas_p2tl'],
    //         'tanggal_surat_tugas_p2tl': jsonDecode(res.body)['data'][i]
    //             ['tanggal_surat_tugas_p2tl'],
    //         'surat_tugas_tni': jsonDecode(res.body)['data'][i]
    //             ['surat_tugas_tni'],
    //         'tanggal_surat_tugas_tni': jsonDecode(res.body)['data'][i]
    //             ['tanggal_surat_tugas_tni'],
    //         'komentar': jsonDecode(res.body)['data'][i]['komentar'],
    //         'P1': jsonDecode(res.body)['data'][i]['P1'],
    //         'P2': jsonDecode(res.body)['data'][i]['P2'],
    //         'P3': jsonDecode(res.body)['data'][i]['P3'],
    //         'P4': jsonDecode(res.body)['data'][i]['P4'],
    //         'P5': jsonDecode(res.body)['data'][i]['P5'],
    //         'P6': jsonDecode(res.body)['data'][i]['P6'],
    //         'P7': jsonDecode(res.body)['data'][i]['P7'],
    //         'P8': jsonDecode(res.body)['data'][i]['P8'],
    //         'P9': jsonDecode(res.body)['data'][i]['P9'],
    //         'P10': jsonDecode(res.body)['data'][i]['P10'],
    //         'image': jsonDecode(res.body)['data'][i]['image'],
    //         'video': jsonDecode(res.body)['data'][i]['video'],
    //         'labor': jsonDecode(res.body)['data'][i]['labor'],
    //         'createdAt': DateTime.now().toIso8601String().split('T').first,
    //       });
    //     }
    //     return 1;
    //   }
    // }
    // return 0;
  }
}
