import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_langsung/hasil_pemeriksaan.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class WiringAppFormLangsungPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const WiringAppFormLangsungPage({
    Key? key,
    required this.id,
    required this.work,
  }) : super(key: key);

  @override
  State<WiringAppFormLangsungPage> createState() =>
      _WiringAppFormLangsungPage();
}

class _WiringAppFormLangsungPage extends State<WiringAppFormLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController terminal1 = TextEditingController();
  TextEditingController terminal2 = TextEditingController();
  TextEditingController terminal3 = TextEditingController();
  TextEditingController terminal4 = TextEditingController();
  TextEditingController terminal5 = TextEditingController();
  TextEditingController terminal6 = TextEditingController();
  TextEditingController terminal7 = TextEditingController();
  TextEditingController terminal8 = TextEditingController();
  TextEditingController terminal9 = TextEditingController();
  TextEditingController terminal11 = TextEditingController();
  TextEditingController keterangan_wiring_app = TextEditingController();

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
    if (terminal1.text.isEmpty ||
        terminal2.text.isEmpty ||
        terminal3.text.isEmpty ||
        terminal4.text.isEmpty ||
        terminal5.text.isEmpty ||
        terminal6.text.isEmpty ||
        terminal7.text.isEmpty ||
        terminal8.text.isEmpty ||
        terminal9.text.isEmpty ||
        terminal11.text.isEmpty ||
        keterangan_wiring_app.text.isEmpty ||
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
          'Wiring APP',
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
                        title: 'Terminal 1 kWh Meter Tehubung dengan',
                        controller: terminal1,
                      ),
                      CustomFormField(
                        title: 'Terminal 2 kWh Meter Tehubung dengan',
                        controller: terminal2,
                      ),
                      CustomFormField(
                        title: 'Terminal 3 kWh Meter Tehubung dengan',
                        controller: terminal3,
                      ),
                      CustomFormField(
                        title: 'Terminal 4 kWh Meter Tehubung dengan',
                        controller: terminal4,
                      ),
                      CustomFormField(
                        title: 'Terminal 5 kWh Meter Tehubung dengan',
                        controller: terminal5,
                      ),
                      CustomFormField(
                        title: 'Terminal 6 kWh Meter Tehubung dengan',
                        controller: terminal6,
                      ),
                      CustomFormField(
                        title: 'Terminal 7 kWh Meter Tehubung dengan',
                        controller: terminal7,
                      ),
                      CustomFormField(
                        title: 'Terminal 8 kWh Meter Tehubung dengan',
                        controller: terminal8,
                      ),
                      CustomFormField(
                        title: 'Terminal 9 kWh Meter Tehubung dengan',
                        controller: terminal9,
                      ),
                      CustomFormField(
                        title: 'Terminal 11 kWh Meter Tehubung dengan',
                        controller: terminal11,
                      ),
                      CustomFormField(
                        title: 'Keterangan',
                        controller: keterangan_wiring_app,
                        maxLinesText: 4,
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
                              'wiring_terminal1': terminal1.text,
                              'wiring_terminal2': terminal2.text,
                              'wiring_terminal3': terminal3.text,
                              'wiring_terminal4': terminal4.text,
                              'wiring_terminal5': terminal5.text,
                              'wiring_terminal6': terminal6.text,
                              'wiring_terminal7': terminal7.text,
                              'wiring_terminal8': terminal8.text,
                              'wiring_terminal9': terminal9.text,
                              'wiring_terminal11': terminal11.text,
                              'wiring_keterangan_wiring_app':
                                  keterangan_wiring_app.text,
                              'wiring_foto': imagePath,
                            });

                            if (item != 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return HasilPemeriksaanFormLangsungPage(
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
