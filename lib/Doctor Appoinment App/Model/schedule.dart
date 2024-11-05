import 'package:intl/intl.dart';
import 'doctor.dart';

class Schedule {
  final Doctor doctor;
  final String status;
  final DateTime time;

  Schedule({
    required this.doctor,
    required this.status,
    required this.time,
  });
}

List<Schedule> schedules = [
  Schedule(
      doctor: doctors[4],
      status: 'Confirmed',
      time: DateTime.parse('2024-11-03')),
  Schedule(
      doctor: doctors[0],
      status: 'Confirmed',
      time: DateTime.parse('2024-11-04')),
  Schedule(
      doctor: doctors[1],
      status: 'Confirmed',
      time: DateTime.parse('2024-11-05 09:30')),
  Schedule(
      doctor: doctors[2],
      status: 'Confirmed',
      time: DateTime.parse('2024-11-01 06:00')),
  Schedule(
    doctor: doctors[3],
    status: 'Confirmed',
    time: DateTime.parse('2024-11-06 15:45'),
  ),
];
List<String> tabs = ['Upcoming', 'Completed', 'Canceled'];
List<Schedule> nearest = schedules
    .where(
      (element) =>
          DateFormat('d/MM/y').format(element.time) ==
          DateFormat('d/MM/y').format(
            DateTime.now(),
          ),
    )
    .toList();
List<Schedule> futures = schedules
    .where(
      (element) =>
          DateFormat('d/MM/y').format(element.time) !=
          DateFormat('d/MM/y').format(
            DateTime.now(),
          ),
    )
    .toList();
