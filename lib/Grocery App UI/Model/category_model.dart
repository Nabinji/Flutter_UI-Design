class GroceryModel {
  String image;
  String name;

  GroceryModel({
    required this.image,
    required this.name,
  });
}

List<GroceryModel> groceryCategory = [
  GroceryModel(
    image:"https://img.freepik.com/free-vector/hand-drawn-batch-vegetables_53876-15671.jpg?t=st=1739875254~exp=1739878854~hmac=698e91040706524b2049ba6d05898435c2e4bdaf6e24b18a2386b6379c3f6f1d&w=2000",
    name: "Vegetables",
  ),
  GroceryModel(
    image:"https://static.vecteezy.com/system/resources/previews/043/547/379/non_2x/a-variety-of-fruits-illustration-vector.jpg",
    name: "Fruits",
  ),
  GroceryModel(
    image:"https://img.freepik.com/free-vector/bread-pastry-products_1308-122967.jpg?t=st=1739875279~exp=1739878879~hmac=073afe4bbf2cbce2bd893323e5bb6b00992e092ef4c14132330bd5be7933ce8e&w=1800",
    name: "Bakery",
  ),
  GroceryModel(
    image:
        "https://img.freepik.com/free-vector/spices-herbs-tag-decorated-with-leaves-dill-basil-bay-powder-curry-paprika-realistic-illustration_1284-61200.jpg?t=st=1739875308~exp=1739878908~hmac=ab44824175600bc16e3a38121551704eac3545ef6c8560a43acff21bf908bda2&w=1800",
    name: "Spices",
  ),
  GroceryModel(
    image:
        "https://img.freepik.com/free-vector/beef-leg-meat-cut-icon_18591-82301.jpg?t=st=1739875332~exp=1739878932~hmac=d34e32202afcf1838451ffcbbb4a5d77072e2ecd452f47e5471127dcb4ac05f2&w=2000",
    name: "Meat",
  ),
];
