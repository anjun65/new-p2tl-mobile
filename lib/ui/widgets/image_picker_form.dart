import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p2tl/shared/theme.dart';

class ImagePickerForm extends StatefulWidget {
  const ImagePickerForm({super.key});

  @override
  State<ImagePickerForm> createState() => _ImagePickerFormState();
}

class _ImagePickerFormState extends State<ImagePickerForm> {
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
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
    );
  }
}
