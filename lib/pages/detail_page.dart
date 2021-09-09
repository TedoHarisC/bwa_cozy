import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';
import 'package:bwa_cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'error_page.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future showConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: const Text(
                'Apakah kamu ingin menghubungi pemilik penginapan ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Hubungi');
                  launchUrl('tel:${widget.space.phone}');
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(height: 328),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '/ month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map(
                                (index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child:
                                        RatingItem(index, widget.space.rating),
                                  );
                                },
                              ).toList(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      //NOTE : MAIN FACILITIES
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              'Kitchen',
                              'assets/images/icon_kitchen.png',
                              widget.space.numberOfKitchens,
                            ),
                            FacilityItem(
                              'Bedroom',
                              'assets/images/icon_bed.png',
                              widget.space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              'Big Lemari',
                              'assets/images/icon_cupboard.png',
                              widget.space.numberOfCupboards,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      //NOTE : Photos
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.space.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(left: 24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 30),
                      // NOTE : LOCATION
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address}\n${widget.space.city}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                  widget.space.mapUrl,
                                );
                                // launchUrl('qwertty');
                              },
                              child: Image.asset(
                                'assets/images/btn_map.png',
                                width: 40,
                                height: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * 24),
                        child: RaisedButton(
                          color: purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          onPressed: () {
                            showConfirmation();
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked
                          ? 'assets/images/btn_wishlist_filled.png'
                          : 'assets/images/btn_wishlist.png',
                      width: 40,
                      height: 40,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
