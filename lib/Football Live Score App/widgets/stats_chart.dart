import 'package:flutter/material.dart';

import '../constants.dart';

class StatsChart extends StatelessWidget {
  final int homeStats, awayStats;
  final String title;
  final double homeValue;
  final double awayValue;

  final bool isHomeWinner;
  const StatsChart({
    super.key,
    required this.homeStats,
    required this.awayStats,
    required this.title,
    required this.homeValue,
    required this.awayValue,
    required this.isHomeWinner,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                homeStats.toString(),
                style: TextStyle(
                  color: isHomeWinner ? kprimaryColor : ksecondryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                awayStats.toString(),
                style: TextStyle(
                  color: !isHomeWinner ? kprimaryColor : ksecondryColor,
                  fontSize: 16,letterSpacing: -1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: RotatedBox(
                  quarterTurns: 2,
                  child: LinearProgressIndicator(
                    value: homeValue,
                    minHeight: 10,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation(
                      isHomeWinner ? kprimaryColor : ksecondryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: LinearProgressIndicator(
                  value: awayValue,
                  minHeight: 10,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation(
                    !isHomeWinner ? kprimaryColor : ksecondryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
