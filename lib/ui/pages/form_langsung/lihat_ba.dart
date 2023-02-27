import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/langsung_model.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    databaseInstance.database();
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
                      // Data APP Lama
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Data APP Terpasang/Lama',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
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
                      Text(
                        'Data APP Baru',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
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
                        title: 'Konstanta',
                        content: widget.langsung!.data_baru_konstanta ?? '-',
                      ),
                      CustomTextField(
                        title: 'Rating Arus',
                        content: widget.langsung!.data_lama_rating_arus ?? '-',
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
                      Text(
                        'KWH Meter & Segel Metrologi kWh Meter',
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
                      Text(
                        'Terminal kWh Meter',
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
                      Text(
                        'Pintu Box APP/Pelindung kWh Meter',
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
                      Text(
                        'Pintu Box APP/Pelindung Busbar dan Pembatas',
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
                      Text(
                        'Papan OK',
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
                      Text(
                        'Box Penutup MCB',
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
                      //Wiring App
                      Text(
                        'Wiring App',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
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

                      CustomTextKeterangan(
                        title: 'Hasil Pemeriksaan',
                        content:
                            widget.langsung!.akhir_hasil_pemeriksaan ?? '-',
                      ),

                      CustomTextKeterangan(
                        title: 'Kesimpulan Hasil Pemeriksaan',
                        content: widget.langsung!.akhir_kesimpulan ?? '-',
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
