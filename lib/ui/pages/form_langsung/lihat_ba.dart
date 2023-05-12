import 'dart:io';

import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/langsung_model.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_langsung/data_baru.dart';
import 'package:p2tl/ui/pages/form_langsung/data_lama.dart';
import 'package:p2tl/ui/pages/form_langsung/hasil_pemeriksaan.dart';
import 'package:p2tl/ui/pages/form_langsung/pemeriksaan_kwh_meter.dart';
import 'package:p2tl/ui/pages/form_langsung/pemeriksaan_papan_ok.dart';
import 'package:p2tl/ui/pages/form_langsung/pemeriksaan_pelindung_busbar.dart';
import 'package:p2tl/ui/pages/form_langsung/pemeriksaan_pelindung_kwh.dart';
import 'package:p2tl/ui/pages/form_langsung/pemeriksaan_pengukuran.dart';
import 'package:p2tl/ui/pages/form_langsung/pemeriksaan_penutup_mcb.dart';
import 'package:p2tl/ui/pages/form_langsung/pemeriksaan_terminal.dart';
import 'package:p2tl/ui/pages/form_langsung/wiring_app.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/image_show.dart';
import 'package:p2tl/ui/widgets/keterangan.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:video_player/video_player.dart';

class LihatFormLangsungPage extends StatefulWidget {
  final WorkModel work;
  final LangsungModel? langsung;

  const LihatFormLangsungPage({Key? key, required this.work, this.langsung})
      : super(key: key);

  @override
  State<LihatFormLangsungPage> createState() => _LihatFormLangsungPage();
}

class _LihatFormLangsungPage extends State<LihatFormLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  late VideoPlayerController _controller;

  @override
  void initState() {
    databaseInstance.database();

    _controller = VideoPlayerController.file(
        File(widget.langsung!.akhir_kesimpulan_video!))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
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
                        content: widget.langsung!.nomor_identitas ?? '-',
                      ),
                      CustomTextField(
                        title: 'Nomor Telepon',
                        content: widget.langsung!.no_telpon_saksi ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto identitas',
                        content: widget.langsung!.file_nomor_identitas ?? '',
                      ),
                      // Data APP Lama
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Data APP Terpasang/Lama',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return DataLamaFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
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
                        content: widget.langsung!.data_lama_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'No. Register',
                        content: widget.langsung!.data_lama_no_reg ?? '-',
                      ),
                      CustomTextField(
                        title: 'No. Seri',
                        content: widget.langsung!.data_lama_no_seri ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tahun Pembuatan',
                        content:
                            widget.langsung!.data_lama_tahun_pembuatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Class',
                        content: widget.langsung!.data_lama_class ?? '-',
                      ),
                      CustomTextField(
                        title: 'Konstanta',
                        content: widget.langsung!.data_lama_konstanta ?? '-',
                      ),
                      CustomTextField(
                        title: 'Rating Arus',
                        content: widget.langsung!.data_lama_rating_arus ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tegangan Nomimal',
                        content:
                            widget.langsung!.data_lama_tegangan_nominal ?? '-',
                      ),
                      CustomTextField(
                        title: 'Stand kWh Meter',
                        content:
                            widget.langsung!.data_lama_stand_kwh_meter ?? '-',
                      ),
                      ImageShow(
                          title: 'Foto kWh Meter',
                          content:
                              widget.langsung!.data_lama_foto_kwh_meter ?? ''),
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
                        title: 'Jenis Pembatas',
                        content:
                            widget.langsung!.data_lama_jenis_pembatas ?? '-',
                      ),

                      CustomTextField(
                        title: 'Merk',
                        content:
                            widget.langsung!.data_lama_alat_pembatas_merk ??
                                '-',
                      ),
                      CustomTextField(
                        title: 'Rating Arus',
                        content: widget.langsung!.data_lama_rating_arus ?? '-',
                      ),
                      ImageShow(
                          title: 'Foto kWh Meter',
                          content:
                              widget.langsung!.data_lama_foto_pembatas ?? ''),

                      // Data APP Baru
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Data APP Baru',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return DataBaruFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
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
                        content: widget.langsung!.data_baru_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'No. Register',
                        content: widget.langsung!.data_baru_no_reg ?? '-',
                      ),
                      CustomTextField(
                        title: 'No. Seri',
                        content: widget.langsung!.data_baru_no_seri ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tahun Pembuatan',
                        content:
                            widget.langsung!.data_baru_tahun_pembuatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Class',
                        content: widget.langsung!.data_baru_class ?? '-',
                      ),
                      CustomTextField(
                        title: 'Konstanta',
                        content: widget.langsung!.data_baru_konstanta ?? '-',
                      ),
                      CustomTextField(
                        title: 'Rating Arus',
                        content: widget.langsung!.data_baru_rating_arus ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tegangan Nomimal',
                        content:
                            widget.langsung!.data_baru_tegangan_nominal ?? '-',
                      ),
                      CustomTextField(
                        title: 'Stand kWh Meter',
                        content:
                            widget.langsung!.data_baru_stand_kwh_meter ?? '-',
                      ),
                      ImageShow(
                          title: 'Foto kWh Meter',
                          content:
                              widget.langsung!.data_baru_foto_kwh_meter ?? ''),
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
                        title: 'Jenis Pembatas',
                        content:
                            widget.langsung!.data_baru_jenis_pembatas ?? '-',
                      ),

                      CustomTextField(
                        title: 'Merk',
                        content:
                            widget.langsung!.data_baru_alat_pembatas_merk ??
                                '-',
                      ),
                      CustomTextField(
                        title: 'Rating Arus',
                        content: widget.langsung!.data_baru_rating_arus ?? '-',
                      ),
                      ImageShow(
                          title: 'Foto kWh Meter',
                          content:
                              widget.langsung!.data_baru_foto_pembatas ?? ''),

                      // Data Pemeriksaan
                      const SizedBox(
                        height: 12.0,
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
                      Row(
                        children: [
                          Text(
                            'KWH Meter & Segel\n Metrologi kWh Meter',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PemeriksaanKwhMeterFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
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
                        content: widget.langsung!.kwh_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.kwh_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.kwh_nomor_tahun_kode_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                          title: 'Keterangan',
                          content: widget.langsung!.kwh_keterangan ?? '-'),
                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content: widget.langsung!.kwh_foto_sebelum ?? ''),
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
                        content: widget.langsung!.kwh_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.kwh_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.kwh_post_nomor_tahun_kode_segel ??
                                '-',
                      ),

                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content: widget.langsung!.kwh_foto_sesudah ?? ''),
                      // Terminal Kwh Meter
                      Row(
                        children: [
                          Text(
                            'Terminal kWh Meter',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PemeriksaanTerminalFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
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
                        content: widget.langsung!.terminal_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.terminal_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.terminal_nomor_tahun_kode_segel ??
                                '-',
                      ),
                      CustomTextKeterangan(
                          title: 'Keterangan',
                          content: widget.langsung!.terminal_keterangan ?? '-'),
                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content:
                              widget.langsung!.terminal_foto_sebelum ?? ''),
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
                            widget.langsung!.terminal_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.terminal_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .terminal_post_nomor_tahun_kode_segel ??
                            '-',
                      ),

                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content:
                              widget.langsung!.terminal_foto_sesudah ?? ''),
                      // Pintu Box App
                      Row(
                        children: [
                          Text(
                            'Pintu Box APP/\nPelindung kWh Meter',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PemeriksaanPelindungKwhFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
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
                              widget.langsung!.pelindung_kwh_keterangan ?? '-'),
                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content:
                              widget.langsung!.pelindung_kwh_foto_sebelum ??
                                  ''),
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
                          title: 'Foto Ketika Pemeriksaan',
                          content:
                              widget.langsung!.pelindung_kwh_foto_sesudah ??
                                  ''),
                      // Pintu Box App/ Pelindung Busbar
                      Row(
                        children: [
                          Text(
                            'Pintu Box APP/Pelindung \nBusbar & Pembatas',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PemeriksaanPelindungBusbarFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
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
                        content: widget.langsung!.busbar_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.busbar_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.busbar_nomor_tahun_kode_segel ??
                                '-',
                      ),
                      CustomTextKeterangan(
                          title: 'Keterangan',
                          content: widget.langsung!.busbar_keterangan ?? '-'),
                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content: widget.langsung!.busbar_foto_sebelum ?? ''),
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
                        content: widget.langsung!.busbar_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.busbar_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget
                                .langsung!.busbar_post_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content: widget.langsung!.busbar_foto_sesudah ?? ''),

                      // Papan OK
                      Row(
                        children: [
                          Text(
                            'Papan OK',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PemeriksaanPapanOkFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
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
                        content: widget.langsung!.papan_ok_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.papan_ok_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.papan_ok_nomor_tahun_kode_segel ??
                                '-',
                      ),
                      CustomTextKeterangan(
                          title: 'Keterangan',
                          content: widget.langsung!.papan_ok_keterangan ?? '-'),
                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content:
                              widget.langsung!.papan_ok_foto_sebelum ?? ''),
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
                            widget.langsung!.papan_ok_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.papan_ok_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content: widget.langsung!
                                .papan_ok_post_nomor_tahun_kode_segel ??
                            '-',
                      ),
                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content:
                              widget.langsung!.papan_ok_foto_sesudah ?? ''),

                      // Box Penutup MCB
                      Row(
                        children: [
                          Text(
                            'Box Penutup MCB',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PemeriksaanPenutupMcbFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
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
                        content: widget.langsung!.mcb_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.mcb_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.mcb_nomor_tahun_kode_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                          title: 'Keterangan',
                          content: widget.langsung!.mcb_keterangan ?? '-'),
                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content: widget.langsung!.mcb_foto_sebelum ?? ''),
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
                        content: widget.langsung!.mcb_post_peralatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Segel',
                        content: widget.langsung!.mcb_post_segel ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Nomor, Tahun, Kode Segel',
                        content:
                            widget.langsung!.mcb_post_nomor_tahun_kode_segel ??
                                '-',
                      ),
                      ImageShow(
                          title: 'Foto Ketika Pemeriksaan',
                          content: widget.langsung!.mcb_foto_sesudah ?? ''),

                      CustomTextKeterangan(
                        title: 'Keterangan Seluruh Pemeriksaan',
                        content: widget.langsung!.pemeriksaan_keterangan ?? '-',
                      ),

                      // Pemeriksaan dan Pengukuran
                      Row(
                        children: [
                          Text(
                            'Pemeriksaan & Pengukuran',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PemeriksaanPengukuranFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Arus',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phase 1',
                        content: widget.langsung!.pemeriksaan_arus_1 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phase 2',
                        content: widget.langsung!.pemeriksaan_arus_2 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phase 3',
                        content: widget.langsung!.pemeriksaan_arus_3 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Netral',
                        content:
                            widget.langsung!.pemeriksaan_arus_netral ?? '-',
                      ),
                      Text(
                        'Voltase Phase - Netral',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phase 1',
                        content:
                            widget.langsung!.pemeriksaan_voltase_netral_1 ??
                                '-',
                      ),
                      CustomTextField(
                        title: 'Phase 2',
                        content:
                            widget.langsung!.pemeriksaan_voltase_netral_2 ??
                                '-',
                      ),
                      CustomTextField(
                        title: 'Phase 3',
                        content:
                            widget.langsung!.pemeriksaan_voltase_netral_3 ??
                                '-',
                      ),
                      Text(
                        'Voltase Phase - Phase',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phase 1',
                        content:
                            widget.langsung!.pemeriksaan_voltase_phase_1 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phase 2',
                        content:
                            widget.langsung!.pemeriksaan_voltase_phase_2 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phase 3',
                        content:
                            widget.langsung!.pemeriksaan_voltase_phase_3 ?? '-',
                      ),
                      Text(
                        'COS φ',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Phase 1',
                        content: widget.langsung!.pemeriksaan_cos_1 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phase 2',
                        content: widget.langsung!.pemeriksaan_cos_2 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Phase 3',
                        content: widget.langsung!.pemeriksaan_cos_3 ?? '-',
                      ),

                      CustomTextField(
                        title: 'Akurasi pengukuran kWh Meter',
                        content: widget.langsung!.pemeriksaan_akurasi ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Pengukuran',
                        content:
                            widget.langsung!.pemeriksaan_foto_sebelum ?? '',
                      ),
                      //Wiring App
                      Row(
                        children: [
                          Text(
                            'Wiring App',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return WiringAppFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),

                      CustomTextField(
                        title: 'Terminal 1 kWh Meter',
                        content: widget.langsung!.wiring_terminal1 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal 2 kWh Meter',
                        content: widget.langsung!.wiring_terminal2 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal 3 kWh Meter',
                        content: widget.langsung!.wiring_terminal3 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal 4 kWh Meter',
                        content: widget.langsung!.wiring_terminal4 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal 5 kWh Meter',
                        content: widget.langsung!.wiring_terminal5 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal 6 kWh Meter',
                        content: widget.langsung!.wiring_terminal6 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal 7 kWh Meter',
                        content: widget.langsung!.wiring_terminal7 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal 8 kWh Meter',
                        content: widget.langsung!.wiring_terminal8 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal 9 kWh Meter',
                        content: widget.langsung!.wiring_terminal9 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal 11 kWh Meter',
                        content: widget.langsung!.wiring_terminal11 ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content:
                            widget.langsung!.wiring_keterangan_wiring_app ??
                                '-',
                      ),
                      ImageShow(
                          title: 'Foto Wiring App',
                          content: widget.langsung!.wiring_foto ?? ''),

                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content:
                            widget.langsung!.wiring_keterangan_wiring_app ??
                                '-',
                      ),
                      //Hasil Pemeriksaan
                      Row(
                        children: [
                          Text(
                            'Hasil Pemeriksaan',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return HasilPemeriksaanFormLangsungPage(
                                  work: widget.work,
                                  id: widget.langsung!.id!,
                                );
                              }));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                            ),
                            child: Text(
                              "Ubah",
                              style: whiteTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Apakah diteruskan ke lab?',
                        content: widget.langsung!.akhir_labor ?? '-',
                      ),

                      CustomTextField(
                        title: 'Apakah ada temuan?',
                        content: widget.langsung!.akhir_temuan ?? '-',
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

                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Video Lokasi',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: widget.langsung!.akhir_kesimpulan_video !=
                                      null
                                  ? Column(
                                      children: [
                                        AspectRatio(
                                          aspectRatio:
                                              _controller.value.aspectRatio,
                                          child: VideoPlayer(_controller),
                                        ),
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
                                      ],
                                    )
                                  : Container(
                                      height: 100,
                                      child: Center(
                                        child: Image.asset(
                                          'assets/ic_upload.png',
                                          width: 32,
                                        ),
                                      ),
                                    ),
                            ),
                          ],
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
