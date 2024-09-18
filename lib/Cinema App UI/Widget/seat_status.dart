import 'package:flutter/material.dart';

class SeatStatus extends StatelessWidget {
  final Color color;
  final String status;
  const SeatStatus({
    super.key,
    required this.color,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 17,
          height: 17,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 7),
        Text(
          status,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
