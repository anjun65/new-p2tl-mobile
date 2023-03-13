class LangsungModel {
  int? id;
  int? works_id;
  String? nama_saksi;
  String? alamat_saksi;
  String? nomor_identitas;
  String? pekerjaan;
  String? no_telpon_saksi;
  String? file_nomor_identitas;
  String? data_lama_merk;
  String? data_lama_no_reg;
  String? data_lama_no_seri;
  String? data_lama_tahun_pembuatan;
  String? data_lama_class;
  String? data_lama_konstanta;
  String? data_lama_rating_arus;
  String? data_lama_tegangan_nominal;
  String? data_lama_stand_kwh_meter;
  String? data_lama_jenis_pembatas;
  String? data_lama_alat_pembatas_merk;
  String? data_lama_rating_arus_2;
  String? data_lama_foto_kwh_meter;
  String? data_lama_foto_pembatas;
  String? data_baru_merk;
  String? data_baru_no_reg;
  String? data_baru_no_seri;
  String? data_baru_tahun_pembuatan;
  String? data_baru_class;
  String? data_baru_konstanta;
  String? data_baru_rating_arus;
  String? data_baru_tegangan_nominal;
  String? data_baru_stand_kwh_meter;
  String? data_baru_jenis_pembatas;
  String? data_baru_alat_pembatas_merk;
  String? data_baru_rating_arus_2;
  String? data_baru_foto_kwh_meter;
  String? data_baru_foto_pembatas;
  String? kwh_peralatan;
  String? kwh_segel;
  String? kwh_nomor_tahun_kode_segel;
  String? kwh_keterangan;
  String? kwh_foto_sebelum;
  String? kwh_post_peralatan;
  String? kwh_post_segel;
  String? kwh_post_nomor_tahun_kode_segel;
  String? kwh_foto_sesudah;
  String? terminal_peralatan;
  String? terminal_segel;
  String? terminal_nomor_tahun_kode_segel;
  String? terminal_keterangan;
  String? terminal_foto_sebelum;
  String? terminal_post_peralatan;
  String? terminal_post_segel;
  String? terminal_post_nomor_tahun_kode_segel;
  String? terminal_foto_sesudah;
  String? pelindung_kwh_peralatan;
  String? pelindung_kwh_segel;
  String? pelindung_kwh_nomor_tahun_kode_segel;
  String? pelindung_kwh_keterangan;
  String? pelindung_kwh_foto_sebelum;
  String? pelindung_kwh_post_peralatan;
  String? pelindung_kwh_post_segel;
  String? pelindung_kwh_post_nomor_tahun_kode_segel;
  String? pelindung_kwh_foto_sesudah;
  String? busbar_peralatan;
  String? busbar_segel;
  String? busbar_nomor_tahun_kode_segel;
  String? busbar_keterangan;
  String? busbar_foto_sebelum;
  String? busbar_post_peralatan;
  String? busbar_post_segel;
  String? busbar_post_nomor_tahun_kode_segel;
  String? busbar_foto_sesudah;
  String? papan_ok_peralatan;
  String? papan_ok_segel;
  String? papan_ok_nomor_tahun_kode_segel;
  String? papan_ok_keterangan;
  String? papan_ok_foto_sebelum;
  String? papan_ok_post_peralatan;
  String? papan_ok_post_segel;
  String? papan_ok_post_nomor_tahun_kode_segel;
  String? papan_ok_foto_sesudah;
  String? mcb_peralatan;
  String? mcb_segel;
  String? mcb_nomor_tahun_kode_segel;
  String? mcb_keterangan;
  String? mcb_foto_sebelum;
  String? mcb_post_peralatan;
  String? mcb_post_segel;
  String? mcb_post_nomor_tahun_kode_segel;
  String? mcb_foto_sesudah;
  String? pemeriksaan_keterangan;
  String? pemeriksaan_arus_1;
  String? pemeriksaan_arus_2;
  String? pemeriksaan_arus_3;
  String? pemeriksaan_arus_netral;
  String? pemeriksaan_voltase_netral_1;
  String? pemeriksaan_voltase_netral_2;
  String? pemeriksaan_voltase_netral_3;
  String? pemeriksaan_voltase_phase_1;
  String? pemeriksaan_voltase_phase_2;
  String? pemeriksaan_voltase_phase_3;
  String? pemeriksaan_cos_1;
  String? pemeriksaan_cos_2;
  String? pemeriksaan_cos_3;
  String? pemeriksaan_akurasi;
  String? pemeriksaan_foto_sebelum;
  String? wiring_terminal1;
  String? wiring_terminal2;
  String? wiring_terminal3;
  String? wiring_terminal4;
  String? wiring_terminal5;
  String? wiring_terminal6;
  String? wiring_terminal7;
  String? wiring_terminal8;
  String? wiring_terminal9;
  String? wiring_terminal11;
  String? wiring_keterangan_wiring_app;
  String? wiring_foto;
  String? akhir_hasil_pemeriksaan;
  String? akhir_kesimpulan;
  String? akhir_tindakan;
  String? akhir_barang_bukti;
  String? akhir_tanggal_penyelesaian;
  String? akhir_foto_barang_bukti;
  String? akhir_labor;
  String? akhir_kesimpulan_video;
  String? akhir_temuan;

  LangsungModel({
    this.id,
    this.works_id,
    this.nama_saksi,
    this.alamat_saksi,
    this.nomor_identitas,
    this.pekerjaan,
    this.no_telpon_saksi,
    this.file_nomor_identitas,
    this.data_lama_merk,
    this.data_lama_no_reg,
    this.data_lama_no_seri,
    this.data_lama_tahun_pembuatan,
    this.data_lama_class,
    this.data_lama_konstanta,
    this.data_lama_rating_arus,
    this.data_lama_tegangan_nominal,
    this.data_lama_stand_kwh_meter,
    this.data_lama_jenis_pembatas,
    this.data_lama_alat_pembatas_merk,
    this.data_lama_rating_arus_2,
    this.data_lama_foto_kwh_meter,
    this.data_lama_foto_pembatas,
    this.data_baru_merk,
    this.data_baru_no_reg,
    this.data_baru_no_seri,
    this.data_baru_tahun_pembuatan,
    this.data_baru_class,
    this.data_baru_konstanta,
    this.data_baru_rating_arus,
    this.data_baru_tegangan_nominal,
    this.data_baru_stand_kwh_meter,
    this.data_baru_jenis_pembatas,
    this.data_baru_alat_pembatas_merk,
    this.data_baru_rating_arus_2,
    this.data_baru_foto_kwh_meter,
    this.data_baru_foto_pembatas,
    this.kwh_peralatan,
    this.kwh_segel,
    this.kwh_nomor_tahun_kode_segel,
    this.kwh_keterangan,
    this.kwh_foto_sebelum,
    this.kwh_post_peralatan,
    this.kwh_post_segel,
    this.kwh_post_nomor_tahun_kode_segel,
    this.kwh_foto_sesudah,
    this.terminal_peralatan,
    this.terminal_segel,
    this.terminal_nomor_tahun_kode_segel,
    this.terminal_keterangan,
    this.terminal_foto_sebelum,
    this.terminal_post_peralatan,
    this.terminal_post_segel,
    this.terminal_post_nomor_tahun_kode_segel,
    this.terminal_foto_sesudah,
    this.pelindung_kwh_peralatan,
    this.pelindung_kwh_segel,
    this.pelindung_kwh_nomor_tahun_kode_segel,
    this.pelindung_kwh_keterangan,
    this.pelindung_kwh_foto_sebelum,
    this.pelindung_kwh_post_peralatan,
    this.pelindung_kwh_post_segel,
    this.pelindung_kwh_post_nomor_tahun_kode_segel,
    this.pelindung_kwh_foto_sesudah,
    this.busbar_peralatan,
    this.busbar_segel,
    this.busbar_nomor_tahun_kode_segel,
    this.busbar_keterangan,
    this.busbar_foto_sebelum,
    this.busbar_post_peralatan,
    this.busbar_post_segel,
    this.busbar_post_nomor_tahun_kode_segel,
    this.busbar_foto_sesudah,
    this.papan_ok_peralatan,
    this.papan_ok_segel,
    this.papan_ok_nomor_tahun_kode_segel,
    this.papan_ok_keterangan,
    this.papan_ok_foto_sebelum,
    this.papan_ok_post_peralatan,
    this.papan_ok_post_segel,
    this.papan_ok_post_nomor_tahun_kode_segel,
    this.papan_ok_foto_sesudah,
    this.mcb_peralatan,
    this.mcb_segel,
    this.mcb_nomor_tahun_kode_segel,
    this.mcb_keterangan,
    this.mcb_foto_sebelum,
    this.mcb_post_peralatan,
    this.mcb_post_segel,
    this.mcb_post_nomor_tahun_kode_segel,
    this.mcb_foto_sesudah,
    this.pemeriksaan_keterangan,
    this.pemeriksaan_arus_1,
    this.pemeriksaan_arus_2,
    this.pemeriksaan_arus_3,
    this.pemeriksaan_arus_netral,
    this.pemeriksaan_voltase_netral_1,
    this.pemeriksaan_voltase_netral_2,
    this.pemeriksaan_voltase_netral_3,
    this.pemeriksaan_voltase_phase_1,
    this.pemeriksaan_voltase_phase_2,
    this.pemeriksaan_voltase_phase_3,
    this.pemeriksaan_cos_1,
    this.pemeriksaan_cos_2,
    this.pemeriksaan_cos_3,
    this.pemeriksaan_akurasi,
    this.pemeriksaan_foto_sebelum,
    this.wiring_terminal1,
    this.wiring_terminal2,
    this.wiring_terminal3,
    this.wiring_terminal4,
    this.wiring_terminal5,
    this.wiring_terminal6,
    this.wiring_terminal7,
    this.wiring_terminal8,
    this.wiring_terminal9,
    this.wiring_terminal11,
    this.wiring_keterangan_wiring_app,
    this.wiring_foto,
    this.akhir_hasil_pemeriksaan,
    this.akhir_kesimpulan,
    this.akhir_tindakan,
    this.akhir_barang_bukti,
    this.akhir_tanggal_penyelesaian,
    this.akhir_foto_barang_bukti,
    this.akhir_labor,
    this.akhir_kesimpulan_video,
    this.akhir_temuan,
  });

  LangsungModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    works_id = json['works_id'];
    nama_saksi = json['nama_saksi'].toString();
    alamat_saksi = json['alamat_saksi'].toString();
    nomor_identitas = json['nomor_identitas'].toString();
    pekerjaan = json['pekerjaan'].toString();
    no_telpon_saksi = json['no_telpon_saksi'].toString();
    file_nomor_identitas = json['file_nomor_identitas'].toString();
    data_lama_merk = json['data_lama_merk'].toString();
    data_lama_no_reg = json['data_lama_no_reg'].toString();
    data_lama_no_seri = json['data_lama_no_seri'].toString();
    data_lama_tahun_pembuatan = json['data_lama_tahun_pembuatan'].toString();
    data_lama_class = json['data_lama_class'].toString();
    data_lama_konstanta = json['data_lama_konstanta'].toString();
    data_lama_rating_arus = json['data_lama_rating_arus'].toString();
    data_lama_tegangan_nominal = json['data_lama_tegangan_nominal'].toString();
    data_lama_stand_kwh_meter = json['data_lama_stand_kwh_meter'].toString();
    data_lama_jenis_pembatas = json['data_lama_jenis_pembatas'].toString();
    data_lama_alat_pembatas_merk =
        json['data_lama_alat_pembatas_merk'].toString();
    data_lama_rating_arus_2 = json['data_lama_rating_arus_2'].toString();
    data_lama_foto_kwh_meter = json['data_lama_foto_kwh_meter'].toString();
    data_lama_foto_pembatas = json['data_lama_foto_pembatas'].toString();
    data_baru_merk = json['data_baru_merk'].toString();
    data_baru_no_reg = json['data_baru_no_reg'].toString();
    data_baru_no_seri = json['data_baru_no_seri'].toString();
    data_baru_tahun_pembuatan = json['data_baru_tahun_pembuatan'].toString();
    data_baru_class = json['data_baru_class'].toString();
    data_baru_konstanta = json['data_baru_konstanta'].toString();
    data_baru_rating_arus = json['data_baru_rating_arus'].toString();
    data_baru_tegangan_nominal = json['data_baru_tegangan_nominal'].toString();
    data_baru_stand_kwh_meter = json['data_baru_stand_kwh_meter'].toString();
    data_baru_jenis_pembatas = json['data_baru_jenis_pembatas'].toString();
    data_baru_alat_pembatas_merk =
        json['data_baru_alat_pembatas_merk'].toString();
    data_baru_rating_arus_2 = json['data_baru_rating_arus_2'].toString();
    data_baru_foto_kwh_meter = json['data_baru_foto_kwh_meter'].toString();
    data_baru_foto_pembatas = json['data_baru_foto_pembatas'].toString();
    kwh_peralatan = json['kwh_peralatan'].toString();
    kwh_segel = json['kwh_segel'].toString();
    kwh_nomor_tahun_kode_segel = json['kwh_nomor_tahun_kode_segel'].toString();
    kwh_keterangan = json['kwh_keterangan'].toString();
    kwh_foto_sebelum = json['kwh_foto_sebelum'].toString();
    kwh_post_peralatan = json['kwh_post_peralatan'].toString();
    kwh_post_segel = json['kwh_post_segel'].toString();
    kwh_post_nomor_tahun_kode_segel =
        json['kwh_post_nomor_tahun_kode_segel'].toString();
    kwh_foto_sesudah = json['kwh_foto_sesudah'].toString();
    terminal_peralatan = json['terminal_peralatan'].toString();
    terminal_segel = json['terminal_segel'].toString();
    terminal_nomor_tahun_kode_segel =
        json['terminal_nomor_tahun_kode_segel'].toString();
    terminal_keterangan = json['terminal_keterangan'].toString();
    terminal_foto_sebelum = json['terminal_foto_sebelum'].toString();
    terminal_post_peralatan = json['terminal_post_peralatan'].toString();
    terminal_post_segel = json['terminal_post_segel'].toString();
    terminal_post_nomor_tahun_kode_segel =
        json['terminal_post_nomor_tahun_kode_segel'].toString();
    terminal_foto_sesudah = json['terminal_foto_sesudah'].toString();
    pelindung_kwh_peralatan = json['pelindung_kwh_peralatan'].toString();
    pelindung_kwh_segel = json['pelindung_kwh_segel'].toString();
    pelindung_kwh_nomor_tahun_kode_segel =
        json['pelindung_kwh_nomor_tahun_kode_segel'].toString();
    pelindung_kwh_keterangan = json['pelindung_kwh_keterangan'].toString();
    pelindung_kwh_foto_sebelum = json['pelindung_kwh_foto_sebelum'].toString();
    pelindung_kwh_post_peralatan =
        json['pelindung_kwh_post_peralatan'].toString();
    pelindung_kwh_post_segel = json['pelindung_kwh_post_segel'].toString();
    pelindung_kwh_post_nomor_tahun_kode_segel =
        json['pelindung_kwh_post_nomor_tahun_kode_segel'].toString();
    pelindung_kwh_foto_sesudah = json['pelindung_kwh_foto_sesudah'].toString();
    busbar_peralatan = json['busbar_peralatan'].toString();
    busbar_segel = json['busbar_segel'].toString();
    busbar_nomor_tahun_kode_segel =
        json['busbar_nomor_tahun_kode_segel'].toString();
    busbar_keterangan = json['busbar_keterangan'].toString();
    busbar_foto_sebelum = json['busbar_foto_sebelum'].toString();
    busbar_post_peralatan = json['busbar_post_peralatan'].toString();
    busbar_post_segel = json['busbar_post_segel'].toString();
    busbar_post_nomor_tahun_kode_segel =
        json['busbar_post_nomor_tahun_kode_segel'].toString();
    busbar_foto_sesudah = json['busbar_foto_sesudah'].toString();
    papan_ok_peralatan = json['papan_ok_peralatan'].toString();
    papan_ok_segel = json['papan_ok_segel'].toString();
    papan_ok_nomor_tahun_kode_segel =
        json['papan_ok_nomor_tahun_kode_segel'].toString();
    papan_ok_keterangan = json['papan_ok_keterangan'].toString();
    papan_ok_foto_sebelum = json['papan_ok_foto_sebelum'].toString();
    papan_ok_post_peralatan = json['papan_ok_post_peralatan'].toString();
    papan_ok_post_segel = json['papan_ok_post_segel'].toString();
    papan_ok_post_nomor_tahun_kode_segel =
        json['papan_ok_post_nomor_tahun_kode_segel'].toString();
    papan_ok_foto_sesudah = json['papan_ok_foto_sesudah'].toString();
    mcb_peralatan = json['mcb_peralatan'].toString();
    mcb_segel = json['mcb_segel'].toString();
    mcb_nomor_tahun_kode_segel = json['mcb_nomor_tahun_kode_segel'].toString();
    mcb_keterangan = json['mcb_keterangan'].toString();
    mcb_foto_sebelum = json['mcb_foto_sebelum'].toString();
    mcb_post_peralatan = json['mcb_post_peralatan'].toString();
    mcb_post_segel = json['mcb_post_segel'].toString();
    mcb_post_nomor_tahun_kode_segel =
        json['mcb_post_nomor_tahun_kode_segel'].toString();
    mcb_foto_sesudah = json['mcb_foto_sesudah'].toString();
    pemeriksaan_keterangan = json['pemeriksaan_keterangan'].toString();
    pemeriksaan_arus_1 = json['pemeriksaan_arus_1'].toString();
    pemeriksaan_arus_2 = json['pemeriksaan_arus_2'].toString();
    pemeriksaan_arus_3 = json['pemeriksaan_arus_3'].toString();
    pemeriksaan_arus_netral = json['pemeriksaan_arus_netral'].toString();
    pemeriksaan_voltase_netral_1 =
        json['pemeriksaan_voltase_netral_1'].toString();
    pemeriksaan_voltase_netral_2 =
        json['pemeriksaan_voltase_netral_2'].toString();
    pemeriksaan_voltase_netral_3 =
        json['pemeriksaan_voltase_netral_3'].toString();
    pemeriksaan_voltase_phase_1 =
        json['pemeriksaan_voltase_phase_1'].toString();
    pemeriksaan_voltase_phase_2 =
        json['pemeriksaan_voltase_phase_2'].toString();
    pemeriksaan_voltase_phase_3 =
        json['pemeriksaan_voltase_phase_3'].toString();
    pemeriksaan_cos_1 = json['pemeriksaan_cos_1'].toString();
    pemeriksaan_cos_2 = json['pemeriksaan_cos_2'].toString();
    pemeriksaan_cos_3 = json['pemeriksaan_cos_3'].toString();
    pemeriksaan_akurasi = json['pemeriksaan_akurasi'].toString();
    pemeriksaan_foto_sebelum = json['pemeriksaan_foto_sebelum'].toString();
    wiring_terminal1 = json['wiring_terminal1'].toString();
    wiring_terminal2 = json['wiring_terminal2'].toString();
    wiring_terminal3 = json['wiring_terminal3'].toString();
    wiring_terminal4 = json['wiring_terminal4'].toString();
    wiring_terminal5 = json['wiring_terminal5'].toString();
    wiring_terminal6 = json['wiring_terminal6'].toString();
    wiring_terminal7 = json['wiring_terminal7'].toString();
    wiring_terminal8 = json['wiring_terminal8'].toString();
    wiring_terminal9 = json['wiring_terminal9'].toString();
    wiring_terminal11 = json['wiring_terminal11'].toString();
    wiring_keterangan_wiring_app =
        json['wiring_keterangan_wiring_app'].toString();
    wiring_foto = json['wiring_foto'].toString();
    akhir_hasil_pemeriksaan = json['akhir_hasil_pemeriksaan'].toString();
    akhir_kesimpulan = json['akhir_kesimpulan'].toString();
    akhir_tindakan = json['akhir_tindakan'].toString();
    akhir_barang_bukti = json['akhir_barang_bukti'].toString();
    akhir_tanggal_penyelesaian = json['akhir_tanggal_penyelesaian'].toString();
    akhir_foto_barang_bukti = json['akhir_foto_barang_bukti'].toString();
    akhir_labor = json['akhir_labor'].toString();
    akhir_kesimpulan_video = json['akhir_kesimpulan_video'].toString();
    akhir_temuan = json['akhir_temuan'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['works_id'] = works_id;
    data['nama_saksi'] = nama_saksi;
    data['alamat_saksi'] = alamat_saksi;
    data['nomor_identitas'] = nomor_identitas;
    data['no_telpon_saksi'] = no_telpon_saksi;
    data['file_nomor_identitas'] = file_nomor_identitas;
    data['data_lama_merk'] = data_lama_merk;
    data['data_lama_no_reg'] = data_lama_no_reg;
    data['data_lama_no_seri'] = data_lama_no_seri;
    data['data_lama_tahun_pembuatan'] = data_lama_tahun_pembuatan;
    data['data_lama_class'] = data_lama_class;
    data['data_lama_konstanta'] = data_lama_konstanta;
    data['data_lama_rating_arus'] = data_lama_rating_arus;
    data['data_lama_tegangan_nominal'] = data_lama_tegangan_nominal;
    data['data_lama_stand_kwh_meter'] = data_lama_stand_kwh_meter;
    data['data_lama_jenis_pembatas'] = data_lama_jenis_pembatas;
    data['data_lama_alat_pembatas_merk'] = data_lama_alat_pembatas_merk;
    data['data_lama_rating_arus_2'] = data_lama_rating_arus_2;
    data['data_lama_foto_kwh_meter'] = data_lama_foto_kwh_meter;
    data['data_lama_foto_pembatas'] = data_lama_foto_pembatas;
    data['data_baru_merk'] = data_baru_merk;
    data['data_baru_no_reg'] = data_baru_no_reg;
    data['data_baru_no_seri'] = data_baru_no_seri;
    data['data_baru_tahun_pembuatan'] = data_baru_tahun_pembuatan;
    data['data_baru_class'] = data_baru_class;
    data['data_baru_konstanta'] = data_baru_konstanta;
    data['data_baru_rating_arus'] = data_baru_rating_arus;
    data['data_baru_tegangan_nominal'] = data_baru_tegangan_nominal;
    data['data_baru_stand_kwh_meter'] = data_baru_stand_kwh_meter;
    data['data_baru_jenis_pembatas'] = data_baru_jenis_pembatas;
    data['data_baru_alat_pembatas_merk'] = data_baru_alat_pembatas_merk;
    data['data_baru_rating_arus_2'] = data_baru_rating_arus_2;
    data['data_baru_foto_kwh_meter'] = data_baru_foto_kwh_meter;
    data['data_baru_foto_pembatas'] = data_baru_foto_pembatas;
    data['kwh_peralatan'] = kwh_peralatan;
    data['kwh_segel'] = kwh_segel;
    data['kwh_nomor_tahun_kode_segel'] = kwh_nomor_tahun_kode_segel;
    data['kwh_keterangan'] = kwh_keterangan;
    data['kwh_foto_sebelum'] = kwh_foto_sebelum;
    data['kwh_post_peralatan'] = kwh_post_peralatan;
    data['kwh_post_segel'] = kwh_post_segel;
    data['kwh_post_nomor_tahun_kode_segel'] = kwh_post_nomor_tahun_kode_segel;
    data['kwh_foto_sesudah'] = kwh_foto_sesudah;
    data['terminal_peralatan'] = terminal_peralatan;
    data['terminal_segel'] = terminal_segel;
    data['terminal_nomor_tahun_kode_segel'] = terminal_nomor_tahun_kode_segel;
    data['terminal_keterangan'] = terminal_keterangan;
    data['terminal_foto_sebelum'] = terminal_foto_sebelum;
    data['terminal_post_peralatan'] = terminal_post_peralatan;
    data['terminal_post_segel'] = terminal_post_segel;
    data['terminal_post_nomor_tahun_kode_segel'] =
        terminal_post_nomor_tahun_kode_segel;
    data['terminal_foto_sesudah'] = terminal_foto_sesudah;
    data['pelindung_kwh_peralatan'] = pelindung_kwh_peralatan;
    data['pelindung_kwh_segel'] = pelindung_kwh_segel;
    data['pelindung_kwh_nomor_tahun_kode_segel'] =
        pelindung_kwh_nomor_tahun_kode_segel;
    data['pelindung_kwh_keterangan'] = pelindung_kwh_keterangan;
    data['pelindung_kwh_foto_sebelum'] = pelindung_kwh_foto_sebelum;
    data['pelindung_kwh_post_peralatan'] = pelindung_kwh_post_peralatan;
    data['pelindung_kwh_post_segel'] = pelindung_kwh_post_segel;
    data['pelindung_kwh_post_nomor_tahun_kode_segel'] =
        pelindung_kwh_post_nomor_tahun_kode_segel;
    data['pelindung_kwh_foto_sesudah'] = pelindung_kwh_foto_sesudah;
    data['busbar_peralatan'] = busbar_peralatan;
    data['busbar_segel'] = busbar_segel;
    data['busbar_nomor_tahun_kode_segel'] = busbar_nomor_tahun_kode_segel;
    data['busbar_keterangan'] = busbar_keterangan;
    data['busbar_foto_sebelum'] = busbar_foto_sebelum;
    data['busbar_post_peralatan'] = busbar_post_peralatan;
    data['busbar_post_segel'] = busbar_post_segel;
    data['busbar_post_nomor_tahun_kode_segel'] =
        busbar_post_nomor_tahun_kode_segel;
    data['busbar_foto_sesudah'] = busbar_foto_sesudah;
    data['papan_ok_peralatan'] = papan_ok_peralatan;
    data['papan_ok_segel'] = papan_ok_segel;
    data['papan_ok_nomor_tahun_kode_segel'] = papan_ok_nomor_tahun_kode_segel;
    data['papan_ok_keterangan'] = papan_ok_keterangan;
    data['papan_ok_foto_sebelum'] = papan_ok_foto_sebelum;
    data['papan_ok_post_peralatan'] = papan_ok_post_peralatan;
    data['papan_ok_post_segel'] = papan_ok_post_segel;
    data['papan_ok_post_nomor_tahun_kode_segel'] =
        papan_ok_post_nomor_tahun_kode_segel;
    data['papan_ok_foto_sesudah'] = papan_ok_foto_sesudah;
    data['mcb_peralatan'] = mcb_peralatan;
    data['mcb_segel'] = mcb_segel;
    data['mcb_nomor_tahun_kode_segel'] = mcb_nomor_tahun_kode_segel;
    data['mcb_keterangan'] = mcb_keterangan;
    data['mcb_foto_sebelum'] = mcb_foto_sebelum;
    data['mcb_post_peralatan'] = mcb_post_peralatan;
    data['mcb_post_segel'] = mcb_post_segel;
    data['mcb_post_nomor_tahun_kode_segel'] = mcb_post_nomor_tahun_kode_segel;
    data['mcb_foto_sesudah'] = mcb_foto_sesudah;
    data['pemeriksaan_arus_1'] = pemeriksaan_arus_1;
    data['pemeriksaan_arus_2'] = pemeriksaan_arus_2;
    data['pemeriksaan_arus_3'] = pemeriksaan_arus_3;
    data['pemeriksaan_arus_netral'] = pemeriksaan_arus_netral;
    data['pemeriksaan_voltase_netral_1'] = pemeriksaan_voltase_netral_1;
    data['pemeriksaan_voltase_netral_2'] = pemeriksaan_voltase_netral_2;
    data['pemeriksaan_voltase_netral_3'] = pemeriksaan_voltase_netral_3;
    data['pemeriksaan_voltase_phase_1'] = pemeriksaan_voltase_phase_1;
    data['pemeriksaan_voltase_phase_2'] = pemeriksaan_voltase_phase_2;
    data['pemeriksaan_voltase_phase_3'] = pemeriksaan_voltase_phase_3;
    data['pemeriksaan_cos_1'] = pemeriksaan_cos_1;
    data['pemeriksaan_cos_2'] = pemeriksaan_cos_2;
    data['pemeriksaan_cos_3'] = pemeriksaan_cos_3;
    data['pemeriksaan_akurasi'] = pemeriksaan_akurasi;
    data['pemeriksaan_foto_sebelum'] = pemeriksaan_foto_sebelum;
    data['wiring_terminal1'] = wiring_terminal1;
    data['wiring_terminal2'] = wiring_terminal2;
    data['wiring_terminal3'] = wiring_terminal3;
    data['wiring_terminal4'] = wiring_terminal4;
    data['wiring_terminal5'] = wiring_terminal5;
    data['wiring_terminal6'] = wiring_terminal6;
    data['wiring_terminal7'] = wiring_terminal7;
    data['wiring_terminal8'] = wiring_terminal8;
    data['wiring_terminal9'] = wiring_terminal9;
    data['wiring_terminal11'] = wiring_terminal11;
    data['wiring_keterangan_wiring_app'] = wiring_keterangan_wiring_app;
    data['wiring_foto'] = wiring_foto;
    data['akhir_hasil_pemeriksaan'] = akhir_hasil_pemeriksaan;
    data['akhir_kesimpulan'] = akhir_kesimpulan;
    data['akhir_tindakan'] = akhir_tindakan;
    data['akhir_barang_bukti'] = akhir_barang_bukti;
    data['akhir_tanggal_penyelesaian'] = akhir_tanggal_penyelesaian;
    data['akhir_foto_barang_bukti'] = akhir_foto_barang_bukti;
    data['akhir_labor'] = akhir_foto_barang_bukti;
    data['akhir_kesimpulan_video'] = akhir_kesimpulan_video;
    data['akhir_temuan'] = akhir_temuan;

    return data;
  }
}
