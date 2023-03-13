import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/langsung_model.dart';
import 'package:p2tl/models/tidak_langsung_model.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_langsung/data_lama.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/image_show.dart';
import 'package:p2tl/ui/widgets/keterangan.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

import 'package:video_player/video_player.dart';

class LihatFormTidakLangsungPage extends StatefulWidget {
  final WorkModel work;
  final TidakLangsungModel? langsung;

  const LihatFormTidakLangsungPage(
      {Key? key, required this.work, this.langsung})
      : super(key: key);

  @override
  State<LihatFormTidakLangsungPage> createState() =>
      _LihatFormTidakLangsungPageState();
}

class _LihatFormTidakLangsungPageState
    extends State<LihatFormTidakLangsungPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.file(
        File(widget.langsung!.akhir_kesimpulan_video!))
      ..initialize().then((_) {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Target Operasi',
        ),
      ),
      body: Column(
        children: [
          CustomHeaderField(
              idPelanggan: widget.work.idPelanggan!,
              alamatPelanggan: widget.work.alamat!,
              namaPelanggan: widget.work.namaPelanggan!),
          const SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Saksi',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Nama Saksi',
                        content: widget.langsung!.nama_saksi ?? '-',
                      ),
                      CustomTextField(
                        title: 'Alamat Saksi',
                        content: widget.langsung!.alamat_saksi ?? '-',
                      ),
                      CustomTextField(
                        title: 'Nomor KTP/SIM',
                        content: widget.langsung!.nomor_identitas ?? '-',
                      ),
                      CustomTextField(
                        title: 'Pekerjaan',
                        content: widget.langsung!.pekerjaan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Nomor Telpon',
                        content: widget.langsung!.no_telpon_saksi ?? '-',
                      ),
                      Text(
                        'Data Bangunan',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextKeterangan(
                        title: 'Tegangan Tersambung',
                        content:
                            widget.langsung!.data_tegangan_tersambung ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Jenis Pengukuran',
                        content: widget.langsung!.data_jenis_pengukuran ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Tempat Kedudukan',
                        content: widget.langsung!.data_tempat_kedudukan ?? '-',
                      ),
                      Text(
                        'Data APP',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Alat Pembatas',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Jenis',
                        content: widget.langsung!.pembatas_jenis ?? '-',
                      ),
                      CustomTextField(
                        title: 'Merk/type',
                        content: widget.langsung!.pembatas_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'Rating Arus',
                        content: widget.langsung!.pembatas_rating_arus ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Alat Pembatas',
                        content: widget.langsung!.pembatas_foto_pembatas ?? '',
                      ),
                      Text(
                        'kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Merk/Type',
                        content: widget.langsung!.kwh_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'No. Register',
                        content: widget.langsung!.kwh_no_reg ?? '-',
                      ),
                      CustomTextField(
                        title: 'No. Seri',
                        content: widget.langsung!.kwh_no_reg ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tahun Buat',
                        content: widget.langsung!.kwh_tahun ?? '-',
                      ),
                      CustomTextField(
                        title: 'Konstanta',
                        content: widget.langsung!.kwh_konstanta ?? '-',
                      ),
                      CustomTextField(
                        title: 'Class Akurasi',
                        content: widget.langsung!.kwh_class ?? '-',
                      ),
                      CustomTextField(
                        title: 'Rating Arus (ln)',
                        content: widget.langsung!.kwh_rating_arus ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tegangan',
                        content: widget.langsung!.kwh_tegangan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Stand Mtr LBP',
                        content: widget.langsung!.kwh_lbp ?? '-',
                      ),
                      CustomTextField(
                        title: 'Stand Mtr BP',
                        content: widget.langsung!.kwh_bp ?? '-',
                      ),
                      CustomTextField(
                        title: 'Stand kWhTotal',
                        content: widget.langsung!.kwh_total ?? '-',
                      ),
                      CustomTextField(
                        title: 'Stand Mtr kVArh',
                        content: widget.langsung!.kwh_kvarh ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Kwh Meter',
                        content: widget.langsung!.kwh_foto ?? '',
                      ),
                      Text(
                        'Trafo Arus (CT)',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Merk/Type',
                        content: widget.langsung!.ct_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'CLS',
                        content: widget.langsung!.ct_cls ?? '-',
                      ),
                      CustomTextField(
                        title: 'Rasio',
                        content: widget.langsung!.ct_rasio ?? '-',
                      ),
                      CustomTextField(
                        title: 'Burden',
                        content: widget.langsung!.ct_burden ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Trafo Arus (CT)',
                        content: widget.langsung!.ct_foto ?? '',
                      ),
                      Text(
                        'Trafo Arus (PT)',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Merk/Type',
                        content: widget.langsung!.pt_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'CLS',
                        content: widget.langsung!.pt_cls ?? '-',
                      ),
                      CustomTextField(
                        title: 'Rasio',
                        content: widget.langsung!.pt_rasio ?? '-',
                      ),
                      CustomTextField(
                        title: 'Burden',
                        content: widget.langsung!.pt_burden ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Trafo Tegangan (PT)',
                        content: widget.langsung!.pt_foto ?? '',
                      ),
                      Text(
                        'Kubikel',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Merk',
                        content: widget.langsung!.kubikel_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'Type',
                        content: widget.langsung!.kubikel_type ?? '-',
                      ),
                      CustomTextField(
                        title: 'No. Seri',
                        content: widget.langsung!.kubikel_no_seri ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tahun',
                        content: widget.langsung!.kubikel_tahun ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Kubikel',
                        content: widget.langsung!.kubikel_foto ?? '',
                      ),
                      Text(
                        'Box APP Tegangan Rendah',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Merk',
                        content: widget.langsung!.box_app_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'Type',
                        content: widget.langsung!.box_app_type ?? '-',
                      ),
                      CustomTextField(
                        title: 'No. Seri',
                        content: widget.langsung!.box_app_no_seri ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tahun',
                        content: widget.langsung!.box_app_tahun ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Box APP Tegangan Rendah',
                        content: widget.langsung!.box_app_foto ?? '',
                      ),
                      Text(
                        'Data Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'PINTU BOX APP/PELINDUNG KWH METER',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Kondisi Ketika Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content:
                            widget.langsung!.pelindung_kwh_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.pelindung_kwh_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .pelindung_kwh_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content:
                            widget.langsung!.pelindung_kwh_keterangan ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Sebelum',
                        content:
                            widget.langsung!.pelindung_kwh_foto_sebelum ?? '',
                      ),
                      Text(
                        'Kondisi Sesudah Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content:
                            widget.langsung!.pelindung_kwh_post_peralatan ??
                                '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content:
                            widget.langsung!.pelindung_kwh_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .pelindung_kwh_post_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      ImageShow(
                        title: 'Foto Sesudah',
                        content:
                            widget.langsung!.pelindung_kwh_foto_sesudah ?? '',
                      ),
                      Text(
                        'PINTU BOX APP TR/PELINDUNG CT DAN PEMBATAS',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Kondisi Ketika Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content: widget.langsung!.pelindung_ct_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.pelindung_ct_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .pelindung_ct_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content:
                            widget.langsung!.pelindung_ct_keterangan ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Sebelum',
                        content:
                            widget.langsung!.pelindung_ct_foto_sebelum ?? '',
                      ),
                      Text(
                        'Kondisi Sesudah Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content:
                            widget.langsung!.pelindung_ct_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content:
                            widget.langsung!.pelindung_ct_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .pelindung_ct_post_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      ImageShow(
                        title: 'Foto Sesudah',
                        content:
                            widget.langsung!.pelindung_ct_foto_sesudah ?? '',
                      ),

                      // KWH MEter dan Segel
                      Text(
                        'PINTU BOX APP TR/PELINDUNG CT DAN PEMBATAS',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Kondisi Ketika Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content: widget.langsung!.segel_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.segel_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.segel_nomor_tahun_kode_segel ??
                                '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.langsung!.segel_keterangan ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Sebelum',
                        content: widget.langsung!.segel_foto_sebelum ?? '',
                      ),
                      Text(
                        'Kondisi Sesudah Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content: widget.langsung!.segel_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.segel_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget
                                .langsung!.segel_post_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      ImageShow(
                        title: 'Foto Sesudah',
                        content: widget.langsung!.segel_foto_sesudah ?? '',
                      ),

                      // Tutup Terminal kWh Meter
                      Text(
                        'Tutup Terminal kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Kondisi Ketika Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content:
                            widget.langsung!.tutup_terminal_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.tutup_terminal_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .tutup_terminal_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content:
                            widget.langsung!.tutup_terminal_keterangan ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Sebelum',
                        content:
                            widget.langsung!.tutup_terminal_foto_sebelum ?? '',
                      ),
                      Text(
                        'Kondisi Sesudah Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content:
                            widget.langsung!.tutup_terminal_post_peralatan ??
                                '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content:
                            widget.langsung!.tutup_terminal_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .tutup_terminal_post_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      ImageShow(
                        title: 'Foto Sesudah',
                        content:
                            widget.langsung!.tutup_terminal_foto_sesudah ?? '',
                      ),

                      // Pintu Box Modem AMR
                      Text(
                        'Pintu Box Modem AMR',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Kondisi Ketika Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content: widget.langsung!.amr_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.amr_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.amr_nomor_tahun_kode_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.langsung!.amr_keterangan ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Sebelum',
                        content: widget.langsung!.amr_foto_sebelum ?? '',
                      ),
                      Text(
                        'Kondisi Sesudah Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content: widget.langsung!.amr_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.amr_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.amr_post_nomor_tahun_kode_segel ??
                                '-',
                      ),
                      ImageShow(
                        title: 'Foto Sesudah',
                        content: widget.langsung!.amr_foto_sesudah ?? '',
                      ),

                      // Pintu Kubikel/Pelindung Terminal VT
                      Text(
                        'Pintu Kubikel/Pelindung Terminal VT',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Kondisi Ketika Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content: widget.langsung!.terminal_vt_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.terminal_vt_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget
                                .langsung!.terminal_vt_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.langsung!.terminal_vt_keterangan ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Sebelum',
                        content:
                            widget.langsung!.terminal_vt_foto_sebelum ?? '',
                      ),
                      Text(
                        'Kondisi Sesudah Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content:
                            widget.langsung!.terminal_vt_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.terminal_vt_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .terminal_vt_post_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      ImageShow(
                        title: 'Foto Sesudah',
                        content:
                            widget.langsung!.terminal_vt_foto_sesudah ?? '',
                      ),

                      // Pintu Kubikel/Pelindung Terminal CT
                      Text(
                        'Pintu Kubikel/Pelindung Terminal CT dan Relay',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Kondisi Ketika Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content: widget.langsung!.terminal_ct_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.terminal_ct_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget
                                .langsung!.terminal_ct_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.langsung!.terminal_ct_keterangan ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Sebelum',
                        content:
                            widget.langsung!.terminal_ct_foto_sebelum ?? '',
                      ),
                      Text(
                        'Kondisi Sesudah Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content:
                            widget.langsung!.terminal_ct_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.terminal_ct_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .terminal_ct_post_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      ImageShow(
                        title: 'Foto Sesudah',
                        content:
                            widget.langsung!.terminal_ct_foto_sesudah ?? '',
                      ),

                      // Pintu Gardu
                      Text(
                        'Pintu Gardu',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Kondisi Ketika Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content: widget.langsung!.pintu_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.pintu_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.pintu_nomor_tahun_kode_segel ??
                                '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.langsung!.pintu_keterangan ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Sebelum',
                        content: widget.langsung!.pintu_foto_sebelum ?? '',
                      ),
                      Text(
                        'Kondisi Sesudah Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Peralatan',
                        content: widget.langsung!.pintu_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.pintu_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget
                                .langsung!.pintu_post_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      ImageShow(
                        title: 'Foto Sesudah',
                        content: widget.langsung!.pintu_foto_sesudah ?? '',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.langsung!.pintu_keterangan_all ?? '-',
                      ),

                      Text(
                        'Pemeriksaan dan Pengukuran',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Wiring',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),

                      CustomTextKeterangan(
                        title: 'Terminal 1 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal1 ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Terminal 2 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal2 ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Terminal 3 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal3 ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Terminal 4 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal4 ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Terminal 5 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal5 ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Terminal 6 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal6 ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Terminal 6 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal6 ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Terminal 7 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal7 ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Terminal 8 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal8 ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Terminal 9 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal9 ?? '-',
                      ),

                      CustomTextKeterangan(
                        title:
                            'Terminal 11 kWh Meter Terhubung Dengan terminal',
                        content: widget.langsung!.wiring_terminal11 ?? '-',
                      ),

                      CustomTextField(
                        title: 'Grounding',
                        content: widget.langsung!.wiring_terminal11 ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.langsung!.wiring_keterangan ?? '-',
                      ),

                      ImageShow(
                        title: 'Diagram Phasor',
                        content: widget.langsung!.wiring_diagram ?? '',
                      ),

                      Text(
                        'Pengukuran',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Arus Primer',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phasa R',
                        content:
                            widget.langsung!.pengukuran_arus_primer_r ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa S',
                        content:
                            widget.langsung!.pengukuran_arus_primer_s ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa T',
                        content:
                            widget.langsung!.pengukuran_arus_primer_t ?? '-',
                      ),
                      Text(
                        'Arus Sekunder',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phasa R',
                        content:
                            widget.langsung!.pengukuran_arus_sekunder_r ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa S',
                        content:
                            widget.langsung!.pengukuran_arus_sekunder_s ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa T',
                        content:
                            widget.langsung!.pengukuran_arus_sekunder_t ?? '-',
                      ),
                      Text(
                        'Ratio CT',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phasa R',
                        content: widget.langsung!.pengukuran_ct_r ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa S',
                        content: widget.langsung!.pengukuran_ct_s ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa T',
                        content: widget.langsung!.pengukuran_ct_t ?? '-',
                      ),

                      Text(
                        'Akurasi Ratio CT (%)',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phasa R',
                        content: widget.langsung!.pengukuran_akurasi_r ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa S',
                        content: widget.langsung!.pengukuran_akurasi_s ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa T',
                        content: widget.langsung!.pengukuran_akurasi_t ?? '-',
                      ),

                      Text(
                        'Voltase Primer',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phasa R',
                        content:
                            widget.langsung!.pengukuran_voltase_primer_r ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa S',
                        content:
                            widget.langsung!.pengukuran_voltase_primer_s ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa T',
                        content:
                            widget.langsung!.pengukuran_voltase_primer_t ?? '-',
                      ),

                      Text(
                        'Voltase Sekunder (PT)',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phasa R',
                        content:
                            widget.langsung!.pengukuran_voltase_sekunder_r ??
                                '-',
                      ),
                      CustomTextField(
                        title: 'Phasa S',
                        content:
                            widget.langsung!.pengukuran_voltase_sekunder_s ??
                                '-',
                      ),
                      CustomTextField(
                        title: 'Phasa T',
                        content:
                            widget.langsung!.pengukuran_voltase_sekunder_t ??
                                '-',
                      ),
                      Text(
                        'COS  φ',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phasa R',
                        content: widget.langsung!.pengukuran_cos_r ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa S',
                        content: widget.langsung!.pengukuran_cos_s ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phasa T',
                        content: widget.langsung!.pengukuran_cos_t ?? '-',
                      ),

                      CustomTextField(
                        title: 'Akurasi Pengukuran kWh Meter',
                        content: widget.langsung!.pengukuran_akurasi ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Akurasi Pengukuran kWh Meter',
                        content: widget.langsung!.pengukuran_keterangan ?? '-',
                      ),

                      //Hasil Pemeriksaan
                      Text(
                        'Hasil Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),

                      CustomTextField(
                        title: 'Apakah ada temuan?',
                        content: widget.langsung!.akhir_temuan ?? '-',
                      ),

                      CustomTextField(
                        title: 'Apakah diteruskan ke lab?',
                        content: widget.langsung!.akhir_labor ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Hasil Pemeriksaan',
                        content:
                            widget.langsung!.akhir_hasil_pemeriksaan ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Kesimpulan Hasil Pemeriksaan',
                        content: widget.langsung!.akhir_kesimpulan ?? '-',
                      ),

                      Text(
                        'Video',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      _controller.value.isInitialized && _controller != null
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
                      Center(
                        child: IconButton(
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 30,
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                        ),
                      ),

                      CustomTextKeterangan(
                        title: 'Tindakan Yang Dilakukan',
                        content: widget.langsung!.akhir_tindakan ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Barang Bukti yang diambil',
                        content: widget.langsung!.akhir_barang_bukti ?? '-',
                      ),

                      ImageShow(
                          title: 'Foto Barang Bukti',
                          content:
                              widget.langsung!.akhir_foto_barang_bukti ?? ''),

                      Text(
                        'Penyelesaian Jika ada Temuan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),

                      CustomTextKeterangan(
                        title: 'Tanggal Penyelesaian',
                        content:
                            widget.langsung!.akhir_tanggal_penyelesaian ?? '-',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
