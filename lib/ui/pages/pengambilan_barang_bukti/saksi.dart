import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/kalibrasi/kwh_meter.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class SaksiFormBarangBuktiPage extends StatefulWidget {
  final WorkModel work;

  const SaksiFormBarangBuktiPage({Key? key, required this.work})
      : super(key: key);

  @override
  State<SaksiFormBarangBuktiPage> createState() => _SaksiFormBarangBuktiPage();
}

class _SaksiFormBarangBuktiPage extends State<SaksiFormBarangBuktiPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController jenisKabelController = TextEditingController();
  TextEditingController panjangController = TextEditingController();
  TextEditingController teraController = TextEditingController();
  TextEditingController terminalController = TextEditingController();
  TextEditingController boxOkController = TextEditingController();
  TextEditingController boxAppController = TextEditingController();
  TextEditingController alatPembatasController = TextEditingController();
  TextEditingController alatBantuController = TextEditingController();

  XFile? selectedImage;

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    databaseInstance.database();

    super.initState();
  }

  bool validate() {
    if (jenisKabelController.text.isEmpty ||
        panjangController.text.isEmpty ||
        teraController.text.isEmpty ||
        terminalController.text.isEmpty ||
        boxOkController.text.isEmpty ||
        boxAppController.text.isEmpty ||
        alatPembatasController.text.isEmpty ||
        alatBantuController.text.isEmpty ||
        selectedImage == null) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Barang Bukti',
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
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Jenis kabel',
                        controller: jenisKabelController,
                      ),
                      CustomFormField(
                        title: 'Panjang Kabel',
                        controller: panjangController,
                      ),
                      Text(
                        'Segel-segel',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Tera',
                        controller: teraController,
                      ),
                      CustomFormField(
                        title: 'Terminal',
                        controller: terminalController,
                      ),
                      CustomFormField(
                        title: 'Box OK',
                        controller: boxOkController,
                      ),
                      CustomFormField(
                        title: 'Box APP',
                        controller: boxAppController,
                      ),
                      CustomFormField(
                        title: 'Alat Pembatas',
                        controller: alatPembatasController,
                      ),
                      CustomFormField(
                        title: 'Alat Bantu Ukur',
                        controller: alatBantuController,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectImage();
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: lightBackgroundColor,
                                  image: selectedImage == null
                                      ? null
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(
                                              selectedImage!.path,
                                            ),
                                          ),
                                        ),
                                ),
                                child: selectedImage != null
                                    ? null
                                    : Center(
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
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFilledButton(
                        title: 'Submit',
                        onPressed: () async {
                          if (validate()) {
                            var item =
                                await databaseInstance.insertFormPengambilan({
                              'works_id': widget.work!.id,
                              'kabel_jenis': jenisKabelController.text,
                              'kabel_panjang': panjangController.text,
                              'segel_tera': teraController.text,
                              'segel_terminal': terminalController.text,
                              'segel_box_ok': boxOkController.text,
                              'segel_box_app': boxAppController.text,
                              'segel_alat_pembatas':
                                  alatPembatasController.text,
                              'segel_alat_bantu_ukur': alatBantuController.text,
                              'segel_foto': 'data:image/png;base64,' +
                                  base64Encode(File(selectedImage!.path)
                                      .readAsBytesSync()),
                              'createdAt': DateTime.now()
                                  .toIso8601String()
                                  .split('T')
                                  .first,
                            });

                            if (item != 0) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Data gagal diinput',
                                  ),
                                  backgroundColor: redColor,
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Semua field harus diisi',
                                ),
                                backgroundColor: redColor,
                              ),
                            );
                          }
                        },
                      )
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
