import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_langsung/pemeriksaan_terminal.dart';
import 'package:p2tl/ui/pages/form_tidak_langsung/pemeriksaan_pelindung_ct.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class PemeriksaanPelindungKwhFormTidakLangsungPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const PemeriksaanPelindungKwhFormTidakLangsungPage({
    Key? key,
    required this.id,
    required this.work,
  }) : super(key: key);

  @override
  State<PemeriksaanPelindungKwhFormTidakLangsungPage> createState() =>
      _PemeriksaanPelindungKwhFormTidakLangsungPage();
}

class _PemeriksaanPelindungKwhFormTidakLangsungPage
    extends State<PemeriksaanPelindungKwhFormTidakLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController nomorTahunKodeController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController postTahunKodeController = TextEditingController();

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

  List<String>? peralatan;
  List<String>? segel;
  List<String>? post_peralatan;
  List<String>? post_segel;

  String? selectedperalatan;
  String? selectedsegel;
  String? selectedpost_peralatan;
  String? selectedpost_segel;

  @override
  void initState() {
    // TODO: implement initState
    databaseInstance.database();
    peralatan = ['Ada', 'Tidak Ada'];
    segel = ['Ada', 'Tidak Ada'];
    post_peralatan = ['Ada', 'Tidak Ada'];
    post_segel = ['Ada', 'Tidak Ada'];

    selectedperalatan = peralatan![0];
    selectedsegel = segel![0];
    selectedpost_peralatan = post_peralatan![0];
    selectedpost_segel = post_segel![0];
    super.initState();
  }

  bool validate() {
    if (nomorTahunKodeController.text.isEmpty ||
        keteranganController.text.isEmpty ||
        postTahunKodeController.text.isEmpty ||
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
          'Data Pemeriksaan',
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
                        'Pintu Box APP / Pelindung kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
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
                      Text(
                        'Peralatan',
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
                          value: selectedperalatan!,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: peralatan!
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
                              selectedperalatan = item;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Segel',
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
                          value: selectedsegel!,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: peralatan!
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
                              selectedsegel = item;
                            });
                          },
                        ),
                      ),
                      CustomFormField(
                        title: 'Nomor, Tahun, Kode, Segel',
                        controller: nomorTahunKodeController,
                      ),
                      CustomFormField(
                        title: 'Keterangan',
                        controller: keteranganController,
                        maxLinesText: 4,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Ketika Pemeriksaan',
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
                        'Kondisi Setelah Pemeriksaan',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Peralatan',
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
                          value: selectedpost_peralatan!,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: post_peralatan!
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
                              selectedpost_peralatan = item;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Segel',
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
                          value: selectedpost_segel!,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: post_segel!
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
                              selectedpost_segel = item;
                            });
                          },
                        ),
                      ),
                      CustomFormField(
                        title: 'Nomor, Tahun , Kode Segel',
                        controller: postTahunKodeController,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Sesudah Pemeriksaan',
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
                              'pelindung_kwh_peralatan': selectedperalatan,
                              'pelindung_kwh_segel': selectedsegel,
                              'pelindung_kwh_nomor_tahun_kode_segel':
                                  nomorTahunKodeController.text,
                              'pelindung_kwh_keterangan':
                                  keteranganController.text,
                              'pelindung_kwh_foto_sebelum':
                                  'data:image/png;base64,' +
                                      base64Encode(File(selectedImage!.path)
                                          .readAsBytesSync()),
                              'pelindung_kwh_post_peralatan':
                                  selectedpost_peralatan,
                              'pelindung_kwh_post_segel': selectedpost_segel,
                              'pelindung_kwh_post_nomor_tahun_kode_segel':
                                  postTahunKodeController.text,
                              'pelindung_kwh_foto_sesudah':
                                  'data:image/png;base64,' +
                                      base64Encode(File(selectedImage2!.path)
                                          .readAsBytesSync()),
                            });

                            if (item != 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PemeriksaanPelindungCtFormTidakLangsungPage(
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
