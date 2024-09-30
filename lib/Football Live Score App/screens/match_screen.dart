import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Football%20Live%20Score%20App/Model/live_match_model.dart';
import 'package:iconsax/iconsax.dart';
import '../constants.dart';
import '../widgets/stats_chart.dart';

class MatchScreen extends StatefulWidget {
  final LiveMatch liveMatch;
  const MatchScreen({super.key, required this.liveMatch});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  List<Map<String, dynamic>> tabs = [
    {
      "label": "Stats",
    },
    {
      "label": "H2H",
    },
    {
      "label": "Table",
    },
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: detailBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: detailBackgroundColor,
        centerTitle: true,
        actions: [
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              elevation: 01,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Iconsax.arrow_square_left),
                ),
              ),
            ),
          ),
          const Spacer(),
          const Column(
            children: [
              Text(
                "Champions League",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1),
              ),
              Text(
                "GROUP STAGE",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: -1,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              elevation: 01,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Iconsax.more_square),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120),
              padding: const EdgeInsets.only(top: 180, right: 20, left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 20,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      tabs.length,
                      (index) {
                        final tab = tabs[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? kprimaryColor
                                : detailBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            tab["label"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  StatsChart(
                    homeStats: widget.liveMatch.shotOnTarget,
                    awayStats: widget.liveMatch.shotOnTarget * 2,
                    title: "Shots On Target",
                    homeValue: widget.liveMatch.shotOnTarget.toDouble() / 10,
                    awayValue:
                        widget.liveMatch.shotOnTarget.toDouble() * 2 / 10,
                    isHomeWinner: false,
                  ),
                  StatsChart(
                    homeStats: widget.liveMatch.homeGoal,
                    awayStats: widget.liveMatch.awayGoal,
                    title: "Goals",
                    homeValue: widget.liveMatch.homeGoal.toDouble() / 5,
                    awayValue: widget.liveMatch.awayGoal.toDouble() * 2 / 5,
                    isHomeWinner: true,
                  ),
                  StatsChart(
                    homeStats: widget.liveMatch.possession,
                    awayStats: 100 - widget.liveMatch.possession,
                    title: "Possession",
                    homeValue:
                        widget.liveMatch.possession.toDouble() * 1.1 / 100,
                    awayValue: widget.liveMatch.possession.toDouble() / 100,
                    isHomeWinner: true,
                  ),
                  StatsChart(
                    homeStats: widget.liveMatch.yelloCard,
                    awayStats: widget.liveMatch.yelloCard + 1,
                    title: "Yellow Cards",
                    homeValue: widget.liveMatch.yelloCard.toDouble() / 10,
                    awayValue: widget.liveMatch.yelloCard.toDouble() * 2 / 10,
                    isHomeWinner: false,
                  ),
                  StatsChart(
                    homeStats: widget.liveMatch.redCard - 1,
                    awayStats: widget.liveMatch.redCard,
                    title: "Red Cards",
                    homeValue: widget.liveMatch.redCard.toDouble() / 10,
                    awayValue: widget.liveMatch.redCard.toDouble() * 2 / 10,
                    isHomeWinner: false,
                  ),
                  StatsChart(
                    homeStats: widget.liveMatch.corner,
                    awayStats: widget.liveMatch.corner - 1,
                    title: "Corner Kicks",
                    homeValue: widget.liveMatch.redCard.toDouble() / 2,
                    awayValue: widget.liveMatch.redCard.toDouble() / 2,
                    isHomeWinner: true,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              left: 20,
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
                      left: 0,
                      child: Transform.rotate(
                        angle: 45,
                        child: Opacity(
                          opacity: 0.2,
                          child: Image.asset("assets/football/cl.png"),
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
                              fontSize: 14,
                              color: widget.liveMatch.textColors,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Image.asset(
                                widget.liveMatch.homeLogo,
                                width: 85,
                                height: 85,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: widget.liveMatch.homeGoal
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 36,
                                            color: widget.liveMatch.onTheWinner
                                                ? kprimaryColor
                                                : widget.liveMatch.textColors,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              " : ${widget.liveMatch.awayGoal}",
                                          style: TextStyle(
                                            fontSize: 36,
                                            color: widget.liveMatch.onTheWinner
                                                ? widget.liveMatch.textColors
                                                : kprimaryColor,
                                            fontWeight: FontWeight.bold,
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
                                width: 85,
                                height: 85,
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  right: 60,
                                  left: 0,
                                  top: 3,
                                  bottom: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kprimaryColor,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
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
                                  top: 0,
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
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
