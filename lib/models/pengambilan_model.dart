class PengambilanModel {
  int? id;
  int? works_id;
  String? nama_saksi;
  String? alamat_saksi;
  String? nomor_identitas;
  String? no_telpon_saksi;
  String? foto_identitas;
  String? kabel_jenis;
  String? kabel_panjang;
  String? segel_tera;
  String? segel_terminal;
  String? segel_box_ok;
  String? segel_box_app;
  String? segel_alat_pembatas;
  String? segel_alat_bantu_ukur;
  String? segel_foto;

  PengambilanModel({
    this.id,
    this.works_id,
    this.nama_saksi,
    this.alamat_saksi,
    this.nomor_identitas,
    this.no_telpon_saksi,
    this.foto_identitas,
    this.kabel_jenis,
    this.kabel_panjang,
    this.segel_tera,
    this.segel_terminal,
    this.segel_box_ok,
    this.segel_box_app,
    this.segel_alat_pembatas,
    this.segel_alat_bantu_ukur,
    this.segel_foto,
  });

  PengambilanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    works_id = json['works_id'];
    nama_saksi = json['nama_saksi'];
    alamat_saksi = json['alamat_saksi'];
    nomor_identitas = json['nomor_identitas'];
    no_telpon_saksi = json['no_telpon_saksi'];
    foto_identitas = json['foto_identitas'];
    kabel_jenis = json['kabel_jenis'].toString();
    kabel_panjang = json['kabel_panjang'].toString();
    segel_tera = json['segel_tera'].toString();
    segel_terminal = json['segel_terminal'].toString();
    segel_box_ok = json['segel_box_ok'].toString();
    segel_box_app = json['segel_box_app'].toString();
    segel_alat_pembatas = json['segel_alat_pembatas'].toString();
    segel_alat_bantu_ukur = json['segel_alat_bantu_ukur'].toString();
    segel_foto = json['segel_foto'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['works_id'] = works_id;
    data['nama_saksi'] = nama_saksi;
    data['alamat_saksi'] = alamat_saksi;
    data['nomor_identitas'] = nomor_identitas;
    data['no_telpon_saksi'] = no_telpon_saksi;
    data['foto_identitas'] = foto_identitas;
    data['kabel_jenis'] = kabel_jenis;
    data['kabel_panjang'] = kabel_panjang;
    data['segel_tera'] = segel_tera;
    data['segel_terminal'] = segel_terminal;
    data['segel_box_ok'] = segel_box_ok;
    data['segel_box_app'] = segel_box_app;
    data['segel_alat_pembatas'] = segel_alat_pembatas;
    data['segel_alat_bantu_ukur'] = segel_alat_bantu_ukur;
    data['segel_foto'] = segel_foto;

    return data;
  }
}
