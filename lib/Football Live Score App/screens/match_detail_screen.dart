import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Football%20Live%20Score%20App/Model/live_match_model.dart';
import 'package:flutter_ui_design/Football%20Live%20Score%20App/Widgets/live_match_stats.dart';
import 'package:flutter_ui_design/Football%20Live%20Score%20App/constants.dart';
import 'package:iconsax/iconsax.dart';

import '../Widgets/live_match_detail.dart';

class MatchDetailScreen extends StatefulWidget {
  final LiveMatch liveMatch;
  const MatchDetailScreen({super.key, required this.liveMatch});

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
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
      appBar: headerParts(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120),
              padding: const EdgeInsets.only(top: 180, right: 20, left: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 40,
                    )
                  ]),
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
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  LiveMatchStats(
                    homeStats: widget.liveMatch.shotOnTarget,
                    awayStats: widget.liveMatch.shotOnTarget *2,
                    title: "Shots  On Target",
                    homeValue: widget.liveMatch.shotOnTarget.toDouble()/10,
                    awayValue: widget.liveMatch.shotOnTarget.toDouble()*2/10,
                    isHomeWinner: false,
                  ),
                   LiveMatchStats(
                    homeStats: widget.liveMatch.homeGoal,
                    awayStats: widget.liveMatch.awayGoal,
                    title: "Goals",
                    homeValue: widget.liveMatch.homeGoal.toDouble() / 5,
                    awayValue: widget.liveMatch.awayGoal.toDouble() * 2 / 5,
                    isHomeWinner: true,
                  ),
                  LiveMatchStats(
                    homeStats: widget.liveMatch.possession,
                    awayStats: 100 - widget.liveMatch.possession,
                    title: "Possession",
                    homeValue:
                        widget.liveMatch.possession.toDouble() * 1.1 / 100,
                    awayValue: widget.liveMatch.possession.toDouble() / 100,
                    isHomeWinner: true,
                  ),
                  LiveMatchStats(
                    homeStats: widget.liveMatch.yelloCard,
                    awayStats: widget.liveMatch.yelloCard + 1,
                    title: "Yellow Cards",
                    homeValue: widget.liveMatch.yelloCard.toDouble() / 10,
                    awayValue: widget.liveMatch.yelloCard.toDouble() * 2 / 10,
                    isHomeWinner: false,
                  ),
                  LiveMatchStats(
                    homeStats: widget.liveMatch.redCard - 1,
                    awayStats: widget.liveMatch.redCard,
                    title: "Red Cards",
                    homeValue: widget.liveMatch.redCard.toDouble() / 10,
                    awayValue: widget.liveMatch.redCard.toDouble() * 2 / 10,
                    isHomeWinner: false,
                  ),
                  LiveMatchStats(
                    homeStats: widget.liveMatch.corner,
                    awayStats: widget.liveMatch.corner - 1,
                    title: "Corner Kicks",
                    homeValue: widget.liveMatch.redCard.toDouble() / 5,
                    awayValue: widget.liveMatch.redCard.toDouble() / 5,
                    isHomeWinner: true,
                  ),
                ],
              ),
            ),
            LiveMatchDetail(widget: widget),
          ],
        ),
      ),
    );
  }

  AppBar headerParts(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: detailBackgroundColor,
      actions: [
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
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
                letterSpacing: -1,
              ),
            ),
            Text(
              "GROUP STAGE",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                letterSpacing: -1,
              ),
            )
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            elevation: 1,
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
    );
  }
}
