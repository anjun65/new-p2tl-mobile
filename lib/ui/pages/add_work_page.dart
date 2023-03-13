import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2tl/blocs/work/bloc/work_bloc.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';

import 'package:p2tl/ui/widgets/image_picker_form.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'dart:math';

class AddWorkPage extends StatefulWidget {
  const AddWorkPage({Key? key}) : super(key: key);

  @override
  State<AddWorkPage> createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
  late VideoPlayerController _controller;
  // VideoPlayerController? _controller;
  // Future<void>? _initializeVideoPlayerFuture;

  // void dispose() {
  //   _controller!.dispose();
  //   super.dispose();
  // }

  final idPelangganController = TextEditingController(text: '');
  final keteranganP2tlController = TextEditingController(text: '');
  final alamatController = TextEditingController(text: '');
  final tarifController = TextEditingController(text: '');
  final dayaController = TextEditingController(text: '');
  final rbmController = TextEditingController(text: '');
  final lgkhController = TextEditingController(text: '');
  final fkmController = TextEditingController(text: '');
  final p1Controller = TextEditingController(text: '');
  final p2Controller = TextEditingController(text: '');
  final p3Controller = TextEditingController(text: '');
  final p4Controller = TextEditingController(text: '');
  final p5Controller = TextEditingController(text: '');
  final p6Controller = TextEditingController(text: '');
  final p7Controller = TextEditingController(text: '');
  final p8Controller = TextEditingController(text: '');
  final p9Controller = TextEditingController(text: '');
  final p10Controller = TextEditingController(text: '');
  final imageController = TextEditingController(text: '');
  final videoController = TextEditingController(text: '');
  final regusIdController = TextEditingController(text: '');
  final namaPelangganController = TextEditingController(text: '');
  final latitudeController = TextEditingController(text: '');
  final longitudeController = TextEditingController(text: '');

  DatabaseInstance databaseInstance = DatabaseInstance();

  List<String>? jenis;
  List<String>? status;

  String? selectedJenis;
  String? selectedStatus;

  @override
  void initState() {
    // TODO: implement initState
    databaseInstance.database();

    jenis = ['1L', '3L', '3TL'];
    status = [
      'Tidak Ada Orang',
      'Rumah Kosong',
      'Pemeriksaan dengan BA',
    ];

    selectedStatus = status![0];
    selectedJenis = jenis![0];

    super.initState();
  }

  bool validate() {
    if (idPelangganController.text.isEmpty ||
        alamatController.text.isEmpty ||
        tarifController.text.isEmpty ||
        dayaController.text.isEmpty ||
        rbmController.text.isEmpty ||
        lgkhController.text.isEmpty ||
        fkmController.text.isEmpty ||
        p1Controller.text.isEmpty ||
        p2Controller.text.isEmpty ||
        p3Controller.text.isEmpty ||
        p4Controller.text.isEmpty ||
        p5Controller.text.isEmpty ||
        p6Controller.text.isEmpty ||
        p7Controller.text.isEmpty ||
        p8Controller.text.isEmpty ||
        p9Controller.text.isEmpty ||
        p10Controller.text.isEmpty ||
        namaPelangganController.text.isEmpty ||
        latitudeController.text.isEmpty ||
        longitudeController.text.isEmpty ||
        selectedImage == null ||
        selectedVideo == null) {
      return false;
    }

    return true;
  }

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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Layanan lokasi dinonaktifkan, Silahkan dihidupkan',
          ),
          backgroundColor: redColor,
        ),
      );
      return Future.error('Layanan lokasi dinonaktifkan, Silahkan dihidupkan');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Izin akses lokasi ditolak',
            ),
            backgroundColor: redColor,
          ),
        );
        return Future.error('Izin akses lokasi ditolak');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Izin akses lokasi ditolak secara permanen. Aplikasi tidak bisa meminta izin.',
          ),
          backgroundColor: redColor,
        ),
      );

      return Future.error(
          'Izin akses lokasi ditolak secara permanen. Aplikasi tidak bisa meminta izin.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    var geo = await Geolocator.getCurrentPosition();

    setState(() {
      latitudeController.text = geo.latitude.toString();
      longitudeController.text = geo.longitude.toString();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Lokasi Berhasil didapatkan',
        ),
        backgroundColor: greenColor,
      ),
    );

    return geo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Target Operasi',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
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
                  title: 'ID Pelanggan',
                  controller: idPelangganController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'Nama Pelanggan',
                  controller: namaPelangganController,
                ),
                CustomFormField(
                  title: 'Alamat Pelanggan',
                  controller: alamatController,
                ),
                Text(
                  'Jenis P2TL',
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
                CustomFormField(
                  title: 'Tarif',
                  controller: tarifController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'Daya',
                  controller: dayaController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'RBM',
                  controller: rbmController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'LGKH',
                  controller: lgkhController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'FKM',
                  controller: fkmController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P1',
                  controller: p1Controller,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P2',
                  controller: p2Controller,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P3',
                  controller: p3Controller,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P4',
                  controller: p4Controller,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P5',
                  controller: p5Controller,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P6',
                  controller: p6Controller,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P7',
                  controller: p7Controller,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P8',
                  controller: p8Controller,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P9',
                  controller: p9Controller,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'P10',
                  controller: p10Controller,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                CustomFilledButton(
                  title: 'Tambahkan Lokasi',
                  onPressed: _determinePosition,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                CustomFormField(
                  title: 'Latitude',
                  controller: latitudeController,
                ),
                CustomFormField(
                  title: 'Longitude',
                  controller: longitudeController,
                ),
                Text(
                  'Keterangan',
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
                    value: selectedStatus!,
                    isExpanded: true,
                    underline: SizedBox(),
                    items: status!
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
                        selectedStatus = item;
                      });
                    },
                  ),
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
                  height: 24,
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
                  height: 16,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomFilledButton(
                  title: 'Submit',
                  onPressed: () async {
                    if (validate()) {
                      await databaseInstance.insert({
                        'works_id': Random().nextInt(99999) + 10000,
                        'id_pelanggan': idPelangganController.text,
                        'nama_pelanggan': namaPelangganController.text,
                        'latitude': latitudeController.text,
                        'longitude': longitudeController.text,
                        'alamat': alamatController.text,
                        'jenis_p2tl': selectedJenis,
                        'tarif': tarifController.text,
                        'daya': dayaController.text,
                        'rbm': rbmController.text,
                        'lgkh': lgkhController.text,
                        'fkm': fkmController.text,
                        'keterangan_p2tl': selectedStatus,
                        'P1': p1Controller.text,
                        'P2': p2Controller.text,
                        'P3': p3Controller.text,
                        'P4': p4Controller.text,
                        'P5': p5Controller.text,
                        'P6': p6Controller.text,
                        'P7': p7Controller.text,
                        'P8': p8Controller.text,
                        'P9': p9Controller.text,
                        'P10': p10Controller.text,
                        'image': imagePath,
                        'video': video_path,
                        'isLuar': 1,
                        'createdAt':
                            DateTime.now().toIso8601String().split('T').first,
                      });

                      Navigator.pop(context);
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
