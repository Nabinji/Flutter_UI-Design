import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {
  final IconData icon;
  final String name, value;
  const MovieInfo({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 102,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: Colors.white12,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
