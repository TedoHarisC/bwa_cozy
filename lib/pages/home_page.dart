import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/bottom_navbar_item.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: 24),
            //NOTE: TITLE HEADER
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
            //NOTE: POPULAR CITIES
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 24),
                  CityCard(
                    City(
                      1,
                      'Jakarta',
                      'assets/images/city1.png',
                      false,
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      2,
                      'Bandung',
                      'assets/images/city2.png',
                      true,
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      3,
                      'Surabaya',
                      'assets/images/city3.png',
                      false,
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      4,
                      'Palembang',
                      'assets/images/city4.png',
                      false,
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      5,
                      'Aceh',
                      'assets/images/city5.png',
                      true,
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      6,
                      'Bogor',
                      'assets/images/city6.png',
                      false,
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
            SizedBox(height: 30),
            //NOTE: RECOMMENDED SPACE
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: FutureBuilder(
                future: spaceProvider.getRecomenddedSpace(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            // NOTE: TIPS & GUIDANCE
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                children: [
                  TipsCard(
                    Tips(1, 'City Guidelines', 'assets/images/tips1.png',
                        'Updated 20 Apr'),
                  ),
                  SizedBox(height: 20),
                  TipsCard(
                    Tips(2, 'Jakarta Fairship', 'assets/images/tips2.png',
                        'Updated 11 Dec'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 74 + 24),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (2 * 24),
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/Icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
