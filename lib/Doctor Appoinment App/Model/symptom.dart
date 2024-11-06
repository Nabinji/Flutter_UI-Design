class Symptoms {
  final String image;
  final String label;

  Symptoms({
    required this.image,
    required this.label,
  });
}

List<Symptoms> symptoms = [
  Symptoms(
    image: 'assets/doctor-appoinment/temperature.png',
    label: 'Temperature',
  ),
  Symptoms(
    image: 'assets/doctor-appoinment/snuffle.png',
    label: 'Snuffle',
  ),
  Symptoms(
    image: 'assets/doctor-appoinment/headache.png',
    label: 'Headache',
  ),
  Symptoms(
    image: 'assets/doctor-appoinment/dizzy.png',
    label: 'Dizzy',
  ),
];
