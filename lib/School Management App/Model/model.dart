class Task {
  final String currentTime;
  final String remainingTime;
  final String title;
  final String subtitle;
  final String profileImage;
  final String name;
  final String id;
  final String location;
  final String room;

  Task({
    required this.currentTime,
    required this.remainingTime,
    required this.title,
    required this.subtitle,
    required this.profileImage,
    required this.name,
    required this.id,
    required this.location,
    required this.room,
  });
}
List<Task> tasks = [
  Task(
    currentTime: "07:00",
    remainingTime: "1 h 45 min",
    title: "Typography",
    subtitle: "The Basic of Typography I",
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&s",
    name: "Gabriel Sutton",
    id: "722-085-9210",
    location: "Faculty of Art & Design Building",
    room: "Room C1, 1st floor",
  ),
  Task(
    currentTime: "09:30",
    remainingTime: "2 h",
    title: "Design Psychology",
    subtitle: "Principle of good design",
    profileImage:
        "https://media.istockphoto.com/id/1154642632/photo/close-up-portrait-of-brunette-woman.jpg?s=612x612&w=0&k=20&c=d8W_C2D-2rXlnkyl8EirpHGf-GpM62gBjpDoNryy98U=",
    name: "Gabriel Sutton",
    id: "722-085-9210",
    location: "Faculty of Art & Design Building",
    room: "Room C1, 1st floor",
  ),
  Task(
    currentTime: "01:00",
    remainingTime: "1 h 45 min",
    title: "Typography",
    subtitle: "The Basic of Typography I",
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&s",
    name: "Gabriel Sutton",
    id: "722-085-9210",
    location: "Faculty of Art & Design Building",
    room: "Room C1, 1st floor",
  ),
];
