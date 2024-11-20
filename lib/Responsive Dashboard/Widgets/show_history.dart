import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Config/responsive.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Config/size_config.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Model/model.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Utils/colors.dart';

class ShowHistory extends StatefulWidget {
  const ShowHistory({super.key});

  @override
  State<ShowHistory> createState() => _ShowHistoryState();
}

class _ShowHistoryState extends State<ShowHistory> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      scrollDirection:
          Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
      child: SizedBox(
        width: Responsive.isDesktop(context)
            ? double.infinity
            : SizeConfig.screenWidth,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(
            transactionHistory.length,
            (index) {
              final transaction = transactionHistory[index];
              return TableRow(
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colors.white
                      : MyAppColor.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 20,
                    ),
                    child: CircleAvatar(
                      radius: 17,
                      backgroundImage: NetworkImage(transaction.avatar),
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
                      letterSpacing: -1,
                      height: 1.3,
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
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
