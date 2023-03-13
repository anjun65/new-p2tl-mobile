import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:p2tl/core.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/kalibrasi_model.dart';
import 'package:p2tl/models/langsung_model.dart';
import 'package:p2tl/models/pengambilan_model.dart';
import 'package:p2tl/models/tidak_langsung_model.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/pages/form_langsung/lihat_ba.dart';
import 'package:p2tl/ui/pages/form_langsung/saksi.dart';
import 'package:p2tl/ui/pages/form_tidak_langsung/lihat_ba.dart';
import 'package:p2tl/ui/pages/form_tidak_langsung/saksi.dart';
import 'package:p2tl/ui/pages/kalibrasi/lihat_ba.dart';
import 'package:p2tl/ui/pages/kalibrasi/saksi.dart';
import 'package:p2tl/ui/pages/pengambilan_barang_bukti/lihat_ba.dart';
import 'package:p2tl/ui/pages/pengambilan_barang_bukti/saksi.dart';
import 'package:p2tl/ui/widgets/HomeServiceItem.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/forms.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class DetailWorkPage extends StatefulWidget {
  final WorkModel work;

  const DetailWorkPage({Key? key, required this.work}) : super(key: key);

  @override
  State<DetailWorkPage> createState() => _DetailWorkPageState();
}

class _DetailWorkPageState extends State<DetailWorkPage> {
  late VideoPlayerController _controller;

  String? roles;

  DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController alasanController = TextEditingController();

  List<String>? status;

  String? selectedStatus;

  XFile? selectedImage;
  String? image_path;

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

    image_path = '$path/$filename.jpg';

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

  Future<void> getRoles() async {
    var new_roles = await AuthService().getRoles();

    setState(() {
      roles = new_roles;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    databaseInstance.database();

    status = [
      'Belum Dikerjakan',
      'Tidak Ada Orang',
      'Rumah Kosong',
      'Pemeriksaan dengan BA',
    ];

    selectedStatus = status![0];

    getRoles();

    // if (widget.work.keteranganP2tl != null) {
    //   setState(() {
    //     selectedStatus = widget.work.keteranganP2tl;
    //   });
    // }

    // if (widget.work. image != null) {
    //   setState(() {
    //     selectedImage = XFile(widget.work.image!);
    //   });
    // }

    // if (widget.work.video != null) {
    //   selectedVideo = XFile(widget.work.video!);
    //   setState(() {
    //     _controller = VideoPlayerController.file(File(widget.work.video!))
    //       ..initialize().then((_) {
    //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //         setState(() {});
    //       });
    //   });
    // }

    // selectedStatus = widget.work.keteranganP2tl ?? status![0];
    // if (widget.work.image != null) {
    //   Uint8List image = base64.decode(widget.work.image!);

    //   XFile xfile = XFile(image.path);

    //   selectedImage = xfile.writeAsBytesSync(image);
    // }
    super.initState();
  }

  bool validate() {
    if (selectedImage == null || selectedVideo == null) {
      return false;
    }

    return true;
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
                      CustomTextField(
                          title: 'Nomor BA',
                          content: widget.work.id.toString().padLeft(5, '0')),
                      CustomTextField(
                          title: 'Latitude',
                          content: widget.work.latitude.toString()),
                      CustomTextField(
                          title: 'Longitude',
                          content: widget.work.longitude.toString()),
                      CustomTextField(
                          title: 'Tarif',
                          content: widget.work.tarif.toString()),
                      CustomTextField(
                          title: 'daya', content: widget.work.daya.toString()),
                      CustomTextField(
                          title: 'rbm', content: widget.work.rbm.toString()),
                      CustomTextField(
                          title: 'lgkh', content: widget.work.lgkh.toString()),
                      CustomTextField(
                          title: 'fkm', content: widget.work.fkm.toString()),
                      CustomTextField(
                          title: 'rbm', content: widget.work.rbm.toString()),

                      CustomTextField(
                          title: 'Jenis P2TL',
                          content: widget.work.jenis_p2tl.toString()),

                      CustomTextField(
                          title: 'P1', content: widget.work.P1.toString()),

                      CustomTextField(
                          title: 'P2', content: widget.work.P2.toString()),

                      CustomTextField(
                          title: 'P3', content: widget.work.P3.toString()),

                      CustomTextField(
                          title: 'P4', content: widget.work.P4.toString()),

                      CustomTextField(
                          title: 'P5', content: widget.work.P5.toString()),

                      CustomTextField(
                          title: 'P6', content: widget.work.P6.toString()),

                      CustomTextField(
                          title: 'P7', content: widget.work.P7.toString()),

                      CustomTextField(
                          title: 'P8', content: widget.work.P8.toString()),

                      CustomTextField(
                          title: 'P9', content: widget.work.P9.toString()),

                      CustomTextField(
                          title: 'P10', content: widget.work.P10.toString()),

                      CustomTextField(
                          title: 'Surat Tugas\nP2TL',
                          content: widget.work.surat_tugas_p2tl ?? '-'),

                      CustomTextField(
                          title: 'Tanggal Surat\nTugas P2TL',
                          content: widget.work.tanggal_surat_tugas_p2tl ?? '-'),

                      CustomTextField(
                          title: 'Surat Tugas\nTNI',
                          content: widget.work.surat_tugas_p2tl ?? '-'),

                      CustomTextField(
                          title: 'Tanggal Surat\nTugas TNI',
                          content: widget.work.tanggal_surat_tugas_p2tl ?? '-'),

                      // CustomTextField(
                      //     title: 'Pendamping 1',
                      //     content: widget.work.pendamping1_id ?? '-'),

                      // CustomTextField(
                      //     title: 'Pendamping 2',
                      //     content: widget.work.pendamping1_id ?? ''),

                      // CustomTextField(
                      //     title: 'Tanggal Inspeksi',
                      //     content: widget.work.tanggal_inspeksi ?? '-'),

                      CustomTextField(
                          title: 'Komentar',
                          content: widget.work.komentar ?? '-'),
                      // status_pelanggaran = json['status_pelanggaran'];

                      // labor = json['labor'];

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

                      selectedStatus != 'Belum Dikerjakan'
                          ? Container()
                          : Container(
                              child: CustomFormField(
                                title: 'Alasan belum dikerjakan',
                                controller: alasanController,
                                maxLinesText: 4,
                              ),
                            ),

                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Foto Lokasi',
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
                        height: 24.0,
                      ),

                      CustomFilledButton(
                        title: 'Ubah Data Target Operasi',
                        onPressed: () async {
                          if (validate()) {
                            var item = await databaseInstance
                                .update(widget.work!.id!, {
                              'keterangan_p2tl': selectedStatus,
                              'alasan': alasanController.text,
                              'image': image_path,
                              'video': video_path,
                            });

                            if (item != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Data Berhasil Dimasukkan',
                                  ),
                                  backgroundColor: greenColor,
                                ),
                              );
                              setState(() {});
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
                      ),

                      buildServices(context),

                      const SizedBox(
                        height: 12.0,
                      ),

                      // CustomFilledButton(
                      //   title: 'Tambah BA',
                      //   onPressed: () async {
                      //     LangsungModel item = await databaseInstance
                      //         .searchFormLangsung(widget.work!.id!);

                      //     if (item != null) {
                      //       Navigator.push(context,
                      //           MaterialPageRoute(builder: (builder) {
                      //         return SaksiFormLangsungPage(
                      //           work: widget.work,
                      //           langsung: item,
                      //         );
                      //       }));
                      //     }

                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (builder) {
                      //       return SaksiFormLangsungPage(
                      //         work: widget.work,
                      //       );
                      //     }));
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 12.0,
                      // ),

                      // CustomFilledButton(
                      //   title: 'Lihat BA',
                      //   onPressed: () async {
                      //     LangsungModel item = await databaseInstance
                      //         .searchFormLangsung(widget.work!.id!);
                      //     if (item != LangsungModel()) {
                      //       Navigator.push(context,
                      //           MaterialPageRoute(builder: (builder) {
                      //         return LihatFormLangsungPage(
                      //           work: widget.work,
                      //           langsung: item,
                      //         );
                      //       }));
                      //     } else {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //           content: const Text(
                      //             'Belum ada BA yang diinput',
                      //           ),
                      //           backgroundColor: redColor,
                      //         ),
                      //       );
                      //     }
                      //   },
                      // ),

                      // const SizedBox(
                      //   height: 12.0,
                      // ),

                      // CustomFilledButton(
                      //   title: 'Tambah BA Tidak Langsung',
                      //   onPressed: () {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (builder) {
                      //       return SaksiFormTidakLangsungPage(
                      //         work: widget.work,
                      //       );
                      //     }));
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 12.0,
                      // ),

                      // CustomFilledButton(
                      //   title: 'Lihat BA Tidak Langsung',
                      //   onPressed: () async {
                      //     TidakLangsungModel item = await databaseInstance
                      //         .searchFormTidakLangsung(widget.work!.id!);

                      //     if (item != null) {
                      //       Navigator.push(context,
                      //           MaterialPageRoute(builder: (builder) {
                      //         return LihatFormTidakLangsungPage(
                      //           work: widget.work,
                      //           langsung: item,
                      //         );
                      //       }));
                      //     } else {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //           content: const Text(
                      //             'Belum ada BA yang diinput',
                      //           ),
                      //           backgroundColor: redColor,
                      //         ),
                      //       );
                      //     }
                      //   },
                      // ),

                      // const SizedBox(
                      //   height: 12.0,
                      // ),

                      // CustomFilledButton(
                      //   title: 'Tambah BA Kalibrasi',
                      //   onPressed: () {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (builder) {
                      //       return SaksiFormKalibrasiPage(
                      //         work: widget.work,
                      //       );
                      //     }));
                      //   },
                      // ),

                      // const SizedBox(
                      //   height: 12.0,
                      // ),

                      // CustomFilledButton(
                      //   title: 'Lihat BA Kalibrasi',
                      //   onPressed: () async {
                      //     KalibrasiModel item = await databaseInstance
                      //         .searchFormKalibrasi(widget.work!.id!);

                      //     if (item != null) {
                      //       Navigator.push(context,
                      //           MaterialPageRoute(builder: (builder) {
                      //         return LihatFormKablirasiPage(
                      //           work: widget.work,
                      //           kalibrasi: item,
                      //         );
                      //       }));
                      //     } else {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //           content: const Text(
                      //             'Belum ada BA yang diinput',
                      //           ),
                      //           backgroundColor: redColor,
                      //         ),
                      //       );
                      //     }
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 12.0,
                      // ),
                      // CustomFilledButton(
                      //   title: 'BA Pengambilan Barang Bukti',
                      //   onPressed: () {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (builder) {
                      //       return SaksiFormBarangBuktiPage(
                      //         work: widget.work,
                      //       );
                      //     }));
                      //   },
                      // ),
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

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aksi',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Column(
            children: [
              roles == 'PETUGAS LAPANGAN' && widget.work.jenis_p2tl != '3TL'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeServiceItem(
                          iconUrl: 'assets/ic_add.png',
                          title: 'Tambah BA\n Langsung',
                          onTap: () async {
                            if (widget.work.works_id != null) {
                              LangsungModel item = await databaseInstance
                                  .searchFormLangsung(widget.work!.works_id!);

                              if (item != null) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (builder) {
                                  return SaksiFormLangsungPage(
                                    work: widget.work,
                                    langsung: item,
                                  );
                                }));
                              }
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) {
                                  return SaksiFormLangsungPage(
                                    work: widget.work,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        HomeServiceItem(
                          iconUrl: 'assets/ic_view.png',
                          title: 'Lihat BA\nLangsung',
                          onTap: () async {
                            LangsungModel item = await databaseInstance
                                .searchFormLangsung(widget.work!.works_id!);

                            if (item != LangsungModel()) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return LihatFormLangsungPage(
                                  work: widget.work,
                                  langsung: item,
                                );
                              }));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Belum ada BA yang diinput',
                                  ),
                                  backgroundColor: redColor,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 12.0,
              ),
              roles == 'PETUGAS LAPANGAN' && widget.work.jenis_p2tl == '3TL'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeServiceItem(
                          iconUrl: 'assets/ic_add.png',
                          title: 'Tambah BA\nTidak Langsung',
                          onTap: () async {
                            TidakLangsungModel item =
                                await databaseInstance.searchFormTidakLangsung(
                                    widget.work!.works_id!);

                            if (item != null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return SaksiFormTidakLangsungPage(
                                  work: widget.work,
                                  langsung: item,
                                );
                              }));
                            }

                            Navigator.push(context,
                                MaterialPageRoute(builder: (builder) {
                              return SaksiFormTidakLangsungPage(
                                work: widget.work,
                              );
                            }));
                          },
                        ),
                        HomeServiceItem(
                          iconUrl: 'assets/ic_view.png',
                          title: 'Lihat BA\nTidak Langsung',
                          onTap: () async {
                            TidakLangsungModel item =
                                await databaseInstance.searchFormTidakLangsung(
                                    widget.work!.works_id!);

                            if (item != null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return LihatFormTidakLangsungPage(
                                  work: widget.work,
                                  langsung: item,
                                );
                              }));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Belum ada BA yang diinput',
                                  ),
                                  backgroundColor: redColor,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 12.0,
              ),
              roles == 'LABOR'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeServiceItem(
                          iconUrl: 'assets/ic_add.png',
                          title: 'Tambah BA\nKalibrasi',
                          onTap: () async {
                            KalibrasiModel item = await databaseInstance
                                .searchFormKalibrasi(widget.work!.works_id!);

                            if (item != null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return SaksiFormKalibrasiPage(
                                  work: widget.work,
                                  kalibrasi: item,
                                );
                              }));
                            }

                            Navigator.push(context,
                                MaterialPageRoute(builder: (builder) {
                              return SaksiFormKalibrasiPage(
                                work: widget.work,
                              );
                            }));
                          },
                        ),
                        HomeServiceItem(
                          iconUrl: 'assets/ic_view.png',
                          title: 'Lihat BA\nKalibrasi',
                          onTap: () async {
                            KalibrasiModel item = await databaseInstance
                                .searchFormKalibrasi(widget.work!.works_id!);

                            if (item != null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return LihatFormKablirasiPage(
                                  work: widget.work,
                                  kalibrasi: item,
                                );
                              }));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Belum ada BA yang diinput',
                                  ),
                                  backgroundColor: redColor,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 12.0,
              ),
              roles == 'PETUGAS LAPANGAN'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeServiceItem(
                          iconUrl: 'assets/ic_add.png',
                          title: 'Tambah BA \nPengambilan BB',
                          onTap: () async {
                            PengambilanModel item = await databaseInstance
                                .searchFormPengambilan(widget.work!.works_id!);

                            if (item != null) {
                              print('already');
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return SaksiFormBarangBuktiPage(
                                  work: widget.work,
                                  pengambilan: item,
                                );
                              }));
                            }
                            Navigator.push(context,
                                MaterialPageRoute(builder: (builder) {
                              return SaksiFormBarangBuktiPage(
                                work: widget.work,
                              );
                            }));
                          },
                        ),
                        HomeServiceItem(
                          iconUrl: 'assets/ic_view.png',
                          title: 'Lihat BA\nPengambilan BB',
                          onTap: () async {
                            PengambilanModel item = await databaseInstance
                                .searchFormPengambilan(widget.work!.works_id!);
                            if (item != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) {
                                    return LihatFormBarangBuktiPage(
                                      work: widget.work,
                                      pengambilan: item,
                                    );
                                  },
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Belum ada BA yang diinput',
                                  ),
                                  backgroundColor: redColor,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
