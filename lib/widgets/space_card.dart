import 'package:bwa_cozy/models/space.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

// ignore: must_be_immutable
class SpaceCard extends StatelessWidget {
  Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 130,
            height: 110,
            child: Stack(
              children: [
                Image.asset(space.imageUrl),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/stars.png',
                            width: 22,
                          ),
                          Text(
                            '${space.rating.toString()}/5',
                            style: whiteTextStyle.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              space.name,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(height: 2),
            Text.rich(
              TextSpan(
                text: '\$${space.price.toString()} ',
                style: purpleTextStyle.copyWith(
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: '/ month',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '${space.city}, ${space.country}',
              style: greyTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
