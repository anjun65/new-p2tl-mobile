import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_tidak_langsung/data_app_lanjutan.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DataAppFormTidakLangsungPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const DataAppFormTidakLangsungPage({
    Key? key,
    required this.work,
    required this.id,
  }) : super(key: key);

  @override
  State<DataAppFormTidakLangsungPage> createState() =>
      _DataAppFormTidakLangsungPage();
}

class _DataAppFormTidakLangsungPage
    extends State<DataAppFormTidakLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController merkController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController kwhMerkController = TextEditingController();
  TextEditingController kwhNoRegController = TextEditingController();
  TextEditingController kwhNoSeriController = TextEditingController();
  TextEditingController kwhTahunController = TextEditingController();
  TextEditingController kwhKonstantaController = TextEditingController();
  TextEditingController kwhClassController = TextEditingController();
  TextEditingController kwhRatingController = TextEditingController();
  TextEditingController kwhTeganganController = TextEditingController();
  TextEditingController kwhStandLbpController = TextEditingController();
  TextEditingController kwhStandBpController = TextEditingController();
  TextEditingController kwhStandKwhTotalController = TextEditingController();
  TextEditingController kwhStandKvarhController = TextEditingController();

  XFile? selectedImage;
  XFile? selectedImage2;

  String? imagePath;
  String? imagePath2;

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

  selectImage2() async {
    final imagePicker = ImagePicker();
    final XFile? image2 = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    final filename = DateTime.now().millisecondsSinceEpoch.toString();
    final file = File('$path/$filename.jpg');

    // Copy the video file to the new file
    await image2!.saveTo(file.path);

    imagePath2 = '$path/$filename.jpg';

    if (image2 != null) {
      setState(() {
        selectedImage2 = image2;
      });
    }
  }

  List<String>? tegangan;
  List<String>? jenis;
  List<String>? kedudukan;
  List<String>? jenisAlatPembatas;

  String? selectedTegangan;
  String? selectedJenis;
  String? selectedKedudukan;
  String? selectedJenisAlatPembatas;

  bool validate() {
    if (merkController.text.isEmpty ||
        ratingController.text.isEmpty ||
        kwhMerkController.text.isEmpty ||
        kwhNoRegController.text.isEmpty ||
        kwhNoSeriController.text.isEmpty ||
        kwhTahunController.text.isEmpty ||
        kwhKonstantaController.text.isEmpty ||
        kwhClassController.text.isEmpty ||
        kwhRatingController.text.isEmpty ||
        kwhTeganganController.text.isEmpty ||
        kwhStandLbpController.text.isEmpty ||
        kwhStandBpController.text.isEmpty ||
        kwhStandKwhTotalController.text.isEmpty ||
        kwhStandKvarhController.text.isEmpty ||
        selectedImage == null ||
        selectedImage2 == null) {
      return false;
    }

    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    databaseInstance.database();

    tegangan = ['380 Volt', '20 kV', '150 kV'];
    jenis = ['Primer; Sekunder dengan CT', 'Primer; Sekunder dengan CT dan PT'];
    kedudukan = [
      'Di dalam bangunan pelanggan',
      'Di luar bangunan pelanggan',
      'Di gardu'
    ];

    jenisAlatPembatas = [
      'MCCB',
      'NFB',
      'HRC',
      'Relay',
    ];

    selectedTegangan = tegangan![0];
    selectedJenis = jenis![0];
    selectedKedudukan = kedudukan![0];
    selectedJenisAlatPembatas = jenisAlatPembatas![0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data APP',
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
                        'Tegangan Tersambung',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 24),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButton(
                          value: selectedTegangan!,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: tegangan!
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: medium,
                                    ),
                                  )))
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              selectedTegangan = item;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Jenis Pengukuran',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 24),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButton(
                          value: selectedJenis!,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: jenis!
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: medium,
                                    ),
                                  )))
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              selectedJenis = item;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Tempat Kedudukan APP',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 24),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButton(
                          value: selectedKedudukan!,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: kedudukan!
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: medium,
                                    ),
                                  )))
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              selectedKedudukan = item;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Alat Pembatas',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Jenis',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 24),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButton(
                          value: selectedJenisAlatPembatas!,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: jenisAlatPembatas!
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: blackTextStyle.copyWith(
                                      fontWeight: medium,
                                    ),
                                  )))
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              selectedJenisAlatPembatas = item;
                            });
                          },
                        ),
                      ),
                      CustomFormField(
                        title: 'Merk/Type',
                        controller: merkController,
                      ),
                      CustomFormField(
                        title: 'Rating Arus (ln)',
                        controller: ratingController,
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
                        height: 8,
                      ),
                      Text(
                        'kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomFormField(
                        title: 'Merk/Type',
                        controller: kwhMerkController,
                      ),
                      CustomFormField(
                        title: 'No. Register',
                        controller: kwhNoRegController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'No. Seri',
                        controller: kwhNoSeriController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Tahun Buat',
                        controller: kwhTahunController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Konstanta',
                        controller: kwhKonstantaController,
                      ),
                      CustomFormField(
                        title: 'Class Akurasi',
                        controller: kwhClassController,
                      ),
                      CustomFormField(
                        title: 'Rating Arus (ln)',
                        controller: kwhRatingController,
                      ),
                      CustomFormField(
                        title: 'Tegangan',
                        controller: kwhTeganganController,
                      ),
                      CustomFormField(
                        title: 'Stand Mtr LBP',
                        controller: kwhStandLbpController,
                      ),
                      CustomFormField(
                        title: 'Stand Mtr BP',
                        controller: kwhStandBpController,
                      ),
                      CustomFormField(
                        title: 'Stand kWhTotal',
                        controller: kwhStandKwhTotalController,
                      ),
                      CustomFormField(
                        title: 'Stand Mtr kVArh',
                        controller: kwhStandKvarhController,
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
                            var item = await databaseInstance
                                .updateFormTidakLangsung(widget.id, {
                              'data_tegangan_tersambung': selectedTegangan,
                              'data_jenis_pengukuran': selectedJenis,
                              'data_tempat_kedudukan': selectedKedudukan,
                              'pembatas_jenis': selectedJenisAlatPembatas,
                              'pembatas_merk': merkController.text,
                              'pembatas_rating_arus': ratingController.text,
                              'pembatas_foto_pembatas': imagePath,
                              'kwh_merk': kwhMerkController.text,
                              'kwh_no_reg': kwhNoRegController.text,
                              'kwh_no_seri': kwhNoSeriController.text,
                              'kwh_tahun': kwhTahunController.text,
                              'kwh_konstanta': kwhKonstantaController.text,
                              'kwh_class': kwhClassController.text,
                              'kwh_rating_arus': kwhRatingController.text,
                              'kwh_tegangan': kwhTeganganController.text,
                              'kwh_lbp': kwhStandLbpController.text,
                              'kwh_bp': kwhStandBpController.text,
                              'kwh_total': kwhStandKwhTotalController.text,
                              'kwh_kvarh': kwhStandKvarhController.text,
                              'kwh_foto': imagePath2,
                            });

                            if (item != 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return DataAppLanjutanFormTidakLangsungPage(
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
