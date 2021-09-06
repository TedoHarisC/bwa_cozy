import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'error_page.dart';

class DetailPage extends StatelessWidget {
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

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/space1.png',
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
                                  'Kuretakeso Hott',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: '\$52',
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
                              children: [
                                SizedBox(height: 2),
                                Image.asset(
                                  'assets/images/stars.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(height: 2),
                                Image.asset(
                                  'assets/images/stars.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(height: 2),
                                Image.asset(
                                  'assets/images/stars.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(height: 2),
                                Image.asset(
                                  'assets/images/stars.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(height: 2),
                                Image.asset(
                                  'assets/images/stars.png',
                                  width: 20,
                                  height: 20,
                                  color: greyColor,
                                ),
                                SizedBox(height: 2),
                              ],
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
                              2,
                            ),
                            FacilityItem(
                              'Bedroom',
                              'assets/images/icon_bed.png',
                              3,
                            ),
                            FacilityItem(
                              'Big Lemari',
                              'assets/images/icon_cupboard.png',
                              2,
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
                          children: [
                            SizedBox(width: 24),
                            Image.asset(
                              'assets/images/photo1.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 18),
                            Image.asset(
                              'assets/images/photo2.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 18),
                            Image.asset(
                              'assets/images/photo3.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 24),
                          ],
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
                              'Jln. Kapan Sukses No. 20\nPalembang',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                  'https://goo.gl/maps/5yZx2yjWB1yR6AeH8',
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
                            launchUrl('tel:+6285727350081');
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
                  Image.asset(
                    'assets/images/btn_wishlist.png',
                    width: 40,
                    height: 40,
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
