import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Utils/colors.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Widgets/bar_chart.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Widgets/header_action_items.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Widgets/header_parts.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Widgets/payment_detail_info.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Widgets/show_history.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Widgets/side_drawer_menu.dart';
import 'package:flutter_ui_design/Responsive%20Dashboard/Widgets/transfer_info_card.dart';
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
      drawer: const SizedBox(width: 100, child: SideDrawerMenu()),
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
                HeaderActionItems(),
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
                child: SideDrawerMenu(),
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
                      const HeaderParts(),
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
                            return TransferInfoCard(infoCardModel: info);
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
                        child: BarChartRepresentation(),
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
                      const ShowHistory(),
                      if (!Responsive.isDesktop(context))
                        const PaymentDetailInfo()
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
                        children: [HeaderActionItems(), PaymentDetailInfo()],
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
