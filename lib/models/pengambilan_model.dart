class PengambilanModel {
  int? id;
  int? works_id;
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
