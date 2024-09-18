class Category {
  final String emoticon, name;

  Category({required this.emoticon, required this.name});
}

List<Category> categories = [
  Category(
    emoticon: 'assets/cinema/smiling-face.png',
    name: 'Romance',
  ),
  Category(
    emoticon: 'assets/cinema/grinning-face.png',
    name: 'Comedy',
  ),
  Category(
    emoticon: 'assets/cinema/horror.png',
    name: 'Horror',
  ),
  Category(
    emoticon: 'assets/cinema/face.png',
    name: 'Drama',
  )
];
