class Review {
  final int id;
  final String fullname, image, comment;
  final String date;
  final double rate;
  final int color;
  Review({
    required this.id,
    required this.rate,
    required this.fullname,
    required this.image,
    required this.comment,
    required this.date,
    required this.color,
  });
}
List<Review> reviews = [
  Review(
    id: 1,
    fullname: "Joana Perkins",
    image: "https://plus.unsplash.com/premium_photo-1671656333460-a3a85854d01e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFjayUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
    rate: 4.6,
    comment:
        "Many thanks to my doctor! She is professional, expert and competent doctor...",
    date: "10/22/2022",
    color: 0xFFffcdcf,
  ),
  Review(
    id: 2,
    fullname: "Paolina Caldicot",
    image: "https://plus.unsplash.com/premium_photo-1673866484792-c5a36a6c025e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
    rate: 3.8,
    comment:
        "Greatfull to find such a great and kind doctor",
    date: "3/16/2022",
    color:  0xFFccd1fa,
  ),
  Review(
    id: 3,
    fullname: "Leicester Norcliffe",
    image: "https://marketplace.canva.com/EAFHfL_zPBk/1/0/1600w/canva-yellow-inspiration-modern-instagram-profile-picture-kpZhUIzCx_w.jpg",
    rate: 4.5,
    comment:
        "The doctor was incredibly attentive and really took the time to listen to my concerns. I felt like my health and well-being truly mattered. Highly recommend!",
    date: "12/10/2022",
    color: 0xFFf9d8b9,
  ),
  Review(
    id: 4,
    fullname: "Nikolaos Cooksley",
    image:
        "https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/50dab922-5d48-4c6b-8725-7fd0755d9334/3a3f2d35-8167-4708-9ef0-bdaa980989f9.png",
    rate: 3.5,
    comment:
        "I was nervous before my appointment, but the doctor’s calm and reassuring manner put me right at ease. I left with a clear understanding of my treatment plan.",
    date: "4/19/2022",
    color: 0xFFccae4d,
  ),
  Review(
    id: 5,
    fullname: "Andy Beretta",
    image: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
    rate: 3.3,
    comment:
        "Amazing experience! The doctor was thorough and answered all my questions without rushing. I feel much more confident about my health.",
    date: "10/27/2022",
    color: 0xFF086887,
  ),
  Review(
    id: 6,
    fullname: "Mada Prodrick",
    image:
        "https://png.pngtree.com/thumb_back/fh260/background/20230614/pngtree-woman-in-sunglasses-standing-in-front-of-a-dark-background-image_2891237.jpg",
    rate: 3.9,
    comment:
        "The level of care I received was outstanding! I appreciated how the doctor explained everything in detail, making sure I understood my options.",
    date: "10/11/2022",
    color: 0xFFe1edf8,
  ),
  Review(
    id: 7,
    fullname: "Constantin Slowan",
    image: "https://i.pinimg.com/736x/55/b5/9c/55b59c73bd0ee0e42c0022168b9d36be.jpg",
    rate: 3.2,
    comment: "From start to finish, my visit was excellent. The doctor was knowledgeable, compassionate, and made me feel valued. I’ll definitely be back!",
    date: "10/24/2022",
    color: 0xFFe8ee07,
  ),
  Review(
    id: 8,
    fullname: "Sally Fernyhough",
    image: "https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D",
    rate: 3.7,
    comment:
        "The doctor was very professional and empathetic. I felt heard and understood, and the treatment has already made a difference.",
    date: "5/11/2022",
    color: 0xFFe1edf8,
  ),
];
