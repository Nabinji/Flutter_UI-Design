import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Doctor%20Appoinment%20App/Model/schedule.dart';
import 'package:flutter_ui_design/Doctor%20Appoinment%20App/const.dart';
import 'package:intl/intl.dart';

class ScheduleItems extends StatelessWidget {
  final Schedule schedule;
  const ScheduleItems({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset.zero,
            color: grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. ${schedule.doctor.name}",
                    style: const TextStyle(
                      color: black,
                      fontSize: 18,
                      letterSpacing: -.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    schedule.doctor.specialist,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      letterSpacing: -.5,
                    ),
                  )
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(schedule.doctor.image),
                  ),
                  shape: BoxShape.circle,
                  color: Color(schedule.doctor.color).withOpacity(0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.black12,),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat("d/MM/y").format(schedule.time),
                    style: const TextStyle(
                      color: black,
                      letterSpacing: -.5,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 25),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    color: grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat("jm").format(schedule.time),
                    style: const TextStyle(
                      color: black,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 25),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    schedule.status,
                    style: const TextStyle(
                      color: black,
                      letterSpacing: 0,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  color: grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2.25,
                decoration: BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Reschedule",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
