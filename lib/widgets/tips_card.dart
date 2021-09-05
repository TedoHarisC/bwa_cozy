import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TipsCard extends StatelessWidget {
  Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            tips.imageUrl,
            width: 80,
            height: 80,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.title,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(height: 4),
              Text(
                tips.updatedAt,
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ),
          )
        ],
      ),
    );
  }
}
