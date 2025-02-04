class AgroProduct {
  final String name;
  final String description;
  final String image;
  final double price;
  final String unit;
  final double rating;
  final int reviews;

  const AgroProduct({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.reviews,
    required this.unit,
    required this.rating,
  });
}

List<AgroProduct> agroProducts = [
  const AgroProduct(
    name: "Rice Seeds",
    description:
        "Embark on a journey of cultivation with our Rice seeds collection. From vibrant flowers to nutritious vegetables, these carefully selected seeds promise a bountiful and thriving garden. Nurture your green thumb with the best nature has to offer.",
    image: 'https://m.media-amazon.com/images/I/81Voy6TeZtL.jpg',
    price: 14.52,
    reviews: 450,
    unit: 'kg',
    rating: 5.0,
  ),
  const AgroProduct(
    name: "Lime Seedlings",
    description:
        "Lime trees produce fruit in around three years. Plus, the tree is pretty to look at, bedecked with petite, ovular leaves and delicate white flowers. A dwarf lime tree is about half the size of a regular lime tree, whereas key lime trees are bushier and produce smaller, more tart key limes.",
    image:
        'https://cdn.shopify.com/s/files/1/0062/8532/8445/products/Key_Lime_Tree_BB_600x600_393df3f5-1232-48a4-913e-c6da587811ab.jpg?v=1612233090',
    price: 9.99,
    unit: 'pcs',
    reviews: 192,
    rating: 3.86,
  ),
  const AgroProduct(
    name: "Tractor",
    description:
        "Exence the power of modern farming with our robust tractor. Whether you're tending to vast fields or small plots, this versatile machine ensures efficiency and precision. Its ergonomic design and advanced features make it a must-have for any farmer.",
    image:
        'https://www.deere.co.in/assets/images/region-1/products/tractors/john-deere-d-series-tractor.jpg',
    price: 377.00,
    reviews: 100,
    unit: 'day(s)',
    rating: 4.35,
  ),
  const AgroProduct(
    name: "Fresh Fruits",
    description:
        "Indulge in the natural sweetness and goodness of our handpicked assortment of fresh fruits. Bursting with flavors and packed with nutrients, these delectable treats are ect for snacking, cooking, or adding a vibrant touch to your meals.",
    image:
        'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnJ1aXR8ZW58MHx8MHx8fDA%3D',
    price: 9.99,
    reviews: 22,
    unit: 'kg',
    rating: 3.86,
  ),
  const AgroProduct(
    name: "Gardener's Rake",
    description:
        "Maintain a pristine garden with our high-quality gardener's rake. Its sturdy build and well-designed tines make it easy to gather leaves, debris, and soil efficiently. Whether you're a seasoned gardener or just starting out, this tool is a reliable companion.",
    image:
        'https://marshallsgarden.com/cdn/shop/files/10907249_MM-Budding-Gardener-Lawn-Rake-2023-IH-07.jpg?v=1695743940',
    price: 8.44,
    unit: 'piece',
    reviews: 222,
    rating: 4.18,
  ),
  const AgroProduct(
    name: "Wooden Plough",
    description:
        "A plough is a farm tool for loosening or turning the soil before sowing seed or planting. Ploughs were traditionally drawn by oxen and horses but modern ploughs are drawn by tractors. A plough may have a wooden, iron or steel frame with a blade attached to cut and loosen the soil.",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxSbRsXqNV6pNZA2DsrwN_22wLY6Ofe82tQw&s",
    price: 50.5,
    reviews: 96,
    unit: 'piece',
    rating: 4.5,
  ),
  const AgroProduct(
    name: "Soil",
    description:
        "Soil is a natural substance made up of minerals, organic matter, liquids, gases, and organisms that supports plant and soil life. It's also known as earth. ",
    image:
        "https://cropcareequipment.com/wp-content/uploads/2023/05/01-types-of-soil-and-what-to-grow-in-each.jpg",
    price: 5.0,
    reviews: 180,
    unit: 'kg',
    rating: 4.9,
  ),
];
