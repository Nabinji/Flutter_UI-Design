import 'package:flutter/material.dart';
import '../Model/model.dart';
import '../Config/responsive.dart';
import '../Config/size_config.dart';
import '../Utils/colors.dart';

class HistoryTable extends StatefulWidget {
  const HistoryTable({
    super.key,
  });

  @override
  State<HistoryTable> createState() => _HistoryTableState();
}

class _HistoryTableState extends State<HistoryTable> {
  int selectedIndex =1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
      child: SizedBox(
        width: Responsive.isDesktop(context)
            ? double.infinity
            : SizeConfig.screenWidth,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(transactionHistory.length, (index) {
            final transaction = transactionHistory[index];
            return TableRow(
              decoration: BoxDecoration(
                color:selectedIndex == index ?Colors.white:MyAppColor.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 20.0),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundImage: NetworkImage(
                      transaction.avatar,
                    ),
                  ),
                ),
                Text(
                  transaction.label,
                  style: const TextStyle(
                    letterSpacing: -1,
                    height: 1.3,
                    color: MyAppColor.secondary,
                  ),
                ),
                Text(
                  transaction.time,
                  style: const TextStyle(
                  letterSpacing: -1,
                    height: 1.3,
                    color: MyAppColor.secondary,
                  ),
                ),
                Text(
                 "${transaction.amount}.00",
                  style: const TextStyle(
        
                    height: 1.3,
                    letterSpacing: -1,
                    color: MyAppColor.secondary,
                  ),
                ),
                Text(
                  transaction.status,
                  style: const TextStyle(
                 
                    letterSpacing: -1,
                    height: 1.3,
                    color: MyAppColor.secondary,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
