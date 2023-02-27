import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class UjiAkurasiFormKalibrasiPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const UjiAkurasiFormKalibrasiPage({
    Key? key,
    required this.work,
    required this.id,
  }) : super(key: key);

  @override
  State<UjiAkurasiFormKalibrasiPage> createState() =>
      _UjiAkurasiFormKalibrasiPage();
}

class _UjiAkurasiFormKalibrasiPage extends State<UjiAkurasiFormKalibrasiPage> {
  late VideoPlayerController _controller;
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController tegangan100Controller = TextEditingController();
  TextEditingController tegangan50Controller = TextEditingController();
  TextEditingController tegangan5Controller = TextEditingController();
  TextEditingController arus100Controller = TextEditingController();
  TextEditingController arus50Controller = TextEditingController();
  TextEditingController arus5Controller = TextEditingController();
  TextEditingController akurasi100Controller = TextEditingController();
  TextEditingController akurasi50Controller = TextEditingController();
  TextEditingController akurasi5Controller = TextEditingController();
  TextEditingController keterangan100Controller = TextEditingController();
  TextEditingController keterangan50Controller = TextEditingController();
  TextEditingController keterangan5Controller = TextEditingController();
  TextEditingController merkUjiController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController noSeriUjiController = TextEditingController();
  TextEditingController kesimpulanUjiController = TextEditingController();

  XFile? selectedVideo;
  String? video_path;

  selectVideo() async {
    final imagePicker = ImagePicker();
    final XFile? video = await imagePicker.pickVideo(
      source: ImageSource.camera,
      maxDuration: Duration(seconds: 15),
    );

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    // Create a new file with a unique name
    final filename = DateTime.now().millisecondsSinceEpoch.toString();
    final file = File('$path/$filename.mp4');

    // Copy the video file to the new file
    await video!.saveTo(file.path);

    video_path = '$path/$filename.mp4';

    if (video != null) {
      _controller = VideoPlayerController.file(file)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });

      setState(() {
        selectedVideo = video;
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
    if (tegangan100Controller.text.isEmpty ||
        tegangan50Controller.text.isEmpty ||
        tegangan5Controller.text.isEmpty ||
        arus100Controller.text.isEmpty ||
        arus50Controller.text.isEmpty ||
        arus5Controller.text.isEmpty ||
        akurasi100Controller.text.isEmpty ||
        akurasi50Controller.text.isEmpty ||
        akurasi5Controller.text.isEmpty ||
        keterangan100Controller.text.isEmpty ||
        keterangan50Controller.text.isEmpty ||
        keterangan5Controller.text.isEmpty ||
        merkUjiController.text.isEmpty ||
        typeController.text.isEmpty ||
        noSeriUjiController.text.isEmpty ||
        kesimpulanUjiController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil Uji Akurasi',
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
                        'Beban 100% IN',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Tegangan',
                        controller: tegangan100Controller,
                      ),
                      CustomFormField(
                        title: 'Arus',
                        controller: arus100Controller,
                      ),
                      CustomFormField(
                        title: 'Nilai Akurasi',
                        controller: akurasi100Controller,
                      ),
                      CustomFormField(
                        title: 'Keterangan',
                        controller: keterangan100Controller,
                        maxLinesText: 4,
                      ),
                      Text(
                        'Beban 50% IN',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Tegangan',
                        controller: tegangan50Controller,
                      ),
                      CustomFormField(
                        title: 'Arus',
                        controller: arus50Controller,
                      ),
                      CustomFormField(
                        title: 'Nilai Akurasi',
                        controller: akurasi50Controller,
                      ),
                      CustomFormField(
                        title: 'Keterangan',
                        controller: keterangan50Controller,
                        maxLinesText: 4,
                      ),
                      Text(
                        'Beban 5% IN',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Tegangan',
                        controller: tegangan5Controller,
                      ),
                      CustomFormField(
                        title: 'Arus',
                        controller: arus5Controller,
                      ),
                      CustomFormField(
                        title: 'Nilai Akurasi',
                        controller: akurasi5Controller,
                      ),
                      CustomFormField(
                        title: 'Keterangan',
                        controller: keterangan5Controller,
                        maxLinesText: 4,
                      ),
                      Text(
                        'Alat Uji',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Merk Uji',
                        controller: merkUjiController,
                      ),
                      CustomFormField(
                        title: 'Type',
                        controller: typeController,
                      ),
                      CustomFormField(
                        title: 'No. Seri',
                        controller: noSeriUjiController,
                        keyboardType: TextInputType.number,
                      ),
                      CustomFormField(
                        title: 'Kesimpulan',
                        controller: kesimpulanUjiController,
                        maxLinesText: 4,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Video Lokasi',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectVideo();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: selectedVideo != null
                                    ? Column(
                                        children: [
                                          AspectRatio(
                                            aspectRatio:
                                                _controller.value.aspectRatio,
                                            child: VideoPlayer(_controller),
                                          ),
                                          Center(
                                            child: IconButton(
                                              icon: Icon(
                                                _controller.value.isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                size: 30,
                                              ),
                                              color: Colors.blue,
                                              onPressed: () {
                                                setState(() {
                                                  _controller.value.isPlaying
                                                      ? _controller.pause()
                                                      : _controller.play();
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        height: 100,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/ic_upload.png',
                                            width: 32,
                                          ),
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
                            var video = null;

                            if (selectedVideo != null) {
                              video = video_path;
                            }

                            var item = await databaseInstance
                                .updateFormKalibrasi(widget.id, {
                              'uji_tegangan_100': tegangan100Controller.text,
                              'uji_arus_100': arus100Controller.text,
                              'uji_nilai_akurasi_100':
                                  akurasi100Controller.text,
                              'uji_keterangan_100':
                                  keterangan100Controller.text,
                              'uji_tegangan_50': tegangan50Controller.text,
                              'uji_arus_50': arus50Controller.text,
                              'uji_nilai_akurasi_50': akurasi50Controller.text,
                              'uji_keterangan_50': keterangan50Controller.text,
                              'uji_tegangan_5': tegangan5Controller.text,
                              'uji_arus_5': arus5Controller.text,
                              'uji_nilai_akurasi_5': akurasi5Controller.text,
                              'uji_keterangan_5': keterangan5Controller.text,
                              'uji_merk': merkUjiController.text,
                              'uji_type': typeController.text,
                              'uji_no_seri': noSeriUjiController.text,
                              'uji_kesimpulan': kesimpulanUjiController.text,
                              'uji_video': video,
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
