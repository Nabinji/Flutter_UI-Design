import 'package:flutter/material.dart';

class LiveMatch {
  final int awayGoal;
  final int homeGoal;
  final int time; // time of the match (in minutes)
  final String awayLogo;
  final String homeLogo;
  final String awayTitle;
  final String homeTitle;
  final String stadium;
  final int shotOnTarget, possession, yelloCard, redCard, corner;
  final Color color;
  final Color textColors;
  final DecorationImage backgroundImage;
  bool onTheWinner;
// i have create a simple data model for this video
// all the source code link is  in description
  LiveMatch({
    required this.awayGoal,
    required this.homeGoal,
    required this.time,
    required this.stadium,
    required this.awayLogo,
    required this.homeLogo,
    required this.awayTitle,
    required this.homeTitle,
    required this.shotOnTarget,
    required this.possession,
    required this.yelloCard,
    required this.redCard,
    required this.corner,
    required this.color,
    required this.textColors,
    required this.onTheWinner,
    required this.backgroundImage,
  });
}

List<LiveMatch> liveMatches = [
  LiveMatch(
    awayGoal: 3,
    homeGoal: 0,
    stadium: "St James' Park",
    time: 83,
    awayLogo: "assets/football/leicester_city.png",
    homeLogo: "assets/football/chelsea.png",
    awayTitle: "Lester City",
    homeTitle: "Chelsea",
    color: const Color(0xff202020),
    textColors: Colors.white,
    onTheWinner: false,
    backgroundImage: const DecorationImage(
      image: AssetImage("assets/football/pl.png"),
      fit: BoxFit.contain,
      alignment: Alignment.bottomLeft,
      opacity: 0.2,
    ),
    shotOnTarget: 2,
    possession: 60,
    yelloCard: 6,
    redCard: 5,
    corner: 12,
  ),
  LiveMatch(
    awayGoal: 1,
    homeGoal: 2,
    stadium: "London Stadium",
    time: 55,
    onTheWinner: true,
    awayLogo: "assets/football/southampton.png",
    homeLogo: "assets/football/west_ham.png",
    awayTitle: "Southampton",
    homeTitle: "West Ham",
    color: const Color(0xffe4e4e4),
    textColors: Colors.black,
    backgroundImage: const DecorationImage(
      image: AssetImage("assets/football/pl.png"),
      fit: BoxFit.contain,
      alignment: Alignment.bottomLeft,
      opacity: 0.1,
    ),
    shotOnTarget: 5,
    possession: 65,
    yelloCard: 5,
    redCard: 1,
    corner: 8,
  ),
  LiveMatch(
    awayGoal: 0,
    homeGoal: 2,
    stadium: "Camp Nou",
    time: 83,
    awayLogo: "assets/football/bayern.png",
    homeLogo: "assets/football/barcelona.png",
    awayTitle: "Bayern Munich",
    homeTitle: "FC Barcelona",
    onTheWinner: true,
    color: const Color(0xff202020),
    textColors: Colors.white,
    backgroundImage: const DecorationImage(
      image: AssetImage("assets/football/pl.png"),
      fit: BoxFit.contain,
      alignment: Alignment.bottomLeft,
      opacity: 0.3,
    ),
    shotOnTarget: 3,
    possession: 66,
    yelloCard: 2,
    redCard: 2,
    corner: 4,
  ),
  LiveMatch(
    awayGoal: 2,
    homeGoal: 3,
    time: 55,
    stadium: "Etihad Stadium",
    awayLogo: "assets/football/arsenal.png",
    homeLogo: "assets/football/man_city.png",
    awayTitle: "Arsenal",
    homeTitle: "Manchester City",
    onTheWinner: true,
    color: const Color(0xffe4e4e4),
    textColors: Colors.black,
    backgroundImage: const DecorationImage(
      image: AssetImage("assets/football/pl.png"),
      fit: BoxFit.contain,
      alignment: Alignment.bottomLeft,
      opacity: 0.2,
    ),
    shotOnTarget: 5,
    possession: 51,
    yelloCard: 3,
    redCard: 1,
    corner: 8,
  ),
];
