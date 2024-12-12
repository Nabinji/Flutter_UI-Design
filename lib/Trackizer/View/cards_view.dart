import 'package:card_swiper/card_swiper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../Model/card_view_model.dart';
import '../Model/subscription_model.dart';
import '../Utils/color.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 400,
              child: Swiper(
                itemCount: virtualCards.length,
                layout: SwiperLayout.TINDER,
                itemWidth: 250.0,
                itemHeight: 350,
                scale: 1,
                viewportFraction: 1,
                itemBuilder: (context, index) {
                  final card = virtualCards[index];
                  return _CardWidget(card: card);
                },
              ),
            ),
            Column(
              children: [
                const Text(
                  "Subscriptions",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: subscriptions
                      .map((sub) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(sub.icon, width: 40, height: 40),
                          ))
                      .toList(),
                ),
              ],
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DottedBorder(
                  dashPattern: const [5, 4],
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(16),
                  color: border.withOpacity(0.1),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {},
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add new card",
                            style: TextStyle(
                                color: gray30,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  final VirtualCardModel card;

  const _CardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: gray70,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/img/card_blank.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/mastercard_logo.png",
                width: 50,
              ),
              const SizedBox(height: 8),
              const Text(
                "Virtual Card",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 80),
              Text(
                card.name,
                style: TextStyle(
                  color: Colors.grey[20],
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                card.number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                card.monthYear,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
