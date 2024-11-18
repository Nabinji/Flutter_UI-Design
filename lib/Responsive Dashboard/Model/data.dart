// Model for Recent Activity
class RecentActivity {
  final String icon;
  final String label;
  final String amount;
   final String status;

  RecentActivity({
    required this.icon,
    required this.label,
    required this.amount,
    required this.status,
  });
}

List<RecentActivity> recentActivities = [
  RecentActivity(
    icon: 'assets/dashoboard/water_bill.svg',
    label: 'Water Bill',
    amount: "\$120",
    status: "Successefully"
  ),
  RecentActivity(
      icon: 'assets/dashoboard/salary.svg',
      label: 'Income Salary',
      amount: "\$4500",
      status: "Received",),
  RecentActivity(
    icon: 'assets/dashoboard/current.svg',
    label: 'Electric Bill',
    amount: "\$150",
      status: "Successefully"
  ),
  RecentActivity(
    icon: 'assets/dashoboard/wifi.svg',
    label: 'Internet Bill',
    amount: "\$60",
      status: "Successefully"
  ),
];

// Model for Upcoming Payment
class UpcomingPayment {
  final String icon;
  final String label;
  final String amount;
     final String status;

  UpcomingPayment({
    required this.icon,
    required this.label,
    required this.amount,
     required this.status,
  });
}

List<UpcomingPayment> upcomingPayments = [
  UpcomingPayment(
    icon: 'assets/dashoboard/home.svg',
    label: 'Home Rent',
    amount: "\$1500",
    status: "Pending"
  ),
  UpcomingPayment(
    icon: 'assets/dashoboard/salary.svg',
    label: 'Car Insurance',
    amount: "\$150",
    status: "Pending"
  ),
];

// Model for Transaction History
class TransactionHistory {
  final String avatar;
  final String label;
  final String amount;
  final String time;
  final String status;

  TransactionHistory({
    required this.avatar,
    required this.label,
    required this.amount,
    required this.time,
    required this.status,
  });
}

List<TransactionHistory> transactionHistory = [
  TransactionHistory(
    avatar:
        'https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg',
    label: 'Car Insurance',
    amount: "\$350",
    time: "10:42:23 AM",
    status: "Completed",
  ),
  TransactionHistory(
    avatar:
        'https://portraitsrefined.com/wp-content/uploads/2021/10/headshot-girl-smiling.jpg',
    label: 'Loan',
    amount: "\$1200",
    time: "12:42:00 PM",
    status: "Completed",
  ),
  TransactionHistory(
    avatar:
        'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=0&k=20&c=tyLvtzutRh22j9GqSGI33Z4HpIwv9vL_MZw_xOE19NQ=',
    label: 'Online Payment',
    amount: "\$154",
    time: "10:42:23 PM",
    status: "Completed",
  ),
];
class InfoCardModel {
  final String icon;
  final String label;
  final String amount;

  InfoCardModel({
    required this.icon,
    required this.label,
    required this.amount,
  });
}
final List<InfoCardModel> infoCardData = [
  InfoCardModel(
    icon: 'assets/dashoboard/credit-card.svg',
    label: 'Transfer via \nCard number',
    amount: '\$1200',
  ),
  InfoCardModel(
    icon: 'assets/dashoboard/transfer.svg',
    label: 'Transfer via \nOnline Banks',
    amount: '\$150',
  ),
  InfoCardModel(
    icon: 'assets/dashoboard/bank.svg',
    label: 'Transfer \nSame Bank',
    amount: '\$1500',
  ),
  InfoCardModel(
    icon: 'assets/dashoboard/doc.svg',
    label: 'Transfer to \nOther Bank',
    amount: '\$1500',
  ),
];


const menuIcons = [
  'assets/dashoboard/home.svg',
  'assets/dashoboard/pie-chart.svg',
  'assets/dashoboard/clipboard.svg',
  'assets/dashoboard/credit-card.svg',
  'assets/dashoboard/trophy.svg',
  'assets/dashoboard/invoice.svg',
];
