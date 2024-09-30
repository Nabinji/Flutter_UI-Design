import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Football%20Live%20Score%20App/Model/live_match_model.dart';
import 'package:flutter_ui_design/Football%20Live%20Score%20App/Model/up_coming_model.dart';
import 'package:iconsax/iconsax.dart';
import '../constants.dart';
import 'match_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              elevation: 0.2,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Iconsax.category),
              ),
            ),
          ),
          const Spacer(),
          const Row(
            children: [
              Text(
                "S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  letterSpacing: -2,
                ),
              ),
              Icon(
                Icons.sports_soccer,
                color: kprimaryColor,
                size: 25,
              ),
              Text(
                "ccer ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: -2,
                ),
              ),
              Text(
                "Nerds",
                style: TextStyle(
                  color: kprimaryColor,
                  fontSize: 30,
                  letterSpacing: -2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              elevation: 0.2,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Iconsax.notification),
              ),
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Text(
                  "Live Match",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    letterSpacing: -1.5,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black12.withOpacity(0.08),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/football/pl.png",
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        "Premier League",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              itemCount: liveMatches.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final liveMatch = liveMatches[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchScreen(
                          liveMatch: liveMatch,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 230,
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      color: liveMatch.color,
                      borderRadius: BorderRadius.circular(35),
                      image: liveMatch.backgroundImage,
                    ),
                    child: Column(
                      children: [
                        Text(
                          liveMatch.stadium,
                          style: TextStyle(
                            color: liveMatch.textColors,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -1,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Week 13",
                          style: TextStyle(
                            color: liveMatch.textColors,
                            letterSpacing: -1,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // home team logo and name
                            Column(
                              children: [
                                Image.asset(
                                  liveMatch.homeLogo,
                                  width: 90,
                                  height: 90,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  liveMatch.homeTitle.toUpperCase(),
                                  style: TextStyle(
                                    color: liveMatch.textColors,
                                    fontSize: 16,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 13,
                                    letterSpacing: -1,
                                    color: liveMatch.textColors,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(width: 20),
                            // time and score
                            Column(
                              children: [
                                const SizedBox(height: 5),
                                Text(
                                  "${liveMatch.time}'",
                                  style: TextStyle(
                                    color: liveMatch.textColors,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${liveMatch.homeGoal} : ",
                                        style: TextStyle(
                                          fontSize: 36,
                                          color: liveMatch.onTheWinner
                                              ? kprimaryColor
                                              : liveMatch.textColors,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: liveMatch.awayGoal.toString(),
                                        style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                          color: liveMatch.onTheWinner
                                              ? liveMatch.textColors
                                              : kprimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            // away team logo and name
                            Column(
                              children: [
                                Image.asset(
                                  liveMatch.awayLogo,
                                  width: 90,
                                  height: 90,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  liveMatch.awayTitle.toUpperCase(),
                                  style: TextStyle(
                                    color: liveMatch.textColors,
                                    fontSize: 16,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Away",
                                  style: TextStyle(
                                    fontSize: 13,
                                    letterSpacing: -1,
                                    color: liveMatch.textColors,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Text(
                  "Up-Coming Matches",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    letterSpacing: -1.5,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: kprimaryColor,
                  ),
                  child: const Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: upcomingMatches.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final upMatch = upcomingMatches[index];
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: upMatch.isFavorite
                                  ? kprimaryColor
                                  : Colors.black12,
                              offset: const Offset(0, -5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              upMatch.homeTitle,
                              style: TextStyle(
                                fontSize: 16.5,
                                letterSpacing: -1,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Image.asset(
                                  upMatch.homeLogo,
                                  height: 45,
                                  width: 45,
                                ),
                                const Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 11,
                                    letterSpacing: -1,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  upMatch.time,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  upMatch.date,
                                  style: const TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                Image.asset(
                                  upMatch.awayLogo,
                                  height: 45,
                                  width: 45,
                                ),
                                const Text(
                                  "Away",
                                  style: TextStyle(
                                    fontSize: 11,
                                    letterSpacing: -1,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Text(
                              upMatch.awayTitle,
                              style: TextStyle(
                                fontSize: 16.5,
                                letterSpacing: -1,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(
                          Icons.star,
                          color:
                              upMatch.isFavorite ? kprimaryColor : Colors.white,
                          size: 18,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
