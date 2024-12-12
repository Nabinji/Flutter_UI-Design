class VirtualCardModel {
  final String name;
  final String number;
  final String monthYear;

  VirtualCardModel({
    required this.name,
    required this.number,
    required this.monthYear,
  });
}

final List<VirtualCardModel> virtualCards = [
  VirtualCardModel(
    name: "Code for Any1",
    number: "**** **** **** 2197",
    monthYear: "08/27",
  ),
  VirtualCardModel(
    name: "Code for Any2",
    number: "**** **** **** 2198",
    monthYear: "09/27",
  ),
  VirtualCardModel(
    name: "Code for Any3",
    number: "**** **** **** 2297",
    monthYear: "07/27",
  ),
  VirtualCardModel(
    name: "Code for Any4",
    number: "**** **** **** 2397",
    monthYear: "05/27",
  ),
];
