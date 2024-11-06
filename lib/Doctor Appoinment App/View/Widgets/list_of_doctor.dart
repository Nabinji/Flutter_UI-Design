import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Doctor%20Appoinment%20App/Model/doctor.dart';
import 'package:flutter_ui_design/Doctor%20Appoinment%20App/const.dart';

class ListOfDoctor extends StatelessWidget {
  final Doctor doctor;
  const ListOfDoctor({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: MediaQuery.of(context).size.width / 2.24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Color(doctor.color),
            backgroundImage: NetworkImage(
              doctor.image,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Dr. ${doctor.name}",
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: -.5,
              color: black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            doctor.specialist,
            style: const TextStyle(
                letterSpacing: 0,
                color: Colors.black26,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  rate(doctor).toStringAsFixed(1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
