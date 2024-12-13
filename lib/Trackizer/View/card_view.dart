import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_ui_design/Trackizer/Model/card_view_model.dart';
import 'package:flutter_ui_design/Trackizer/Model/subscription_model.dart';
import 'package:flutter_ui_design/Trackizer/Utils/color.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 15),
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
              "Credit Cards",
              style: TextStyle(
                color: Colors.white30,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 400,
              // add the card swiper package
              child: Swiper(
                itemCount: virtualCards.length,
                layout: SwiperLayout.STACK,
                itemWidth: 250,
                itemHeight: 350,
                viewportFraction: 0.6,
                scale: 0.6,
                itemBuilder: (context, index) {
                  final card = virtualCards[index];
                  return CardWidgets(card: card);
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
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: subscriptions
                      .map(
                        (sub) => Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.asset(
                            sub.icon,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            Container(
              height: 250,
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.vertical(
                 top: Radius.circular(25),
                ),
              ),
              child:  Padding(
              padding: const EdgeInsets.all(15),
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
                          "Add new card",
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
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidgets extends StatelessWidget {
  final VirtualCardModel card;
  const CardWidgets({super.key, required this.card});

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
              const SizedBox(height: 10),
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
                  color: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                card.number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                card.monthYear,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
