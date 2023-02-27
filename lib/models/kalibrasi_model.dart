class KalibrasiModel {
  int? id;
  int? works_id;
  String? nama_saksi;
  String? alamat_saksi;
  String? nomor_identitas;
  String? pekerjaan;
  String? no_telpon_saksi;
  String? foto_identitas;
  String? kwh_merk;
  String? kwh_no_reg;
  String? kwh_no_seri;
  String? kwh_tahun_pembuatan;
  String? kwh_class;
  String? kwh_konstanta;
  String? kwh_rating_arus;
  String? kwh_tegangan_nominal;
  String? kwh_stand_kwh;
  String? kwh_keterangan;
  String? kwh_video;
  String? posisi_atas_a;
  String? posisi_atas_b;
  String? posisi_atas_c;
  String? posisi_kanan_a;
  String? posisi_kanan_b;
  String? posisi_kanan_c;
  String? posisi_kiri_a;
  String? posisi_kiri_b;
  String? posisi_kiri_c;
  String? posisi_video;
  String? uji_tegangan_100;
  String? uji_arus_100;
  String? uji_nilai_akurasi_100;
  String? uji_keterangan_100;
  String? uji_tegangan_50;
  String? uji_arus_50;
  String? uji_nilai_akurasi_50;
  String? uji_keterangan_50;
  String? uji_tegangan_5;
  String? uji_arus_5;
  String? uji_nilai_akurasi_5;
  String? uji_keterangan_5;
  String? uji_merk;
  String? uji_type;
  String? uji_no_seri;
  String? uji_kesimpulan;
  String? uji_video;

  KalibrasiModel({
    this.id,
    this.works_id,
    this.nama_saksi,
    this.alamat_saksi,
    this.nomor_identitas,
    this.pekerjaan,
    this.no_telpon_saksi,
    this.foto_identitas,
    this.kwh_merk,
    this.kwh_no_reg,
    this.kwh_no_seri,
    this.kwh_tahun_pembuatan,
    this.kwh_konstanta,
    this.kwh_class,
    this.kwh_rating_arus,
    this.kwh_tegangan_nominal,
    this.kwh_stand_kwh,
    this.kwh_keterangan,
    this.kwh_video,
    this.posisi_atas_a,
    this.posisi_atas_b,
    this.posisi_atas_c,
    this.posisi_kanan_a,
    this.posisi_kanan_b,
    this.posisi_kanan_c,
    this.posisi_kiri_a,
    this.posisi_kiri_b,
    this.posisi_kiri_c,
    this.posisi_video,
    this.uji_tegangan_100,
    this.uji_arus_100,
    this.uji_nilai_akurasi_100,
    this.uji_keterangan_100,
    this.uji_tegangan_50,
    this.uji_arus_50,
    this.uji_nilai_akurasi_50,
    this.uji_keterangan_50,
    this.uji_tegangan_5,
    this.uji_arus_5,
    this.uji_nilai_akurasi_5,
    this.uji_keterangan_5,
    this.uji_merk,
    this.uji_type,
    this.uji_no_seri,
    this.uji_kesimpulan,
    this.uji_video,
  });

  KalibrasiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    works_id = json['works_id'];
    nama_saksi = json['nama_saksi'].toString();
    alamat_saksi = json['alamat_saksi'].toString();
    nomor_identitas = json['nomor_identitas'].toString();
    pekerjaan = json['pekerjaan'].toString();
    no_telpon_saksi = json['no_telpon_saksi'].toString();
    foto_identitas = json['foto_identitas'].toString();
    kwh_merk = json['kwh_merk'].toString();
    kwh_no_reg = json['kwh_no_reg'].toString();
    kwh_no_seri = json['kwh_no_seri'].toString();
    kwh_tahun_pembuatan = json['kwh_tahun_pembuatan'].toString();
    kwh_konstanta = json['kwh_konstanta'].toString();
    kwh_class = json['kwh_class'].toString();
    kwh_rating_arus = json['kwh_rating_arus'].toString();
    kwh_tegangan_nominal = json['kwh_tegangan_nominal'].toString();
    kwh_stand_kwh = json['kwh_stand_kwh'].toString();
    kwh_keterangan = json['kwh_keterangan'].toString();
    kwh_video = json['kwh_video'].toString();
    posisi_atas_a = json['posisi_atas_a'].toString();
    posisi_atas_b = json['posisi_atas_b'].toString();
    posisi_atas_c = json['posisi_atas_c'].toString();
    posisi_kanan_a = json['posisi_kanan_a'].toString();
    posisi_kanan_b = json['posisi_kanan_b'].toString();
    posisi_kanan_c = json['posisi_kanan_c'].toString();
    posisi_kiri_a = json['posisi_kiri_a'].toString();
    posisi_kiri_b = json['posisi_kiri_b'].toString();
    posisi_kiri_c = json['posisi_kiri_c'].toString();
    posisi_video = json['posisi_video'].toString();
    uji_tegangan_100 = json['uji_tegangan_100'].toString();
    uji_arus_100 = json['uji_arus_100'].toString();
    uji_nilai_akurasi_100 = json['uji_nilai_akurasi_100'].toString();
    uji_keterangan_100 = json['uji_keterangan_100'].toString();
    uji_tegangan_50 = json['uji_tegangan_50'].toString();
    uji_arus_50 = json['uji_arus_50'].toString();
    uji_nilai_akurasi_50 = json['uji_nilai_akurasi_50'].toString();
    uji_keterangan_50 = json['uji_keterangan_50'].toString();
    uji_tegangan_5 = json['uji_tegangan_5'].toString();
    uji_arus_5 = json['uji_arus_5'].toString();
    uji_nilai_akurasi_5 = json['uji_nilai_akurasi_5'].toString();
    uji_keterangan_5 = json['uji_keterangan_5'].toString();
    uji_merk = json['uji_merk'].toString();
    uji_type = json['uji_type'].toString();
    uji_no_seri = json['uji_no_seri'].toString();
    uji_kesimpulan = json['uji_kesimpulan'].toString();
    uji_video = json['uji_video'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['works_id'] = works_id;
    data['nama_saksi'] = nama_saksi;
    data['alamat_saksi'] = alamat_saksi;
    data['nomor_identitas'] = nomor_identitas;
    data['pekerjaan'] = pekerjaan;
    data['no_telpon_saksi'] = no_telpon_saksi;
    data['foto_identitas'] = foto_identitas;
    data['kwh_merk'] = kwh_merk;
    data['kwh_no_reg'] = kwh_no_reg;
    data['kwh_no_seri'] = kwh_no_seri;
    data['kwh_tahun_pembuatan'] = kwh_tahun_pembuatan;
    data['kwh_class'] = kwh_class;
    data['kwh_konstanta'] = kwh_konstanta;
    data['kwh_rating_arus'] = kwh_rating_arus;
    data['kwh_tegangan_nominal'] = kwh_tegangan_nominal;
    data['kwh_stand_kwh'] = kwh_stand_kwh;
    data['kwh_keterangan'] = kwh_keterangan;
    data['kwh_video'] = kwh_video;
    data['posisi_atas_a'] = posisi_atas_a;
    data['posisi_atas_b'] = posisi_atas_b;
    data['posisi_atas_c'] = posisi_atas_c;
    data['posisi_kanan_a'] = posisi_kanan_a;
    data['posisi_kanan_b'] = posisi_kanan_b;
    data['posisi_kanan_c'] = posisi_kanan_c;
    data['posisi_kiri_a'] = posisi_kiri_a;
    data['posisi_kiri_b'] = posisi_kiri_b;
    data['posisi_kiri_c'] = posisi_kiri_c;
    data['posisi_video'] = posisi_video;
    data['uji_tegangan_100'] = uji_tegangan_100;
    data['uji_arus_100'] = uji_arus_100;
    data['uji_nilai_akurasi_100'] = uji_nilai_akurasi_100;
    data['uji_keterangan_100'] = uji_keterangan_100;
    data['uji_tegangan_50'] = uji_tegangan_50;
    data['uji_arus_50'] = uji_arus_50;
    data['uji_nilai_akurasi_50'] = uji_nilai_akurasi_50;
    data['uji_keterangan_50'] = uji_keterangan_50;
    data['uji_tegangan_5'] = uji_tegangan_5;
    data['uji_arus_5'] = uji_arus_5;
    data['uji_nilai_akurasi_5'] = uji_nilai_akurasi_5;
    data['uji_keterangan_5'] = uji_keterangan_5;
    data['uji_merk'] = uji_merk;
    data['uji_type'] = uji_type;
    data['uji_no_seri'] = uji_no_seri;
    data['uji_kesimpulan'] = uji_kesimpulan;
    data['uji_video'] = uji_video;

    return data;
  }
}
