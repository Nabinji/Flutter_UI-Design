import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Travel-Mobile-App/const.dart';
import '../models/destination_model.dart';
import '../widgets/popular_place.dart';
import '../widgets/recomendate.dart';
import 'package:iconsax/iconsax.dart';
import 'place_detail.dart';

class TravelHomeScreen extends StatefulWidget {
  const TravelHomeScreen({super.key});

  @override
  State<TravelHomeScreen> createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen> {
  int selectedPage = 0;
  List<IconData> icons = [
    Iconsax.home1,
    Iconsax.search_normal,
    Icons.confirmation_number_outlined,
    Icons.bookmark_outline,
    Icons.person_outline
  ];
  List<Destination> popular =
      destinations.where((element) => element.category == 'popular').toList();
  List<Destination> recomend =
      destinations.where((element) => element.category == 'recomend').toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 180,
        leading: const Row(
          children: [
            SizedBox(width: 15),
            Icon(
              Iconsax.location,
              color: Colors.black,
            ),
            SizedBox(width: 5),
            Text(
              'Jawa Timur',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: Colors.black26,
            )
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black12),
            ),
            padding: const EdgeInsets.all(7),
            child: Stack(
              children: [
                const Icon(
                  Iconsax.notification,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular place',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    color: blueTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              children: List.generate(
                popular.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaceDetailScreen(
                            destination: popular[index],
                          ),
                        ),
                      );
                    },
                    child: PopularPlace(
                      destination: popular[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recomendation for you',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    color: blueTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: List.generate(
                  recomend.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceDetailScreen(
                              destination: recomend[index],
                            ),
                          ),
                        );
                      },
                      child: Recomendate(
                        destination: recomend[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 22,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            icons.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPage = index;
                                });
                              },
                              child: Icon(
                                icons[index],
                                size: 32,
                                color: selectedPage == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
