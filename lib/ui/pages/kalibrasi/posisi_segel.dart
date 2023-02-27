import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/kalibrasi/uji_akurasi.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class PosisiSegelFormKalibrasiPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const PosisiSegelFormKalibrasiPage({
    Key? key,
    required this.work,
    required this.id,
  }) : super(key: key);

  @override
  State<PosisiSegelFormKalibrasiPage> createState() =>
      _PosisiSegelFormKalibrasiPage();
}

class _PosisiSegelFormKalibrasiPage
    extends State<PosisiSegelFormKalibrasiPage> {
  late VideoPlayerController _controller;
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController atasAController = TextEditingController();
  TextEditingController atasBController = TextEditingController();
  TextEditingController atasKeteranganController = TextEditingController();
  TextEditingController kananAController = TextEditingController();
  TextEditingController kananBController = TextEditingController();
  TextEditingController kananKeteranganController = TextEditingController();
  TextEditingController kiriAController = TextEditingController();
  TextEditingController kiriBController = TextEditingController();
  TextEditingController kiriKeteranganController = TextEditingController();

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
    if (atasAController.text.isEmpty ||
        atasBController.text.isEmpty ||
        atasKeteranganController.text.isEmpty ||
        kananAController.text.isEmpty ||
        kananBController.text.isEmpty ||
        kananKeteranganController.text.isEmpty ||
        kiriAController.text.isEmpty ||
        kiriBController.text.isEmpty ||
        kiriKeteranganController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posisi Segel',
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
                        'Sisi Atas kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Kode Segel Sisi A',
                        controller: atasAController,
                      ),
                      CustomFormField(
                        title: 'Kode Segel Sisi B',
                        controller: atasBController,
                      ),
                      CustomFormField(
                        title: 'Keterangan',
                        controller: atasKeteranganController,
                        maxLinesText: 4,
                      ),
                      Text(
                        'Sisi Kanan kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Kode Segel Sisi A',
                        controller: kananAController,
                      ),
                      CustomFormField(
                        title: 'Kode Segel Sisi B',
                        controller: kananBController,
                      ),
                      CustomFormField(
                        title: 'Keterangan',
                        controller: kananKeteranganController,
                        maxLinesText: 4,
                      ),
                      Text(
                        'Sisi Kiri kWh Meter',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomFormField(
                        title: 'Kode Segel Sisi A',
                        controller: kiriAController,
                      ),
                      CustomFormField(
                        title: 'Kode Segel Sisi B',
                        controller: kiriBController,
                      ),
                      CustomFormField(
                        title: 'Keterangan',
                        controller: kiriKeteranganController,
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
                              'posisi_atas_a': atasAController.text,
                              'posisi_atas_b': atasBController.text,
                              'posisi_atas_c': atasKeteranganController.text,
                              'posisi_kanan_a': kananAController.text,
                              'posisi_kanan_b': kananBController.text,
                              'posisi_kanan_c': kananKeteranganController.text,
                              'posisi_kiri_a': kiriAController.text,
                              'posisi_kiri_b': kiriBController.text,
                              'posisi_kiri_c': kiriKeteranganController.text,
                              'posisi_video': video,
                            });

                            if (item != 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return UjiAkurasiFormKalibrasiPage(
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
