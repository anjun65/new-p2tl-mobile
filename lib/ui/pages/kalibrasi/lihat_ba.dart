import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/kalibrasi_model.dart';
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
import 'package:video_player/video_player.dart';

class LihatFormKablirasiPage extends StatefulWidget {
  final WorkModel work;
  final KalibrasiModel? kalibrasi;

  const LihatFormKablirasiPage({Key? key, required this.work, this.kalibrasi})
      : super(key: key);

  @override
  State<LihatFormKablirasiPage> createState() => _LihatFormKablirasiPageState();
}

class _LihatFormKablirasiPageState extends State<LihatFormKablirasiPage> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.kalibrasi!.kwh_video!))
      ..initialize().then((_) {
        setState(() {});
      });

    _controller2 =
        VideoPlayerController.file(File(widget.kalibrasi!.posisi_video!))
          ..initialize().then((_) {
            setState(() {});
          });

    _controller3 =
        VideoPlayerController.file(File(widget.kalibrasi!.uji_video!))
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BA Kalibrasi',
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
                        content: widget.kalibrasi!.nama_saksi ?? '-',
                      ),
                      CustomTextField(
                        title: 'Alamat Saksi',
                        content: widget.kalibrasi!.alamat_saksi ?? '-',
                      ),
                      CustomTextField(
                        title: 'Nomor KTP/SIM',
                        content: widget.kalibrasi!.nomor_identitas ?? '-',
                      ),
                      CustomTextField(
                        title: 'Pekerjaan',
                        content: widget.kalibrasi!.pekerjaan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Nomor Telpon',
                        content: widget.kalibrasi!.no_telpon_saksi ?? '-',
                      ),
                      Text(
                        'Data KWH Meter',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Merk/Type',
                        content: widget.kalibrasi!.kwh_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'No Register',
                        content: widget.kalibrasi!.kwh_no_reg ?? '-',
                      ),
                      CustomTextField(
                        title: 'No Seri',
                        content: widget.kalibrasi!.kwh_no_seri ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tahun Pembuatan',
                        content: widget.kalibrasi!.kwh_tahun_pembuatan ?? '-',
                      ),
                      CustomTextField(
                        title: 'Class',
                        content: widget.kalibrasi!.kwh_class ?? '-',
                      ),
                      CustomTextField(
                        title: 'Konstanta',
                        content: widget.kalibrasi!.kwh_konstanta ?? '-',
                      ),
                      CustomTextField(
                        title: 'Rating Arus (ln)',
                        content: widget.kalibrasi!.kwh_rating_arus ?? '-',
                      ),
                      CustomTextField(
                        title: 'Tegangan Nomimal',
                        content: widget.kalibrasi!.kwh_tegangan_nominal ?? '-',
                      ),
                      CustomTextField(
                        title: 'Stand kWh Meter',
                        content: widget.kalibrasi!.kwh_stand_kwh ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.kalibrasi!.kwh_stand_kwh ?? '-',
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
                      Text(
                        'Posisi Segel',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Sisi Atas kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Kode Segel Sisi A',
                        content: widget.kalibrasi!.posisi_atas_a ?? '-',
                      ),
                      CustomTextField(
                        title: 'Kode Segel Sisi B',
                        content: widget.kalibrasi!.posisi_atas_b ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.kalibrasi!.posisi_atas_c ?? '-',
                      ),
                      Text(
                        'Sisi Kanan kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Kode Segel Sisi A',
                        content: widget.kalibrasi!.posisi_kanan_a ?? '-',
                      ),
                      CustomTextField(
                        title: 'Kode Segel Sisi B',
                        content: widget.kalibrasi!.posisi_kanan_b ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.kalibrasi!.posisi_kanan_c ?? '-',
                      ),
                      Text(
                        'Sisi Kiri kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Kode Segel Sisi A',
                        content: widget.kalibrasi!.posisi_kiri_a ?? '-',
                      ),
                      CustomTextField(
                        title: 'Kode Segel Sisi B',
                        content: widget.kalibrasi!.posisi_kiri_b ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.kalibrasi!.posisi_kiri_c ?? '-',
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
                      _controller2.value.isInitialized && _controller2 != null
                          ? AspectRatio(
                              aspectRatio: _controller2.value.aspectRatio,
                              child: VideoPlayer(_controller2),
                            )
                          : Container(),
                      Center(
                        child: IconButton(
                          icon: Icon(
                            _controller2.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 30,
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              _controller2.value.isPlaying
                                  ? _controller2.pause()
                                  : _controller2.play();
                            });
                          },
                        ),
                      ),
                      Text(
                        'Hasil Uji Akurasi Pengukuran kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Beban 100% IN',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Tegangan (V)',
                        content: widget.kalibrasi!.uji_tegangan_100 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Frekwensi (Hz)',
                        content: '50',
                      ),
                      CustomTextField(
                        title: 'Arus (A)',
                        content: widget.kalibrasi!.uji_arus_100 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Faktor Daya (Cos φ)',
                        content: '1',
                      ),
                      CustomTextField(
                        title: 'Nilai Akurasi (%)',
                        content: widget.kalibrasi!.uji_nilai_akurasi_100 ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.kalibrasi!.uji_keterangan_100 ?? '-',
                      ),
                      Text(
                        'Beban 50% IN',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Tegangan (V)',
                        content: widget.kalibrasi!.uji_tegangan_50 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Frekwensi (Hz)',
                        content: '50',
                      ),
                      CustomTextField(
                        title: 'Arus (A)',
                        content: widget.kalibrasi!.uji_arus_50 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Faktor Daya (Cos φ)',
                        content: '1',
                      ),
                      CustomTextField(
                        title: 'Nilai Akurasi (%)',
                        content: widget.kalibrasi!.uji_nilai_akurasi_50 ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.kalibrasi!.uji_keterangan_50 ?? '-',
                      ),
                      Text(
                        'Beban 5% IN',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Tegangan (V)',
                        content: widget.kalibrasi!.uji_tegangan_5 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Frekwensi (Hz)',
                        content: '50',
                      ),
                      CustomTextField(
                        title: 'Arus (A)',
                        content: widget.kalibrasi!.uji_arus_5 ?? '-',
                      ),
                      CustomTextField(
                        title: 'Faktor Daya (Cos φ)',
                        content: '1',
                      ),
                      CustomTextField(
                        title: 'Nilai Akurasi (%)',
                        content: widget.kalibrasi!.uji_nilai_akurasi_5 ?? '-',
                      ),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.kalibrasi!.uji_keterangan_5 ?? '-',
                      ),
                      Text(
                        'Alat Uji',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Merk',
                        content: widget.kalibrasi!.uji_merk ?? '-',
                      ),
                      CustomTextField(
                        title: 'Type',
                        content: widget.kalibrasi!.uji_type ?? '-',
                      ),
                      CustomTextField(
                        title: 'No Seri',
                        content: widget.kalibrasi!.uji_no_seri ?? '-',
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
                      _controller3.value.isInitialized && _controller3 != null
                          ? AspectRatio(
                              aspectRatio: _controller3.value.aspectRatio,
                              child: VideoPlayer(_controller3),
                            )
                          : Container(),
                      Center(
                        child: IconButton(
                          icon: Icon(
                            _controller3.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 30,
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              _controller3.value.isPlaying
                                  ? _controller3.pause()
                                  : _controller3.play();
                            });
                          },
                        ),
                      ),
                      CustomTextKeterangan(
                        title: 'Kesimpulan',
                        content: widget.kalibrasi!.uji_kesimpulan ?? '-',
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
  }
}
