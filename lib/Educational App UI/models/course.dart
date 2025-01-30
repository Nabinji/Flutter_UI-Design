class Course {
  String name;
  double completedPercentage;
  String author;
  String categoryName;

  String image;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.categoryName,
    required this.image,
  });
}

List<Course> courses = [
  Course(
    author: "Mr.John Doe",
    categoryName: "App Development",
    completedPercentage: .8,
    name: "Flutter Developer Course",
    image: "https://res.cloudinary.com/upwork-cloud/image/upload/c_scale,w_1000/v1693425490/catalog/1696973120247762944/zo8mzkvfqbrc42jifqmt.jpg",
  ),
  Course(
    author: "Programmer Lee",
    categoryName: "App Development",
    completedPercentage: .5,
    name: "Dart Programming Fundamentals",
    image: "https://ih1.redbubble.net/image.396539488.1140/st,small,507x507-pad,600x600,f8f8f8.u6.jpg",
  ),
  Course(
    author: "Karen Berman",
    completedPercentage: .75,
    categoryName: 'Accounting',
    name: "Accounting - The complete guide",
    image: "https://accountingwithone.com/wp-content/uploads/2023/01/acctg-mindmap-1.webp",
  ),
  Course(
    author: "Robert Frank",
    completedPercentage: .95,
    categoryName: 'Photography',
    name: "Introduction to photography",
    image: "https://photographylife.com/cdn-cgi/imagedelivery/GrQZt6ZFhE4jsKqjDEtqRA/photographylife.com/2018/12/Chapter-2-What-Is-Photography.png/w=960",
  ),
  Course(
    author: "Karen Berman",
    completedPercentage: .60,
    categoryName: 'Photography',
    name: "Digital camera operation",
    image: "https://img.kentfaith.com/catalog/blog/152/GW41.0065-1-518x518.jpg",
  ),
  Course(
    author: "Annie Leibovitz",
    completedPercentage: .75,
    categoryName: 'Photography',
    name: "Photo and Video Editing Course",
    image: "https://i.pcmag.com/imagery/roundups/01b4GWdIDy2hlLfEmihhSbv-1..v1678307759.jpg",
  ),
  Course(
    author: "WTF Code",
    completedPercentage: .9,
    categoryName: 'App Development',
    name: "E-commerce App Developemnt Course",
    image:
        "https://www.neoito.com/blog/wp-content/uploads/2021/09/Successful-E-Commerce-Mobile-App.png.webp",
  ),
  Course(
    author: "WTF Code",
    completedPercentage: .7,
    categoryName: 'App Development',
    name: "AI and Machine Learning",
    image:
        "https://www.springboard.com/blog/wp-content/uploads/2019/05/ai-vs.-machine-learning-vs.-deep-learning-whats-the-difference1.png",
  ),
  Course(
    author: "WTF Code",
    completedPercentage: .4,
    categoryName: 'App Development',
    name: "Python Programming",
    image:
        "https://st2.depositphotos.com/1606646/48825/i/450/depositphotos_488252618-stock-illustration-python-symbol-white-background-rendering.jpg",
  ),
];
