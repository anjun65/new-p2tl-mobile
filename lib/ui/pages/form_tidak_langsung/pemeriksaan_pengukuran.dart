import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_tidak_langsung/hasil_pemeriksaan.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PemeriksaanPengukuranFormTidakLangsungPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const PemeriksaanPengukuranFormTidakLangsungPage({
    Key? key,
    required this.id,
    required this.work,
  }) : super(key: key);

  @override
  State<PemeriksaanPengukuranFormTidakLangsungPage> createState() =>
      _PemeriksaanPengukuranFormTidakLangsungPage();
}

class _PemeriksaanPengukuranFormTidakLangsungPage
    extends State<PemeriksaanPengukuranFormTidakLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController arusPrimerRController = TextEditingController();
  TextEditingController arusPrimerSController = TextEditingController();
  TextEditingController arusPrimerTController = TextEditingController();
  TextEditingController arusSekunderRController = TextEditingController();
  TextEditingController arusSekunderSController = TextEditingController();
  TextEditingController arusSekunderTController = TextEditingController();
  TextEditingController ctRController = TextEditingController();
  TextEditingController ctSController = TextEditingController();
  TextEditingController ctTController = TextEditingController();
  TextEditingController akurasiCtRController = TextEditingController();
  TextEditingController akurasiCtSController = TextEditingController();
  TextEditingController akurasiCtTController = TextEditingController();
  TextEditingController voltasePrimerRController = TextEditingController();
  TextEditingController voltasePrimerSController = TextEditingController();
  TextEditingController voltasePrimerTController = TextEditingController();
  TextEditingController voltaseSekunderRController = TextEditingController();
  TextEditingController voltaseSekunderSController = TextEditingController();
  TextEditingController voltaseSekunderTController = TextEditingController();
  TextEditingController cosRController = TextEditingController();
  TextEditingController cosSController = TextEditingController();
  TextEditingController cosTController = TextEditingController();
  TextEditingController akurasiController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  XFile? selectedImage;

  String? imagePath;

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    final filename = DateTime.now().millisecondsSinceEpoch.toString();
    final file = File('$path/$filename.jpg');

    // Copy the video file to the new file
    await image!.saveTo(file.path);

    imagePath = '$path/$filename.jpg';

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
    if (arusPrimerRController.text.isEmpty ||
        arusPrimerSController.text.isEmpty ||
        arusPrimerTController.text.isEmpty ||
        arusSekunderRController.text.isEmpty ||
        arusSekunderSController.text.isEmpty ||
        arusSekunderTController.text.isEmpty ||
        ctRController.text.isEmpty ||
        ctSController.text.isEmpty ||
        ctTController.text.isEmpty ||
        akurasiCtRController.text.isEmpty ||
        akurasiCtSController.text.isEmpty ||
        akurasiCtTController.text.isEmpty ||
        voltasePrimerRController.text.isEmpty ||
        voltasePrimerSController.text.isEmpty ||
        voltasePrimerTController.text.isEmpty ||
        voltaseSekunderRController.text.isEmpty ||
        voltaseSekunderSController.text.isEmpty ||
        voltaseSekunderTController.text.isEmpty ||
        cosRController.text.isEmpty ||
        cosSController.text.isEmpty ||
        cosTController.text.isEmpty ||
        akurasiController.text.isEmpty ||
        keteranganController.text.isEmpty ||
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
          'Pemeriksaan & Pengukuran',
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
                        'Arus Primer',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Phase R',
                        controller: arusPrimerRController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase S',
                        controller: arusPrimerSController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase T',
                        controller: arusPrimerTController,
                        keyboardType: TextInputType.number,
                      ),
                      Text(
                        'Arus Sekunder (CT)',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Phase R',
                        controller: arusSekunderRController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase S',
                        controller: arusSekunderSController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase T',
                        controller: arusSekunderTController,
                        keyboardType: TextInputType.number,
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
                      CustomFormField(
                        title: 'Phase R',
                        controller: ctRController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase S',
                        controller: ctSController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase T',
                        controller: ctTController,
                        keyboardType: TextInputType.number,
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
                      CustomFormField(
                        title: 'Phase R',
                        controller: akurasiCtRController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase S',
                        controller: akurasiCtSController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase T',
                        controller: akurasiCtTController,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 12.0,
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
                      CustomFormField(
                        title: 'Phase R',
                        controller: voltasePrimerRController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase S',
                        controller: voltasePrimerSController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase T',
                        controller: voltasePrimerTController,
                        keyboardType: TextInputType.number,
                      ),
                      Text(
                        'Voltase Sekunder',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Phase R',
                        controller: voltaseSekunderRController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase S',
                        controller: voltaseSekunderSController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase T',
                        controller: voltaseSekunderTController,
                        keyboardType: TextInputType.number,
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
                      CustomFormField(
                        title: 'Phase R',
                        controller: cosRController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase S',
                        controller: cosSController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Phase T',
                        controller: cosTController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Akurasi Pengukuran kWh Meter',
                        controller: akurasiController,
                      ),
                      CustomFormField(
                        title: 'Keterangan',
                        controller: keteranganController,
                        maxLinesText: 4,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Pemeriksaan',
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
                            var item = await databaseInstance
                                .updateFormTidakLangsung(widget.id, {
                              'pengukuran_arus_primer_r':
                                  arusPrimerRController.text,
                              'pengukuran_arus_primer_s':
                                  arusPrimerSController.text,
                              'pengukuran_arus_primer_t':
                                  arusPrimerTController.text,
                              'pengukuran_arus_sekunder_r':
                                  arusSekunderRController.text,
                              'pengukuran_arus_sekunder_s':
                                  arusSekunderSController.text,
                              'pengukuran_arus_sekunder_t':
                                  arusSekunderTController.text,
                              'pengukuran_ct_r': ctRController.text,
                              'pengukuran_ct_s': ctSController.text,
                              'pengukuran_ct_t': ctRController.text,
                              'pengukuran_akurasi_r': akurasiCtRController.text,
                              'pengukuran_akurasi_s': akurasiCtSController.text,
                              'pengukuran_akurasi_t': akurasiCtTController.text,
                              'pengukuran_voltase_primer_r':
                                  voltasePrimerRController.text,
                              'pengukuran_voltase_primer_s':
                                  voltasePrimerSController.text,
                              'pengukuran_voltase_primer_t':
                                  voltasePrimerTController.text,
                              'pengukuran_voltase_sekunder_r':
                                  voltaseSekunderRController.text,
                              'pengukuran_voltase_sekunder_s':
                                  voltaseSekunderSController.text,
                              'pengukuran_voltase_sekunder_t':
                                  voltaseSekunderTController.text,
                              'pengukuran_cos_r': cosRController.text,
                              'pengukuran_cos_s': cosSController.text,
                              'pengukuran_cos_t': cosTController.text,
                              'pengukuran_akurasi': akurasiController.text,
                              'pengukuran_keterangan':
                                  keteranganController.text,
                              'pengukuran_foto': imagePath,
                            });

                            print(item);

                            if (item != 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return HasilPemeriksaanFormTidakLangsungPage(
                                  work: widget.work,
                                  id: item,
                                );
                              }));
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
