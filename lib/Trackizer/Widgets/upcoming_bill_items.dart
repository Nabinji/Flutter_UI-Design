import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Trackizer/Utils/color.dart';

class UpcomingBillItems extends StatelessWidget {
  final Map subItems;
  const UpcomingBillItems({super.key, required this.subItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {},
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: border.withOpacity(0.15),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: gray70.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Jun",
                      style: TextStyle(
                        fontSize: 10,
                        color: gray30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "25",
                      style: TextStyle(
                        color: gray30,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  subItems['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "\$${subItems['price']}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
