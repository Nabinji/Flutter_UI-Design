import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Mobile%20Banking%20App/Model/card_model.dart';
import 'package:flutter_ui_design/Mobile%20Banking%20App/Model/transaction_model.dart';
import 'package:flutter_ui_design/Mobile%20Banking%20App/View/card_detail_screen.dart';
import 'package:iconsax/iconsax.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.black45,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.orange[900]!,
              Colors.amber[200]!,
              Colors.amber[200]!,
              Colors.amber[200]!,
              Colors.white,
            ],
            radius: 1.5,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerParts(),
                  SizedBox(height: size.height * 0.05),
                  const Text(
                    "Your Current Balance",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "\$1847,56",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: cards.map(buildCard).toList(),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction History",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: transactions.map(transactionHistory).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget transactionHistory(Transaction transaction) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.title,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: transaction.isDebit ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaction.description,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: transaction.isDebit ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  transaction.amount,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: transaction.isDebit ? Colors.white : Colors.black,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Divider(color: Colors.white),
        ],
      ),
    );
  }

  Widget buildCard(CardModel card) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CardDetailScreen(card: card),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 2,
                left: 2,
                bottom: 4,
              ),
              child: Container(
                height: 270,
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white70,
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(-1, 1),
                    ),
                  ],
                  border: Border.all(color: Colors.white12),
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120, top: 22),
                        child: Image.asset(
                          card.method,
                          height: 40,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(card.cardImage, height: 50),
                      const SizedBox(height: 20),
                      Text(
                        card.cardType.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${card.cardHolderName}   ${card.expirationDate}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 90,
                          right: 15,
                        ),
                        child: Image.network(card.cardLogo, height: 60),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row headerParts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.grid_view_rounded,
            color: Colors.white,
          ),
        ),
        const Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Badge(
                child: Icon(
                  // if you wants to user different icon then add the packge iconsax
                  Iconsax.notification,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
