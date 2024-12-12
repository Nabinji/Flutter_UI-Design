import 'package:flutter/material.dart';

import '../Utils/color.dart';

class SubscriptionItems extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;

  const SubscriptionItems({
    super.key,
    required this.sObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: border.withOpacity(0.15),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Image.asset(
                sObj["icon"],
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  sObj["name"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "\$${sObj["price"]}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
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
