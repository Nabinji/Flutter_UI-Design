import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Trackizer/Model/budget_model.dart';
import 'package:flutter_ui_design/Trackizer/Utils/color.dart';

class BudgetItems extends StatelessWidget {
  final Budget budget;
  const BudgetItems({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    var progressValue = (double.tryParse(budget.leftAmount) ?? 0) /
        (double.tryParse(budget.totalBudget) ?? 0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: border.withOpacity(0.05),
            ),
            color: gray60.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      budget.icon,
                      width: 30,
                      height: 30,
                      color: gray40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          budget.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "\$${budget.leftAmount} left to spend",
                          style: TextStyle(
                            color: gray30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$${budget.spendAmount}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "of \$${budget.totalBudget}",
                        style: TextStyle(
                          color: gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                backgroundColor: gray60,
                valueColor: AlwaysStoppedAnimation(budget.color),
                minHeight: 3,
                value: progressValue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
