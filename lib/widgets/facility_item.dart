import 'package:flutter/material.dart';

import '../theme.dart';

// ignore: must_be_immutable
class FacilityItem extends StatelessWidget {
  String name;
  String imageUrl;
  int total;

  FacilityItem(this.name, this.imageUrl, this.total);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          this.imageUrl,
          width: 32,
        ),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: '$total',
            style: purpleTextStyle.copyWith(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: ' $name',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
