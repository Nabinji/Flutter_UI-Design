import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Trackizer/Model/bill_model.dart';
import 'package:flutter_ui_design/Trackizer/Model/subscription_model.dart';
import 'package:flutter_ui_design/Trackizer/Utils/color.dart';
import 'package:flutter_ui_design/Trackizer/Widgets/custom_arc_painter.dart';
import 'package:flutter_ui_design/Trackizer/Widgets/subscription_items.dart';
import 'package:flutter_ui_design/Trackizer/Widgets/upcoming_bill_items.dart';

class HomeScreenTrackizer extends StatefulWidget {
  const HomeScreenTrackizer({super.key});

  @override
  State<HomeScreenTrackizer> createState() => _HomeScreenTrackizerState();
}

class _HomeScreenTrackizerState extends State<HomeScreenTrackizer> {
  bool isSubscription = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final items = isSubscription ? subscriptions : bills;
    return Scaffold(
      backgroundColor: gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerParts(size),
            subscriptionAndBill(),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (isSubscription) {
                  final yourSub = items[index] as Subscription;
                  return SubscriptionItems(
                    subItems: {
                      "name": yourSub.name,
                      "icon": yourSub.icon,
                      "price": yourSub.price
                    },
                  );
                } else {
                  final bill = items[index] as Bill;
                  return UpcomingBillItems(
                    subItems: {
                      "name": bill.name,
                      "price": bill.price,
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Container subscriptionAndBill() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(8),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: segmentButton(
                isActive: isSubscription,
                title: "Your subscriprion",
                onPrressed: () {
                  setState(() {
                    isSubscription = !isSubscription;
                  });
                }),
          ),
          Expanded(
            child: segmentButton(
                isActive: !isSubscription,
                title: "Upcoming bills",
                onPrressed: () {
                  setState(() {
                    isSubscription = !isSubscription;
                  });
                }),
          ),
        ],
      ),
    );
  }

  InkWell segmentButton({onPrressed, required bool isActive, title}) {
    return InkWell(
      onTap: onPrressed,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                border: Border.all(
                  color: border.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(13),
              )
            : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : gray30,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Container headerParts(Size size) {
    return Container(
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
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: size.width * 0.05),
                width: size.width * 0.72,
                height: size.height * 0.72,
                child: CustomPaint(
                  painter: CustomArcPainter(end: 215),
                ),
              ),
              const Positioned(
                right: -30,
                top: 55,
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.white54,
                  size: 32,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: size.width * 0.31),
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
              GestureDetector(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: border.withOpacity(0.15),
                    ),
                    color: gray60.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
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
                    const SizedBox(width: 10),
                    Expanded(
                      child: currentStatusButton(
                        title: "Highest subs",
                        value: "\$19.99",
                        statusColor: primary10,
                      ),
                    ),
                    const SizedBox(width: 10),
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
          ),
        ],
      ),
    );
  }

  Stack currentStatusButton({title, value, statusColor}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: border.withOpacity(0.15),
            ),
            color: gray60.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: gray40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 65,
          height: 1.5,
          color: statusColor,
        ),
      ],
    );
  }
}
