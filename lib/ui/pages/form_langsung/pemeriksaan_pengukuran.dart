import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_langsung/wiring_app.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class PemeriksaanPengukuranFormLangsungPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const PemeriksaanPengukuranFormLangsungPage({
    Key? key,
    required this.id,
    required this.work,
  }) : super(key: key);

  @override
  State<PemeriksaanPengukuranFormLangsungPage> createState() =>
      _PemeriksaanPengukuranFormLangsungPage();
}

class _PemeriksaanPengukuranFormLangsungPage
    extends State<PemeriksaanPengukuranFormLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController arus1Controller = TextEditingController();
  TextEditingController arus2Controller = TextEditingController();
  TextEditingController arus3Controller = TextEditingController();
  TextEditingController arusNetralController = TextEditingController();
  TextEditingController voltaseNetral1Controller = TextEditingController();
  TextEditingController voltaseNetral2Controller = TextEditingController();
  TextEditingController voltaseNetral3Controller = TextEditingController();
  TextEditingController voltasePhase1Controller = TextEditingController();
  TextEditingController voltasePhase2Controller = TextEditingController();
  TextEditingController voltasePhase3Controller = TextEditingController();
  TextEditingController cos1Controller = TextEditingController();
  TextEditingController cos2Controller = TextEditingController();
  TextEditingController cos3Controller = TextEditingController();
  TextEditingController akurasiController = TextEditingController();

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
    if (arus1Controller.text.isEmpty ||
        arus2Controller.text.isEmpty ||
        arus3Controller.text.isEmpty ||
        arusNetralController.text.isEmpty ||
        voltaseNetral1Controller.text.isEmpty ||
        voltaseNetral2Controller.text.isEmpty ||
        voltaseNetral3Controller.text.isEmpty ||
        voltasePhase1Controller.text.isEmpty ||
        voltasePhase2Controller.text.isEmpty ||
        voltasePhase3Controller.text.isEmpty ||
        cos1Controller.text.isEmpty ||
        cos2Controller.text.isEmpty ||
        cos3Controller.text.isEmpty ||
        akurasiController.text.isEmpty ||
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
                        'Arus',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Phase 1',
                        controller: arus1Controller,
                      ),
                      CustomFormField(
                        title: 'Phase 2',
                        controller: arus2Controller,
                      ),
                      CustomFormField(
                        title: 'Phase 3',
                        controller: arus3Controller,
                      ),
                      CustomFormField(
                        title: 'Phase Netral',
                        controller: arusNetralController,
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
                      CustomFormField(
                        title: 'Phase 1',
                        controller: voltaseNetral1Controller,
                      ),
                      CustomFormField(
                        title: 'Phase 2',
                        controller: voltaseNetral2Controller,
                      ),
                      CustomFormField(
                        title: 'Phase 3',
                        controller: voltaseNetral3Controller,
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
                      CustomFormField(
                        title: 'Phase 1',
                        controller: voltasePhase1Controller,
                      ),
                      CustomFormField(
                        title: 'Phase 2',
                        controller: voltasePhase2Controller,
                      ),
                      CustomFormField(
                        title: 'Phase 3',
                        controller: voltasePhase3Controller,
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
                        title: 'Phase 1',
                        controller: cos1Controller,
                      ),
                      CustomFormField(
                        title: 'Phase 2',
                        controller: cos2Controller,
                      ),
                      CustomFormField(
                        title: 'Phase 3',
                        controller: cos3Controller,
                      ),
                      CustomFormField(
                        title: 'Akurasi',
                        controller: akurasiController,
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
                                .updateFormLangsung(widget.id, {
                              'pemeriksaan_arus_1': arus1Controller.text,
                              'pemeriksaan_arus_2': arus2Controller.text,
                              'pemeriksaan_arus_3': arus3Controller.text,
                              'pemeriksaan_arus_netral':
                                  arusNetralController.text,
                              'pemeriksaan_voltase_netral_1':
                                  voltaseNetral1Controller.text,
                              'pemeriksaan_voltase_netral_2':
                                  voltaseNetral2Controller.text,
                              'pemeriksaan_voltase_netral_3':
                                  voltaseNetral3Controller.text,
                              'pemeriksaan_voltase_phase_1':
                                  voltasePhase1Controller.text,
                              'pemeriksaan_voltase_phase_2':
                                  voltasePhase2Controller.text,
                              'pemeriksaan_voltase_phase_3':
                                  voltasePhase3Controller.text,
                              'pemeriksaan_cos_1': cos1Controller.text,
                              'pemeriksaan_cos_2': cos2Controller.text,
                              'pemeriksaan_cos_3': cos3Controller.text,
                              'pemeriksaan_akurasi':
                                  akurasiController.text.isEmpty,
                              'pemeriksaan_foto_sebelum':
                                  'data:image/png;base64,' +
                                      base64Encode(File(selectedImage!.path)
                                          .readAsBytesSync()),
                            });

                            if (item != 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return WiringAppFormLangsungPage(
                                  work: widget.work,
                                  id: widget.id,
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
