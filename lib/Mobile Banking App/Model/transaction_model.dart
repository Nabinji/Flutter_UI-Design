class Transaction {
  final String title;
  final String description;
  final String amount;
  final bool
      isDebit; // To indicate if it's a debit (-) or credit (+) transaction

  Transaction({
    required this.title,
    required this.description,
    required this.amount,
    this.isDebit = true,
  });
}

List<Transaction> transactions = [
  Transaction(
    title: 'Google Courses',
    description: 'App Design Basics',
    amount: '-\$149',
    isDebit: true,
  ),
  Transaction(
    title: 'Microsoft',
    description: 'Cloud Services',
    amount: '+\$249',
    isDebit: false,
  ),
  Transaction(
    title: 'Freelance Payment',
    description: 'Project X',
    amount: '+\$1000',
    isDebit: false,
  ),
];
