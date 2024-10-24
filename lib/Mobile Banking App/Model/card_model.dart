class CardModel {
  final String cardHolderName;
  final String expirationDate;
  final String cardType;
  final String method;
  final String cardLogo;
  final String cardImage;
  final List<double> graphItems;
  final String percentIncrease;
  final int receiveAmount;
  CardModel({
    required this.cardHolderName,
    required this.expirationDate,
    required this.cardType,
    required this.method,
    required this.cardLogo,
    required this.cardImage,
    required this.graphItems,
    required this.percentIncrease,
    required this.receiveAmount,
  });
}

final List<CardModel> cards = [
  CardModel(
    cardHolderName: 'ADOM SHAFI',
    expirationDate: '12/24',
    percentIncrease: "3.10",
    receiveAmount: 152,
    graphItems: const <double>[
      2,
      1,
      11,
      25,
      17,
      30,
      24,
      70,
      35,
      55,
      33,
      43,
      6,
      8,
      7,
      10,
      30,
      5,
      10,
      23,
      50,
      70,
      50,
      55,
      20,
      40,
      42,
      60,
      80,
      75,
      90,
    ],
    cardType: 'Debit Card',
    method: 'assets/banking-app/online.png',
    cardImage: 'assets/banking-app/card.png',
    cardLogo:
        'https://logos-world.net/wp-content/uploads/2020/09/Mastercard-Logo.png',
  ),
  CardModel(
    percentIncrease: "30",
    graphItems: const <double>[
      
      5,
      10,
      23,
      50,
      70,
      50,
      55,
      20,
      40,
      42,
      60,
      75,
      2,
      1,
      11,
      25,
      17,
      30,
      24,
      70,
      35,
      55,
      33,
      43,
      6,
      8,
      7,
      10,
      30,
      100
    ],
    cardHolderName: 'JANE DOE',
    expirationDate: '11/25',
    receiveAmount: 200,
    cardType: 'Credit Card',
    method: 'assets/banking-app/online.png',
    cardImage: 'assets/banking-app/card.png',
    cardLogo:
        'https://dorve.com/wp-content/uploads/2021/07/Visa-Logo-2006-2014.png',
  ),
  CardModel(
    percentIncrease: "0",
    graphItems: const <double>[
      0,
      7,
      50,
      22,
      45,
      100,
      60,
      20,
      40,
      11,
      5,
      0,
    ],
    cardHolderName: 'ADOM SHAFI',
    expirationDate: '12/26',
    receiveAmount: 2,
    cardType: 'PayPal',
    method: 'assets/banking-app/online.png',
    cardImage: 'assets/banking-app/card.png',
    cardLogo:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/2560px-PayPal.svg.png',
  ),
];
