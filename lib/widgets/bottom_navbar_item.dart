import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavbarItem extends StatelessWidget {
  var imageUrl;
  var isActive;

  BottomNavbarItem({this.imageUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          this.imageUrl,
          width: 26,
          height: 26,
        ),
        Spacer(),
        this.isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
