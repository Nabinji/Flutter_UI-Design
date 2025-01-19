class CustomIcon {
  final String name;
  final String icon;

  CustomIcon({
    required this.name,
    required this.icon,
  });
}
List<CustomIcon> customIcons = [
  CustomIcon(name: "Appointment", icon: 'assets/health/appointment.png'),
  CustomIcon(name: "Hospital", icon: 'assets/health/hospital.png'),
  CustomIcon(name: "Covid-19", icon: 'assets/health/virus.png'),
  CustomIcon(name: "More", icon: 'assets/health/more.png'),
];
List<CustomIcon> healthNeeds = [
  CustomIcon(name: "Appointment", icon: 'assets/health/appointment.png'),
  CustomIcon(name: "Hospital", icon: 'assets/health/hospital.png'),
  CustomIcon(name: "Covid-19", icon: 'assets/health/virus.png'),
  CustomIcon(name: "Pharmacy", icon: 'assets/health/drug.png'),
];
List<CustomIcon> specialisedCared = [
  CustomIcon(name: "Diabetes", icon: 'assets/health/blood.png'),
  CustomIcon(name: "Health Care", icon: 'assets/health/health_care.png'),
  CustomIcon(name: "Dental", icon: 'assets/health/tooth.png'),
  CustomIcon(name: "Insured", icon: 'assets/health/insurance.png'),
];
