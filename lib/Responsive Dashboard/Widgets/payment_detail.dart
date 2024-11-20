import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Utils/colors.dart';

class PaymentDetail extends StatelessWidget {
  final String icon;
  final String label;
  final String amount;
  final String status;
  const PaymentDetail({
    super.key,
    required this.icon,
    required this.label,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(right: 20, left: 0),
      visualDensity: VisualDensity.standard,
      leading: Container(
        width: 50,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          icon,
          width: 20,
        ),
      ),
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
              color: Colors.black,fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
      selected: true,
    );
  }
}
