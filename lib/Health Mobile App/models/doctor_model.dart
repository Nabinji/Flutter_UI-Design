class DoctorModel {
  final String name;
  final String position;
  final double rating;
  final int reviews;
  final String profile;
  DoctorModel({
    required this.name,
    required this.position,
    required this.rating,
    required this.reviews,
    required this.profile,
  });
}

final List<DoctorModel> nearbyDoctors = [
  DoctorModel(
    name: "Skylar Korsgaard",
    position: "General Practitioner",
    rating: 4.0,
    reviews: 191,
    profile: "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
  ),
  DoctorModel(
    name: "Adison Schleifer",
    position: "General Practitioner",
    rating: 4.0,
    reviews: 195,
    profile: "https://media.istockphoto.com/id/1307543618/photo/team-of-doctors-and-nurses-in-hospital.jpg?s=612x612&w=0&k=20&c=-t6j5lmy_DFWtXb5HdDe0Kj6dXZwsviihuOA2lvXX5Q=",
  ),
  DoctorModel(
    name: "Louise Reid",
    position: "General Practitioner",
    rating: 4.6,
    reviews: 201,
    profile: "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsb2ZmaWNlMV9waG90b2dyYXBoeV9vZl9hbl9zb3V0aF9pbmRpYW5fd29tZW5fYXNfYV9kb2N0b19kMzAxMDM3Zi03MDUzLTQxNDAtYmYyZS1lZDFlYWE0YTM3NDRfMS5qcGc.jpg",
  ),
];
