class StatusModel {
  int? sudah;
  int? belum;
  int? luar;
  int? dalam;

  StatusModel({
    this.sudah,
    this.belum,
    this.luar,
    this.dalam,
  });

  StatusModel.fromJson(Map<String, dynamic> json) {
    sudah = json['sudah'];
    belum = json['belum'];
    luar = json['luar'];
    dalam = json['dalam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sudah'] = sudah;
    data['belum'] = belum;
    data['luar'] = luar;
    data['dalam'] = dalam;

    return data;
  }
}
