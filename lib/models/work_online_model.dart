class WorkOnlineModel {
  int? id;
  int? idPelanggan;
  String? namaPelanggan;
  String? latitude;
  String? longitude;
  String? alamat;
  String? jenis_p2tl;
  String? tarif;
  String? daya;
  String? rbm;
  String? lgkh;
  String? fkm;
  String? regus_id;
  String? keteranganP2tl;
  String? status;
  String? created_at;
  String? updated_at;
  String? surat_tugas_p2tl;
  String? tanggal_surat_tugas_p2tl;
  String? surat_tugas_tni;
  String? tanggal_surat_tugas_tni;
  String? pendamping1_id;
  String? pendamping2_id;
  String? status_pelanggaran;
  String? tanggal_inspeksi;
  String? jumlah_ts_rp;
  String? jumlah_ts_kwh;
  String? komentar;
  String? P1;
  String? P2;
  String? P3;
  String? P4;
  String? P5;
  String? P6;
  String? P7;
  String? P8;
  String? P9;
  String? P10;
  String? image;
  String? video;
  String? labor;

  WorkOnlineModel({
    this.id,
    this.idPelanggan,
    this.namaPelanggan,
    this.latitude,
    this.longitude,
    this.alamat,
    this.jenis_p2tl,
    this.tarif,
    this.daya,
    this.rbm,
    this.lgkh,
    this.fkm,
    this.regus_id,
    this.keteranganP2tl,
    this.status,
    this.created_at,
    this.updated_at,
    this.surat_tugas_p2tl,
    this.tanggal_surat_tugas_p2tl,
    this.surat_tugas_tni,
    this.tanggal_surat_tugas_tni,
    this.pendamping1_id,
    this.pendamping2_id,
    this.status_pelanggaran,
    this.tanggal_inspeksi,
    this.jumlah_ts_rp,
    this.jumlah_ts_kwh,
    this.komentar,
    this.P1,
    this.P2,
    this.P3,
    this.P4,
    this.P5,
    this.P6,
    this.P7,
    this.P8,
    this.P9,
    this.P10,
    this.image,
    this.video,
    this.labor,
  });

  WorkOnlineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPelanggan = int.parse(json['id_pelanggan']);
    namaPelanggan = json['nama_pelanggan'].toString();
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    alamat = json['alamat'].toString();
    jenis_p2tl = json['jenis_p2tl'].toString();
    tarif = json['tarif'].toString();
    daya = json['daya'].toString();
    rbm = json['rbm'].toString();
    lgkh = json['lgkh'].toString();
    fkm = json['fkm'].toString();
    regus_id = json['regus_id'].toString();
    keteranganP2tl = json['keterangan_p2tl'].toString();
    status = json['status'].toString();
    created_at = json['created_at'].toString();
    updated_at = json['updated_at'].toString();
    surat_tugas_p2tl = json['surat_tugas_p2tl'].toString();
    tanggal_surat_tugas_p2tl = json['tanggal_surat_tugas_p2tl'].toString();
    surat_tugas_tni = json['surat_tugas_tni'].toString();
    tanggal_surat_tugas_tni = json['tanggal_surat_tugas_tni'].toString();
    pendamping1_id = json['pendamping1_id'].toString();
    pendamping2_id = json['pendamping2_id'].toString();
    status_pelanggaran = json['status_pelanggaran'].toString();
    tanggal_inspeksi = json['tanggal_inspeksi'].toString();
    jumlah_ts_rp = json['jumlah_ts_rp'].toString();
    jumlah_ts_kwh = json['jumlah_ts_kwh'].toString();
    komentar = json['komentar'].toString();
    P1 = json['P1'].toString();
    P2 = json['P2'].toString();
    P3 = json['P3'].toString();
    P4 = json['P4'].toString();
    P5 = json['P5'].toString();
    P6 = json['P6'].toString();
    P7 = json['P7'].toString();
    P8 = json['P8'].toString();
    P9 = json['P9'].toString();
    P10 = json['P10'].toString();
    image = json['image'].toString();
    video = json['video'].toString();
    labor = json['labor'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idPelanggan': idPelanggan,
      'namaPelanggan': namaPelanggan,
      'latitude': latitude,
      'longitude': longitude,
      'alamat': alamat,
      'jenis_p2tl': jenis_p2tl,
      'tarif': tarif,
      'daya': daya,
      'rbm': rbm,
      'lgkh': lgkh,
      'fkm': fkm,
      'regus_id': regus_id,
      'keteranganP2tl': keteranganP2tl,
      'status': status,
      'created_at': created_at,
      'updated_at': updated_at,
      'surat_tugas_p2tl': surat_tugas_p2tl,
      'tanggal_surat_tugas_p2tl': tanggal_surat_tugas_p2tl,
      'surat_tugas_tni': surat_tugas_tni,
      'tanggal_surat_tugas_tni': tanggal_surat_tugas_tni,
      'pendamping1_id': pendamping1_id,
      'pendamping2_id': pendamping2_id,
      'status_pelanggaran': status_pelanggaran,
      'tanggal_inspeksi': tanggal_inspeksi,
      'jumlah_ts_rp': jumlah_ts_rp,
      'jumlah_ts_kwh': jumlah_ts_kwh,
      'komentar': komentar,
      'P1': P1,
      'P2': P2,
      'P3': P3,
      'P4': P4,
      'P5': P5,
      'P6': P6,
      'P7': P7,
      'P8': P8,
      'P9': P9,
      'P10': P10,
      'image': image,
      'video': video,
      'labor': labor,
    };
  }
}
