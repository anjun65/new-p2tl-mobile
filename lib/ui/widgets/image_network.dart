import 'dart:convert';

import 'package:p2tl/shared/theme.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String title;
  final String content;

  const ImageNetwork({
    Key? key,
    required this.title,
    this.content = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          if (content != '')
            Center(
              child: Container(
                height: 300,
                child: Image.network(content),
              ),
            ),
        ],
      ),
    );
  }
}
