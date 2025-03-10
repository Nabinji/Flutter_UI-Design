import 'package:flutter/material.dart';

class CompanyOffer {
  final String logo;
  final String salary;
  final String jobTitle;
  final String location;
  final Color color;
  final List<String> jobTypes;

  CompanyOffer({
    required this.logo,
    required this.salary,
    required this.jobTitle,
    required this.location,
    required this.jobTypes,
    required this.color
  });
}

List<CompanyOffer> companyOffer = [
  CompanyOffer(
    logo:
        "https://cdn3.iconfinder.com/data/icons/social-network-30/512/social-06-512.png",
    salary: "\$70K-\$100K",
    jobTitle: "Software Engineer",
    location: "YouTube, California",
    jobTypes: ["Full Time", "Remote"],
    color: Colors.blueAccent
  ),
  CompanyOffer(
    logo:
        "https://cdn.pixabay.com/photo/2021/08/10/15/36/microsoft-6536268_1280.png",
    salary: "\$50K-\$90K",
    jobTitle: "Graphic Designer",
    location: "Microsoft, California",
    jobTypes: ["Remote"],
    color: Colors.purpleAccent
  ),
  CompanyOffer(
    logo:
        "https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png",
    salary: "\$100K-\$120K",
    jobTitle: "Product Designer",
    location: "Google, California",
    jobTypes: ["Office", "Remote"],
    color: Colors.green
  ),
];
