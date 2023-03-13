import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/tidak_langsung_model.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_tidak_langsung/data_app.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class SaksiFormTidakLangsungPage extends StatefulWidget {
  final WorkModel work;

  final TidakLangsungModel? langsung;

  const SaksiFormTidakLangsungPage(
      {Key? key, required this.work, this.langsung})
      : super(key: key);

  @override
  State<SaksiFormTidakLangsungPage> createState() =>
      _SaksiFormTidakLangsungPage();
}

class _SaksiFormTidakLangsungPage extends State<SaksiFormTidakLangsungPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController nameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController identitasController = TextEditingController();
  TextEditingController telponController = TextEditingController();
  TextEditingController pekerjaanController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Target Operasi',
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
                        title: 'Nama Saksi',
                        controller: nameController,
                      ),
                      CustomFormField(
                        title: 'Alamat Saksi',
                        controller: alamatController,
                      ),
                      CustomFormField(
                        title: 'Nomor Identitas Saksi',
                        controller: identitasController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Pekerjaan Saksi',
                        controller: pekerjaanController,
                      ),
                      CustomFormField(
                        title: 'No Telpon Saksi',
                        controller: telponController,
                        keyboardType: TextInputType.number,
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
                          var identitas_saksi = null;

                          if (selectedImage != null) {
                            identitas_saksi = imagePath;
                          }

                          var item =
                              await databaseInstance.insertFormTidakLangsung({
                            'works_id': widget.work!.works_id,
                            'nama_saksi': nameController.text,
                            'alamat_saksi': alamatController.text,
                            'nomor_identitas': identitasController.text,
                            'no_telpon_saksi': telponController.text,
                            'pekerjaan': pekerjaanController.text,
                            'file_nomor_identitas': identitas_saksi,
                            'createdAt': DateTime.now()
                                .toIso8601String()
                                .split('T')
                                .first,
                          });

                          Navigator.push(context,
                              MaterialPageRoute(builder: (builder) {
                            return DataAppFormTidakLangsungPage(
                              work: widget.work,
                              id: item,
                            );
                          }));
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
