import 'package:flutter/material.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/kalibrasi/posisi_segel.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:video_player/video_player.dart';

class KwhMeterFormKalibrasiPage extends StatefulWidget {
  final WorkModel work;
  final int id;

  const KwhMeterFormKalibrasiPage({
    Key? key,
    required this.work,
    required this.id,
  }) : super(key: key);

  @override
  State<KwhMeterFormKalibrasiPage> createState() =>
      _KwhMeterFormKalibrasiPage();
}

class _KwhMeterFormKalibrasiPage extends State<KwhMeterFormKalibrasiPage> {
  late VideoPlayerController _controller;
  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController merkController = TextEditingController();
  TextEditingController noRegController = TextEditingController();
  TextEditingController noSeriController = TextEditingController();
  TextEditingController tahunPembuatanController = TextEditingController();
  TextEditingController konstantaController = TextEditingController();
  TextEditingController ratingArusController = TextEditingController();
  TextEditingController teganganNominalController = TextEditingController();
  TextEditingController standKwhMeterController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController ClassController = TextEditingController();

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
    if (merkController.text.isEmpty ||
        noRegController.text.isEmpty ||
        noSeriController.text.isEmpty ||
        tahunPembuatanController.text.isEmpty ||
        konstantaController.text.isEmpty ||
        ratingArusController.text.isEmpty ||
        teganganNominalController.text.isEmpty ||
        standKwhMeterController.text.isEmpty ||
        keteranganController.text.isEmpty ||
        ClassController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data kWh Meter',
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
                        controller: ClassController,
                        keyboardType: TextInputType.number,
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
                              'kwh_merk': merkController.text,
                              'kwh_no_reg': noRegController.text,
                              'kwh_no_seri': noSeriController.text,
                              'kwh_tahun_pembuatan':
                                  tahunPembuatanController.text,
                              'kwh_class': ClassController.text,
                              'kwh_konstanta': konstantaController.text,
                              'kwh_rating_arus': ratingArusController.text,
                              'kwh_tegangan_nominal':
                                  teganganNominalController.text,
                              'kwh_stand_kwh': standKwhMeterController.text,
                              'kwh_keterangan': keteranganController.text,
                              'kwh_video': video,
                            });

                            if (item != 0) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return PosisiSegelFormKalibrasiPage(
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
