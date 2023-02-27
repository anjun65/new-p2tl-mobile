import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_langsung/data_baru.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class DataLamaFormLangsungPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const DataLamaFormLangsungPage({
    Key? key,
    required this.id,
    required this.work,
  }) : super(key: key);

  @override
  State<DataLamaFormLangsungPage> createState() => _DataLamaFormLangsungPage();
}

class _DataLamaFormLangsungPage extends State<DataLamaFormLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController merkController = TextEditingController();
  TextEditingController noRegController = TextEditingController();
  TextEditingController noSeriController = TextEditingController();
  TextEditingController tahunPembuatanController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController konstantaController = TextEditingController();
  TextEditingController ratingArusController = TextEditingController();
  TextEditingController teganganNominalController = TextEditingController();
  TextEditingController standKwhMeterController = TextEditingController();
  TextEditingController jenisPembatasController = TextEditingController();
  TextEditingController alatPembatasController = TextEditingController();
  TextEditingController ratingArus2Controller = TextEditingController();

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

  XFile? selectedImage2;

  selectImage2() async {
    final imagePicker = ImagePicker();
    final XFile? image2 = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    if (image2 != null) {
      setState(() {
        selectedImage2 = image2;
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
    if (merkController.text.isEmpty ||
        noRegController.text.isEmpty ||
        noSeriController.text.isEmpty ||
        tahunPembuatanController.text.isEmpty ||
        classController.text.isEmpty ||
        konstantaController.text.isEmpty ||
        ratingArusController.text.isEmpty ||
        teganganNominalController.text.isEmpty ||
        standKwhMeterController.text.isEmpty ||
        jenisPembatasController.text.isEmpty ||
        alatPembatasController.text.isEmpty ||
        ratingArus2Controller.text.isEmpty ||
        selectedImage == null ||
        selectedImage2 == null) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Data APP Lama',
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
                        'Data kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Merk',
                        controller: merkController,
                      ),
                      CustomFormField(
                        title: 'Nomor Registrasi',
                        controller: noRegController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Nomor Seri',
                        controller: noSeriController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Tahun Pembuatan',
                        controller: tahunPembuatanController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Class',
                        controller: classController,
                      ),
                      CustomFormField(
                        title: 'Konstanta',
                        controller: konstantaController,
                      ),
                      CustomFormField(
                        title: 'Rating Arus',
                        controller: ratingArusController,
                      ),
                      CustomFormField(
                        title: 'Tegangan Nomimal',
                        controller: teganganNominalController,
                      ),
                      CustomFormField(
                        title: 'Stand kWh Meter',
                        controller: standKwhMeterController,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto kWh Meter',
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
                      Text(
                        'Data Alat Pembatas',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Jenis Pembatas',
                        controller: jenisPembatasController,
                      ),
                      CustomFormField(
                        title: 'Alat Pembatas',
                        controller: alatPembatasController,
                      ),
                      CustomFormField(
                        title: 'Rating Arus',
                        controller: ratingArus2Controller,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Alat Pembatas',
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
                        height: 12.0,
                      ),
                      CustomFilledButton(
                        title: 'Submit',
                        onPressed: () async {
                          if (validate()) {
                            print('TTTTTTTTTTTTTTTTTTTTTTTTTT');
                            print(widget.id);
                            var item = await databaseInstance
                                .updateFormLangsung(widget.id, {
                              'data_lama_merk': merkController.text,
                              'data_lama_no_reg': noRegController.text,
                              'data_lama_no_seri': noSeriController.text,
                              'data_lama_tahun_pembuatan':
                                  tahunPembuatanController.text,
                              'data_lama_class': classController.text,
                              'data_lama_konstanta': konstantaController.text,
                              'data_lama_rating_arus':
                                  ratingArusController.text,
                              'data_lama_tegangan_nominal':
                                  teganganNominalController.text,
                              'data_lama_stand_kwh_meter':
                                  standKwhMeterController.text,
                              'data_lama_jenis_pembatas':
                                  jenisPembatasController.text,
                              'data_lama_alat_pembatas_merk':
                                  alatPembatasController.text,
                              'data_lama_rating_arus_2':
                                  ratingArus2Controller.text,
                              'data_lama_foto_kwh_meter':
                                  'data:image/png;base64,' +
                                      base64Encode(File(selectedImage!.path)
                                          .readAsBytesSync()),
                              'data_lama_foto_pembatas':
                                  'data:image/png;base64,' +
                                      base64Encode(File(selectedImage2!.path)
                                          .readAsBytesSync()),
                            });

                            print('TTTTTTTTTTTTTTTTTTTTTTTTTT');
                            print(item);

                            if (item != 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return DataBaruFormLangsungPage(
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
