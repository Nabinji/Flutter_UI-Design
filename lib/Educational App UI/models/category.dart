class Category {
  String coverImage;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.coverImage,
  });
}

List<Category> categoryList = [
  Category(
    name: 'App Development',
    noOfCourses: 55,
    coverImage: 'assets/educational-app/app111.png',
  ),
  Category(
    name: 'Accounting',
    noOfCourses: 20,
    coverImage: 'assets/educational-app/accounting.jpg',
  ),
  Category(
    name: 'Photography',
    noOfCourses: 16,
    coverImage: 'assets/educational-app/photography.jpg',
  ),
  Category(
    name: 'Product Design',
    noOfCourses: 25,
    coverImage: 'assets/educational-app/design.jpg',
  ),
  Category(
    name: 'Web Development',
    noOfCourses: 10,
    coverImage: 'assets/educational-app/web_development.png',
  ),
  Category(
    name: 'Marketing',
    noOfCourses: 18,
    coverImage: 'assets/educational-app/marketing.png',
  ),
];
