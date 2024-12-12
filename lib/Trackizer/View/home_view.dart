import 'package:flutter/material.dart';
import '../Model/bill_model.dart';
import '../Model/subscription_model.dart';
import '../Utils/color.dart';
import '../Widgets/custom_arc_painter.dart';
import '../Widgets/subscription_items.dart';
import '../Widgets/upcoming_bill.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final items = isSubscription ? subscriptions : bills;
    return Scaffold(
      backgroundColor: gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.width * 1.1,
              decoration: BoxDecoration(
                color: gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/img/home_bg.png"),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: size.width * 0.05),
                        width: size.width * 0.72,
                        height: size.width * 0.72,
                        child: CustomPaint(
                          painter: CustomArcPainter(end: 220),
                        ),
                      ),
                      const Positioned(
                        right: -40,
                        top: -40,
                        child: Icon(
                          Icons.settings_outlined,
                          color: Colors.white54,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: size.width * 0.05),
                      Image.asset(
                        "assets/img/app_logo.png",
                        width: size.width * 0.25,
                      ),
                      SizedBox(height: size.width * 0.07),
                      const Text(
                        "\$1,235",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: size.width * 0.055),
                      Text(
                        "This month bills",
                        style: TextStyle(
                          fontSize: 12,
                          color: gray40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: size.width * 0.07),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: border.withOpacity(0.15)),
                            color: gray60.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            "See your budget",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: currentStatusButton(
                                title: "Active subs",
                                value: "12",
                                statusColor: secondary,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: currentStatusButton(
                                title: "Highest subs",
                                value: "\$19.99",
                                statusColor: primary10,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: currentStatusButton(
                                title: "Lowest subs",
                                value: "\$5.99",
                                statusColor: secondaryG,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: segmentButton(
                      title: "Your subscription",
                      isActive: isSubscription,
                      onPressed: () => setState(
                        () => isSubscription = !isSubscription,
                      ),
                    ),
                  ),
                  Expanded(
                    child: segmentButton(
                      title: "Upcoming bills",
                      isActive: !isSubscription,
                      onPressed: () => setState(
                        () => isSubscription = !isSubscription,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (isSubscription) {
                  final sub = items[index] as Subscription;
                  return SubscriptionItems(
                    sObj: {
                      "name": sub.name,
                      "icon": sub.icon,
                      "price": sub.price
                    },
                    onPressed: () {},
                  );
                } else {
                  final bill = items[index] as Bill;
                  return UpcomingBill(
                    sObj: {
                      "name": bill.name,
                      "price": bill.price,
                    },
                    onPressed: () {},
                  );
                }
              },
            ),
            const SizedBox(height: 110),
          ],
        ),
      ),
    );
  }

  Widget segmentButton({
    onPressed,
    required bool isActive,
    title,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                border: Border.all(
                  color: border.withOpacity(0.15),
                ),
                color: gray60.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : gray30,
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Stack currentStatusButton({title, value, statusColor}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 68,
          decoration: BoxDecoration(
            border: Border.all(
              color: border.withOpacity(0.15),
            ),
            color: gray60.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: gray40,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          width: 60,
          height: 1,
          color: statusColor,
        ),
      ],
    );
  }
}
