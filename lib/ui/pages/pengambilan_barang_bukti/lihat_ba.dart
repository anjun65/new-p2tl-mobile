import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/pengambilan_model.dart';
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

class LihatFormBarangBuktiPage extends StatefulWidget {
  final WorkModel work;
  final PengambilanModel? pengambilan;

  const LihatFormBarangBuktiPage(
      {Key? key, required this.work, this.pengambilan})
      : super(key: key);

  @override
  State<LihatFormBarangBuktiPage> createState() => _LihatFormBarangBuktiPage();
}

class _LihatFormBarangBuktiPage extends State<LihatFormBarangBuktiPage> {
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
          'Detail Form Barang Bukti',
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
                        'Kabel',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Jenis Kabel',
                        content: widget.pengambilan!.kabel_jenis ?? '-',
                      ),
                      CustomTextField(
                        title: 'Panjang Kabel',
                        content: widget.pengambilan!.kabel_panjang ?? '-',
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Segel-Segel',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextField(
                        title: 'Tera',
                        content: widget.pengambilan!.segel_tera ?? '-',
                      ),
                      CustomTextField(
                        title: 'Terminal',
                        content: widget.pengambilan!.segel_terminal ?? '-',
                      ),
                      CustomTextField(
                        title: 'Box OK',
                        content: widget.pengambilan!.segel_box_ok ?? '-',
                      ),
                      CustomTextField(
                        title: 'Box APP',
                        content: widget.pengambilan!.segel_box_app ?? '-',
                      ),
                      CustomTextField(
                        title: 'Alat Pembatas',
                        content: widget.pengambilan!.segel_alat_pembatas ?? '-',
                      ),
                      CustomTextField(
                        title: 'Alat Bantu Ukur',
                        content:
                            widget.pengambilan!.segel_alat_bantu_ukur ?? '-',
                      ),
                      ImageShow(
                        title: 'Foto Barang Bukti',
                        content: widget.pengambilan!.segel_foto ?? '',
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
