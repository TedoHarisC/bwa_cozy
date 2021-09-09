import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem(this.index, this.rating);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? 'assets/images/stars.png'
          : 'assets/images/stars_grey.png',
      width: 20,
      height: 20,
    );
  }
}
