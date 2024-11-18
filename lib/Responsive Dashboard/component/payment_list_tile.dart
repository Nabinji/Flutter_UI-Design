import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Utils/colors.dart';

class PaymentListTile extends StatelessWidget {
  final String icon;
  final String label;
  final String amount;
  final String status;

  const PaymentListTile(
      {super.key,
      required this.icon,
      required this.label,
      required this.amount,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0, right: 20),
      visualDensity: VisualDensity.standard,
      leading: Container(
          width: 50,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SvgPicture.asset(
            icon,
            width: 20,
          )),
      title: Text(
        label,
        style: const TextStyle(
          height: 1.3,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            status,
            style: const TextStyle(
              height: 1.3,
              fontSize: 12,
              color: MyAppColor.secondary,
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      selected: true,
    );
  }
}
