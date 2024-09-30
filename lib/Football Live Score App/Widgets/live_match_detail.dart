import 'package:flutter/material.dart';

import '../Screens/match_detail_screen.dart';
import '../constants.dart';

class LiveMatchDetail extends StatelessWidget {
  const LiveMatchDetail({
    super.key,
    required this.widget,
  });

  final MatchDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25,
      left: 25,
      right: 25,
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.liveMatch.color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -230,
              child: Transform.rotate(
                angle: 45,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    "assets/football/cl.png",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Text(
                    widget.liveMatch.stadium,
                    style: TextStyle(
                      fontSize: 15,
                      color: widget.liveMatch.textColors,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Image.asset(
                        widget.liveMatch.homeLogo,
                        width: 90,
                        height: 90,
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffFFF4E5),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: kprimaryColor,
                                  size: 10,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Live",
                                  style: TextStyle(
                                    color: kprimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.liveMatch.homeGoal.toString(),
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: widget.liveMatch.onTheWinner
                                        ? kprimaryColor
                                        : widget.liveMatch.textColors,
                                  ),
                                ),
                                TextSpan(
                                  text: " : ${widget.liveMatch.awayGoal}",
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: widget.liveMatch.onTheWinner
                                        ? widget.liveMatch.textColors
                                        : kprimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        widget.liveMatch.awayLogo,
                        width: 90,
                        height: 90,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 20,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 15,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          right: 50,
                          left: 0,
                          top: 0,
                          bottom: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kprimaryColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              "ST",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: MediaQuery.of(context).size.width / 2 -
                              MediaQuery.of(context).size.width / 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Text(
                              "HT",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -1,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Text(
                              "FT",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
