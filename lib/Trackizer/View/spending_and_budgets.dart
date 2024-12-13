import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Trackizer/Model/budget_model.dart';
import 'package:flutter_ui_design/Trackizer/Utils/color.dart';
import 'package:flutter_ui_design/Trackizer/Widgets/budget_items.dart';
import 'package:flutter_ui_design/Trackizer/Widgets/custom_arc_180_painter.dart';

class SpendingAndBudgets extends StatefulWidget {
  const SpendingAndBudgets({super.key});

  @override
  State<SpendingAndBudgets> createState() => _SpendingAndBudgetsState();
}

class _SpendingAndBudgetsState extends State<SpendingAndBudgets> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 10),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white54,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Spending & Budgets",
              style: TextStyle(
                color: Colors.white30,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  height: size.width * 0.32,
                  child: CustomPaint(
                    painter: CustomArc180Painter(
                      drwArcs: [
                        ArcValueModel(color: secondaryG, value: 20),
                        ArcValueModel(color: secondary, value: 45),
                        ArcValueModel(color: primary10, value: 70),
                      ],
                      end: 50,
                      width: 13,
                      bgWidth: 8,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "\$82,90",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "of \$2,0000 budget",
                      style: TextStyle(
                        color: gray30,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Container(
                  height: 65,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: border.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Your budgets are on track 👍",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: budgets.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              itemBuilder: (context, index) {
                return BudgetItems(
                  budget: budgets[index],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: DottedBorder(
                  dashPattern: [5,5],
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(15),
                  color: border.withOpacity(0.2),
                  child: Container(
                    height: 65,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add new category",
                          style: TextStyle(
                            color: gray30,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/img/add.png",
                          width: 12,
                          height: 12,
                          color: gray30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
