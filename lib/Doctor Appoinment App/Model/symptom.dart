class Symptom {
  final String image;
  final String label;

  Symptom({
    required this.image,
    required this.label,
  });
}

List<Symptom> symptoms = [
  Symptom(
    image: 'assets/doctor-appoinment/temperature.png',
    label: 'Temperature',
  ),
  Symptom(
    image: 'assets/doctor-appoinment/snuffle.png',
    label: 'Snuffle',
  ),
  Symptom(
    image: 'assets/doctor-appoinment/headache.png',
    label: 'Headache',
  ),
  Symptom(
    image: 'assets/doctor-appoinment/dizzy.png',
    label: 'Dizzy',
  ),
];
