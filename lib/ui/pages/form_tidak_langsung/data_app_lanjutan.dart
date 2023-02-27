import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_tidak_langsung/pemeriksaan_pelindung_kwh.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class DataAppLanjutanFormTidakLangsungPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const DataAppLanjutanFormTidakLangsungPage({
    Key? key,
    required this.work,
    required this.id,
  }) : super(key: key);

  @override
  State<DataAppLanjutanFormTidakLangsungPage> createState() =>
      _DataAppLanjutanFormTidakLangsungPage();
}

class _DataAppLanjutanFormTidakLangsungPage
    extends State<DataAppLanjutanFormTidakLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController ctMerkController = TextEditingController();
  TextEditingController ctClsController = TextEditingController();
  TextEditingController ctRasioController = TextEditingController();
  TextEditingController ctBurdenController = TextEditingController();
  TextEditingController ptMerkController = TextEditingController();
  TextEditingController ptClsController = TextEditingController();
  TextEditingController ptRasioController = TextEditingController();
  TextEditingController ptBurdenController = TextEditingController();
  TextEditingController kubikelMerkController = TextEditingController();
  TextEditingController kubikelTypeController = TextEditingController();
  TextEditingController kubikelNoSeriController = TextEditingController();
  TextEditingController kubikelTahunPembuatanController =
      TextEditingController();
  TextEditingController boxAppMerkController = TextEditingController();
  TextEditingController boxAppTypeController = TextEditingController();
  TextEditingController boxAppNoSeriController = TextEditingController();
  TextEditingController boxAppTahunPembuatanController =
      TextEditingController();

  XFile? selectedImage;
  XFile? selectedImage2;
  XFile? selectedImage3;
  XFile? selectedImage4;

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

  selectImage2() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        selectedImage2 = image;
      });
    }
  }

  selectImage3() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        selectedImage3 = image;
      });
    }
  }

  selectImage4() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        selectedImage4 = image;
      });
    }
  }

  bool validate() {
    if (ctMerkController.text.isEmpty ||
        ctClsController.text.isEmpty ||
        ctRasioController.text.isEmpty ||
        ctBurdenController.text.isEmpty ||
        ptMerkController.text.isEmpty ||
        ptClsController.text.isEmpty ||
        ptRasioController.text.isEmpty ||
        ptBurdenController.text.isEmpty ||
        kubikelMerkController.text.isEmpty ||
        kubikelTypeController.text.isEmpty ||
        kubikelNoSeriController.text.isEmpty ||
        kubikelTahunPembuatanController.text.isEmpty ||
        boxAppMerkController.text.isEmpty ||
        boxAppTypeController.text.isEmpty ||
        boxAppNoSeriController.text.isEmpty ||
        boxAppTahunPembuatanController.text.isEmpty ||
        selectedImage == null ||
        selectedImage2 == null ||
        selectedImage3 == null ||
        selectedImage4 == null) {
      return false;
    }

    return true;
  }

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
          'Data APP Lanjutan',
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
                        'Trafo Arus (CT)',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomFormField(
                        title: 'Merk/Type',
                        controller: ctMerkController,
                      ),
                      CustomFormField(
                        title: 'Cls',
                        controller: ctClsController,
                      ),
                      CustomFormField(
                        title: 'Rasio (/5A)',
                        controller: ctRasioController,
                      ),
                      CustomFormField(
                        title: 'Burden (VA)',
                        controller: ctBurdenController,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Trafo Arus (CT)',
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
                        height: 8.0,
                      ),
                      Text(
                        'Trafo Tegangan (PT)',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomFormField(
                        title: 'Merk/Type',
                        controller: ptMerkController,
                      ),
                      CustomFormField(
                        title: 'Cls',
                        controller: ptClsController,
                      ),
                      CustomFormField(
                        title: 'Rasio (/5A)',
                        controller: ptRasioController,
                      ),
                      CustomFormField(
                        title: 'Burden (VA)',
                        controller: ptBurdenController,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Trafo Tegangan(PT)',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectImage2();
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: lightBackgroundColor,
                                  image: selectedImage2 == null
                                      ? null
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(
                                              selectedImage2!.path,
                                            ),
                                          ),
                                        ),
                                ),
                                child: selectedImage2 != null
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
                        height: 8.0,
                      ),
                      Text(
                        'Kubikel',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomFormField(
                        title: 'Merk',
                        controller: kubikelMerkController,
                      ),
                      CustomFormField(
                        title: 'Type',
                        controller: kubikelTypeController,
                      ),
                      CustomFormField(
                        title: 'No Seri',
                        controller: kubikelNoSeriController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Tahun Pembuatan',
                        controller: kubikelTahunPembuatanController,
                        keyboardType: TextInputType.number,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Kubikel',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectImage3();
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: lightBackgroundColor,
                                  image: selectedImage3 == null
                                      ? null
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(
                                              selectedImage3!.path,
                                            ),
                                          ),
                                        ),
                                ),
                                child: selectedImage3 != null
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
                        height: 8.0,
                      ),
                      Text(
                        'Box APP Tegangan Rendah',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomFormField(
                        title: 'Merk',
                        controller: boxAppMerkController,
                      ),
                      CustomFormField(
                        title: 'Type',
                        controller: boxAppTypeController,
                      ),
                      CustomFormField(
                        title: 'No Seri',
                        controller: boxAppNoSeriController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Tahun Pembuatan',
                        controller: boxAppTahunPembuatanController,
                        keyboardType: TextInputType.number,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Box App Tegangan Rendah',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectImage4();
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: lightBackgroundColor,
                                  image: selectedImage4 == null
                                      ? null
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(
                                              selectedImage4!.path,
                                            ),
                                          ),
                                        ),
                                ),
                                child: selectedImage4 != null
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
                              'ct_merk': ctMerkController.text,
                              'ct_cls': ctClsController.text,
                              'ct_rasio': ctRasioController.text,
                              'ct_burden': ctBurdenController.text,
                              'ct_foto': 'data:image/png;base64,' +
                                  base64Encode(File(selectedImage!.path)
                                      .readAsBytesSync()),
                              'pt_merk': ptMerkController.text,
                              'pt_cls': ptClsController.text,
                              'pt_rasio': ptRasioController.text,
                              'pt_burden': ptBurdenController.text,
                              'pt_foto': 'data:image/png;base64,' +
                                  base64Encode(File(selectedImage2!.path)
                                      .readAsBytesSync()),
                              'kubikel_merk': kubikelMerkController.text,
                              'kubikel_type': kubikelTypeController.text,
                              'kubikel_no_seri': kubikelNoSeriController.text,
                              'kubikel_tahun':
                                  kubikelTahunPembuatanController.text,
                              'kubikel_foto': 'data:image/png;base64,' +
                                  base64Encode(File(selectedImage3!.path)
                                      .readAsBytesSync()),
                              'box_app_merk': boxAppMerkController.text,
                              'box_app_type': boxAppTypeController.text,
                              'box_app_no_seri': boxAppNoSeriController.text,
                              'box_app_tahun':
                                  boxAppTahunPembuatanController.text,
                              'box_app_foto': 'data:image/png;base64,' +
                                  base64Encode(File(selectedImage4!.path)
                                      .readAsBytesSync()),
                            });

                            if (item != 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PemeriksaanPelindungKwhFormTidakLangsungPage(
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
