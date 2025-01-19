class ScheduleModel {
  final String name;
  final String position;
  final String time;
  final String date;
  final String profile;
  ScheduleModel({
    required this.name,
    required this.position,
    required this.time,
    required this.date,
    required this.profile,
  });
}

final List<ScheduleModel> scheduleDoctors = [
  ScheduleModel(
    name: "dr. Ruben Dorwart",
    position: "Dental Specialist",
    time: '2:30 PM - 3:30 PM',
    date: 'Today',
    profile:
        "https://images.unsplash.com/photo-1612276529731-4b21494e6d71?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZG9jdG9yJTIwcG9ydHJhaXR8ZW58MHx8MHx8fDA%3D",
  ),
    ScheduleModel(
    name: "dr. Skylar Korsgaard",
    position: "General Practitioner",
    time: '1:30 PM - 3:30 PM',
    date: 'Today',
    profile:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6F_dcVRDHxwT9RWoHyHA_Wnt9EPNJStZ0Ww&s",
  ),
    ScheduleModel(
    name: "dr. Adison Schleifers",
    position: "Dental Specialist",
    time: '6:30 PM - 8:30 PM',
    date: 'Today',
    profile:
        "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
  ),
  ScheduleModel(
    name: "dr. Adison Schleifer,",
    position: "General Practitioner",

    time: '10:30 - 12:30 AM',
    date: 'Tomorrow',
    profile:
        "https://media.istockphoto.com/id/1307543618/photo/team-of-doctors-and-nurses-in-hospital.jpg?s=612x612&w=0&k=20&c=-t6j5lmy_DFWtXb5HdDe0Kj6dXZwsviihuOA2lvXX5Q=",
  ),
  ScheduleModel(
    name: "dr. Louise Reid",
    position: "General Practitioner",

    time: '6:30 - 8:30 AM',
    date: 'Tomorrow',
    profile:
        "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsb2ZmaWNlMV9waG90b2dyYXBoeV9vZl9hbl9zb3V0aF9pbmRpYW5fd29tZW5fYXNfYV9kb2N0b19kMzAxMDM3Zi03MDUzLTQxNDAtYmYyZS1lZDFlYWE0YTM3NDRfMS5qcGc.jpg",
  ),
];
