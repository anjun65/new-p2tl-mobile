import 'package:flutter/material.dart';
import 'package:p2tl/models/work_online_model.dart';
import 'package:p2tl/shared/theme.dart';

class WorkItem extends StatelessWidget {
  final WorkOnlineModel works;

  const WorkItem({
    Key? key,
    required this.works,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: whiteColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ('assets/ic_house.png'),
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                works.namaPelanggan!.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                works.idPelanggan!.toString(),
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(works.status.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
