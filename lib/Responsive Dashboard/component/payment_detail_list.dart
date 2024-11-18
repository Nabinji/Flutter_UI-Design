import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/style/colors.dart';
import '../config/size_config.dart';
import '../Model/data.dart';
import 'payment_list_tile.dart';

class PaymentDetailList extends StatelessWidget {
  const PaymentDetailList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical * 5,
      ),
      Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 15.0,
            offset: const Offset(
              10.0,
              15.0,
            ),
          )
        ]),
        child: Image.asset('assets/dashoboard/card.png'),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 5,
      ),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activities',
            style: TextStyle(
              fontSize: 18,
              height: 1.3,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          Text(
            '02 Mar 2021',
            style: TextStyle(
              height: 1.3,
              color: MyAppColor.secondary,
            ),
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 2,
      ),
      Column(
        children: List.generate(recentActivities.length, (index) {
          final activity = recentActivities[index];
          return PaymentListTile(
            icon: activity.icon,
            label: activity.label,
            amount: activity.amount,
            status:activity.status ,
          );
        }),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 5,
      ),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Payments',
            style: TextStyle(
              height: 1.3,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: MyAppColor.primary,
            ),
          ),
          Text(
            '02 Mar 2021',
            style: TextStyle(
              height: 1.3,
              color: MyAppColor.secondary,
            ),
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 2,
      ),
      Column(
        children: List.generate(upcomingPayments.length, (index) {
          final payments = upcomingPayments[index];
          return PaymentListTile(
            icon: payments.icon,
            label: payments.label,
            amount:payments.amount,
            status: payments.status,
          );
        }),
      ),
    ]);
  }
}
