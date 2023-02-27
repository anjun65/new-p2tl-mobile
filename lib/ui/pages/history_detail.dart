import 'package:flutter/material.dart';
import 'package:p2tl/blocs/work/bloc/work_bloc.dart';
import 'package:p2tl/models/work_online_model.dart';
import 'package:p2tl/shared/helpers.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2tl/ui/widgets/header.dart';
import 'package:p2tl/ui/widgets/image_network.dart';
import 'package:p2tl/ui/widgets/keterangan.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:p2tl/ui/widgets/work_item.dart';
import 'package:video_player/video_player.dart';

class HistoryDetailPage extends StatefulWidget {
  final WorkOnlineModel work;

  const HistoryDetailPage({
    Key? key,
    required this.work,
  }) : super(key: key);

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
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
                        title: 'Status',
                        content: widget.work.status!,
                      ),
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
                      CustomTextField(
                          title: 'Komentar',
                          content: widget.work.komentar ?? '-'),
                      CustomTextKeterangan(
                        title: 'Keterangan',
                        content: widget.work.keteranganP2tl!,
                      ),
                      ImageNetwork(
                        title: 'Foto',
                        content:
                            'https://new.momen-kita.com/storage/${widget.work!.image}' ??
                                '',
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        'Video',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
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
                  ),
                ),
              ],
            ),
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
