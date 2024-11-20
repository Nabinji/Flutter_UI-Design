import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../Config/responsive.dart';
import '../Utils/colors.dart';

class BarChartRepresentation extends StatelessWidget {
  const BarChartRepresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: _generateBarGroups(context),
        borderData: FlBorderData(show: false),
        alignment: BarChartAlignment.spaceBetween,
        gridData: const FlGridData(
          drawHorizontalLine: true,
          horizontalInterval: 30,
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 30,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Text('0',
                        style: TextStyle(fontSize: 12, color: Colors.grey));
                  case 30:
                    return const Text('10k',
                        style: TextStyle(fontSize: 12, color: Colors.grey));
                  case 60:
                    return const Text('50k',
                        style: TextStyle(fontSize: 12, color: Colors.grey));
                  case 90:
                    return const Text('100k',
                        style: TextStyle(fontSize: 12, color: Colors.grey));
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                final months = [
                  'JAN',
                  'FEB',
                  'MAR',
                  'APR',
                  'MAY',
                  'JUN',
                  'JUL',
                  'AUG',
                  'SEP',
                  'OCT',
                  'NOV',
                  'DEC'
                ];
                if (value.toInt() >= 0 && value.toInt() < months.length) {
                  return Text(months[value.toInt()],
                      style: const TextStyle(fontSize: 12, color: Colors.grey));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
      swapAnimationDuration: const Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );
  }

  List<BarChartGroupData> _generateBarGroups(BuildContext context) {
    final List<double> values = [
      20,
      35,
      50,
      90,
      60,
      40,
      25,
      15,
      70,
      90,
      70,
      60
    ];
    return List.generate(values.length, (index) {
      return BarChartGroupData(
        x: index,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: values[index],
            color: Colors.black,
            width: Responsive.isDesktop(context) ? 40 : 10,
            borderRadius: BorderRadius.zero,
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 90,
              color: MyAppColor.barBg,
            ),
          ),
        ],
      );
    });
  }
}
