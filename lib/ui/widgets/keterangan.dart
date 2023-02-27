import 'package:p2tl/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextKeterangan extends StatelessWidget {
  final String title;
  final String content;

  const CustomTextKeterangan({
    Key? key,
    required this.title,
    required this.content,
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
            height: 8,
          ),
          Text(
            content,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
