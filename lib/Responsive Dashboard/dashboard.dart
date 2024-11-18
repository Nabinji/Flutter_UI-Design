import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Component/bar_chart.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Utils/colors.dart';
import 'Component/app_bar_items.dart';
import 'Component/header.dart';
import 'Component/history_table.dart';
import 'Component/info_card.dart';
import 'Component/payment_detail_list.dart';
import 'Component/side_menu.dart';
import 'Config/responsive.dart';
import 'Config/size_config.dart';
import 'Model/model.dart';

class MyDashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,
      key: drawerKey,
      drawer: const SizedBox(width: 100, child: SideMenu()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  drawerKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu, color: Colors.black),
              ),
              actions: const [
                AppBarActionItems(),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // for dashboard text, search bar
                      const Header(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      // for transfor info
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.spaceBetween,
                          // Dynamically map over infoCardData
                          children: infoCardData.map((info) {
                            return InfoCard(infoCardModel: info);
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Balance",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: MyAppColor.secondary,
                                  height: 1.3,
                                ),
                              ),
                              Text(
                                '\$1500',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: MyAppColor.primary,
                                  fontWeight: FontWeight.w800,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Past 30 DAYS',
                            style: TextStyle(
                              fontSize: 16,
                              color: MyAppColor.secondary,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      const SizedBox(
                        height: 180,
                        child: BarChartComponent(),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'History',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: MyAppColor.primary,
                              height: 1.3,
                            ),
                          ),
                          Text(
                            'Transaction of last 6 months',
                            style: TextStyle(
                              fontSize: 16,
                              color: MyAppColor.secondary,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      const HistoryTable(),
                      if (!Responsive.isDesktop(context))
                        const PaymentDetailList()
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration:
                        const BoxDecoration(color: MyAppColor.secondaryBg),
                    child: const SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          AppBarActionItems(),
                          PaymentDetailList(),
                        ],
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
