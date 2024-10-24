import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Mobile%20Banking%20App/Model/card_model.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class CardDetailPaga extends StatefulWidget {
  final CardModel card;
  const CardDetailPaga({super.key, required this.card});

  @override
  State<CardDetailPaga> createState() => _CardDetailPagaState();
}

class _CardDetailPagaState extends State<CardDetailPaga> {
  var onFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
              Colors.white
            ],
            radius: 1.5,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.credit_card,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                const Text(
                  'Your Current Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '\$1847,56',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.upgrade_sharp,
                      color: Colors.green,
                    ),
                    Text(
                      '${widget.card.percentIncrease}% More then Last Month',
                      style: TextStyle(
                        color: Colors.green[500],
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    width: 300,
                    child: SfSparkLineChart(
                        color: Colors.yellow, data: widget.card.graphItems),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      symbol("D", false),
                      symbol("M", false),
                      symbol("6M", true),
                      symbol("Y", false),
                      symbol("ALL", false),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                 Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'You have receve a \namong of moneny of from',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "\$${widget.card.receiveAmount}",
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.card.cardType,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SwipeableButtonView(
                    onFinish: () {},
                    onWaitingProcess: () {},
                    activeColor: Colors.white,
                    buttonWidget: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    buttonText: 'Conform Payment Now',
                    buttontextstyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container symbol(String name, bool isActive) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isActive == true ? Colors.white : Colors.black,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: isActive == true ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
