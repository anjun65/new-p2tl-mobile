import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class HasilPemeriksaanFormTidakLangsungPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const HasilPemeriksaanFormTidakLangsungPage({
    Key? key,
    required this.id,
    required this.work,
  }) : super(key: key);

  @override
  State<HasilPemeriksaanFormTidakLangsungPage> createState() =>
      _HasilPemeriksaanFormTidakLangsungPage();
}

class _HasilPemeriksaanFormTidakLangsungPage
    extends State<HasilPemeriksaanFormTidakLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController hasilController = TextEditingController();
  TextEditingController kesimpulanController = TextEditingController();
  TextEditingController tindakanController = TextEditingController();
  TextEditingController barangBuktiController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  bool isTeruskan = false;

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
    if (hasilController.text.isEmpty ||
        kesimpulanController.text.isEmpty ||
        tindakanController.text.isEmpty ||
        barangBuktiController.text.isEmpty ||
        tanggalController.text.isEmpty ||
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
          'Hasil Pemeriksaan',
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
                      CustomFormField(
                        title: 'Hasil Pemeriksaan',
                        controller: hasilController,
                        maxLinesText: 4,
                      ),
                      CustomFormField(
                        title: 'Kesimpulan Hasil Pemeriksaan',
                        controller: kesimpulanController,
                        maxLinesText: 4,
                      ),
                      CustomFormField(
                        title: 'Tindakan yang Dilakukan',
                        controller: tindakanController,
                        maxLinesText: 4,
                      ),
                      CustomFormField(
                        title: 'Barang Bukti yang diambil',
                        controller: barangBuktiController,
                        maxLinesText: 4,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              'Teruskan ke lab?',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            const Spacer(),
                            Checkbox(
                              value: this.isTeruskan,
                              onChanged: (value) {
                                setState(() {
                                  isTeruskan = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Diminta ke Kantor tanggal",
                        style: blackTextStyle,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black)),
                        child: TextField(
                          controller: tanggalController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: blackTextStyle,
                              hintText: 'Masukkan Barang Bukti yang Diambil'),
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            tanggalController.text =
                                date.toString().substring(0, 10);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Barang Bukti',
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
                            var teruskan = 0;
                            if (isTeruskan == true) {
                              var teruskan = 1;
                            }
                            var item = await databaseInstance
                                .updateFormTidakLangsung(widget.id, {
                              'akhir_hasil_pemeriksaan': hasilController.text,
                              'akhir_kesimpulan': kesimpulanController.text,
                              'akhir_tindakan': tindakanController.text,
                              'akhir_barang_bukti': barangBuktiController.text,
                              'akhir_tanggal_penyelesaian':
                                  tanggalController.text,
                              'akhir_foto_barang_bukti':
                                  'data:image/png;base64,' +
                                      base64Encode(File(selectedImage!.path)
                                          .readAsBytesSync()),
                              'akhir_labor': teruskan,
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
