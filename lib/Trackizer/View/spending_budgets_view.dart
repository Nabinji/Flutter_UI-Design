import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../Model/budget_model.dart';
import '../Utils/color.dart';
import '../Widgets/budget_items.dart';
import '../Widgets/custom_arc_180_painter.dart';

class SpendingBudgetsView extends StatelessWidget {
  const SpendingBudgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 10),
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
                color: Colors.white54,
                fontSize: 18,
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: media.width * 0.5,
                  height: media.width * 0.30,
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
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: border.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Your budgets are on track 👍",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: budgets.length,
              itemBuilder: (context, index) {
                return BudgetItems(
                  budget: budgets[index],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: DottedBorder(
                  dashPattern: const [5, 4],
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(16),
                  color: border.withOpacity(0.1),
                  child: Container(
                    height: 64,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add new category ",
                          style: TextStyle(
                            color: gray30,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
