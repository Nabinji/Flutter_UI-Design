import 'dart:ui';
import '../Utils/color.dart';

class Budget {
  final String name;
  final String icon;
  final String spendAmount;
  final String totalBudget;
  final String leftAmount;
  final Color color;

  Budget({
    required this.name,
    required this.icon,
    required this.spendAmount,
    required this.totalBudget,
    required this.leftAmount,
    required this.color,
  });
}

final List<Budget> budgets = [
  Budget(
    name: "Auto & Transport",
    icon: "assets/img/auto_&_transport.png",
    spendAmount: "25.99",
    totalBudget: "400",
    leftAmount: "250.01",
    color:secondaryG,
  ),
  Budget(
    name: "Entertainment",
    icon: "assets/img/entertainment.png",
    spendAmount: "50.99",
    totalBudget: "600",
    leftAmount: "300.01",
    color:secondary50,
  ),
  Budget(
    name: "Security",
    icon: "assets/img/security.png",
    spendAmount: "5.99",
    totalBudget: "600",
    leftAmount: "250.01",
    color:primary10,
  ),
];
