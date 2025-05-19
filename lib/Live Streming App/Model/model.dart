import 'package:flutter/material.dart';

class StreamItems {
  final String name;
  final String category;
  final String url;
  final String image;
  final String viewer;
  final String streamTitle;
  final String followers;
  final bool isLiveNow;
  final Color color;
  final String coverImage;
  final String post;
  final String following;
  final String description;

  StreamItems({
    required this.name,
    required this.category,
    required this.url,
    this.isLiveNow = false,
    required this.followers,
    required this.color,
    required this.image,
    required this.viewer,
    required this.streamTitle,
    required this.coverImage,
    required this.post,
    required this.following,
    required this.description,
  });
}

List<StreamItems> streamItems = [
  StreamItems(
    name: 'Randy Rangers',
    category: '🔥Popular',
    url: 'https://symbl-cdn.com/i/webp/ef/717de6be0d2c9eb4d9d91521542da2.webp',
    isLiveNow: true,
    color: Colors.blue,
    image:
        "https://media.istockphoto.com/id/1452486049/photo/young-woman-plays-video-game-online-and-streaming-at-home.jpg?s=612x612&w=0&k=20&c=OoJeAC-A5NPDYOeJCN4OA1YOTfdKA1HDwr-pK8t_k6E=",
    streamTitle: "Yeay Update Ep Ep",
    viewer: "1.2k",
    followers: "132k",
    coverImage:
        "https://st2.depositphotos.com/1662991/45473/i/450/depositphotos_454739980-stock-photo-caucasian-woman-gamer-headphones-using.jpg",
    post: '950',
    following: '879',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
  StreamItems(
    name: 'Aura Kirana',
    category: '🎮Gaming',
    url: 'https://symbl-cdn.com/i/webp/9c/4628a5e254c186333877e3449d1caf.webp',
    color: Colors.blueAccent,
    image:
        "https://st2.depositphotos.com/1662991/45473/i/450/depositphotos_454739980-stock-photo-caucasian-woman-gamer-headphones-using.jpg",
    streamTitle: "Mabar With Ayang",
    viewer: "1.5k",
    followers: "159k",
    coverImage:
        "https://media.istockphoto.com/id/1452486049/photo/young-woman-plays-video-game-online-and-streaming-at-home.jpg?s=612x612&w=0&k=20&c=OoJeAC-A5NPDYOeJCN4OA1YOTfdKA1HDwr-pK8t_k6E=",
    post: '50',
    isLiveNow: true,
    following: '79',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
  StreamItems(
    name: 'Jeniper',
    category: '🎮Gaming',
    url:
        'https://cdn3.iconfinder.com/data/icons/jobs-and-professions/30/farmer_male-512.png',
    color: Colors.indigoAccent,
    image:
        "https://media.istockphoto.com/id/1249868546/photo/young-girl-playing-computer-game-on-laptop-at-night.jpg?s=612x612&w=0&k=20&c=uyOmTsBGlKS_rE3JTkzhDAyvXlcP69LAlKmFkWTwxzY=",
    streamTitle: "Fun with followers",
    viewer: "830",
    followers: "13k",
    coverImage:
        "https://media.istockphoto.com/id/1785843235/photo/female-gamer-asian-ethnicity-playing-fps-video-game-on-computer.jpg?s=612x612&w=0&k=20&c=ymwFtEBo1greK5u87DV78-VmIQbsrodXIo2fp42E-Q0=",
    post: '9k',
    following: '8k',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
  StreamItems(
    name: 'Subash Bo',
    category: '⚽️Sports',
    url:
        'https://images.icon-icons.com/2859/PNG/512/avatar_face_man_boy_male_profile_smiley_happy_people_icon_181660.png',
    color: Colors.redAccent,
    image:
        "https://media.istockphoto.com/id/1785843235/photo/female-gamer-asian-ethnicity-playing-fps-video-game-on-computer.jpg?s=612x612&w=0&k=20&c=ymwFtEBo1greK5u87DV78-VmIQbsrodXIo2fp42E-Q0=",
    streamTitle: "Fun...........",
    viewer: "1.8k",
    followers: "32k",
    coverImage:
        "https://platform.theverge.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/22542325/PREDATOR_TRITON_500_SE_PT516_51s_Lifestyle_03.jpg?quality=90&strip=all&crop=16.666666666667,0,66.666666666667,100",
    post: '9',
    following: '1',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
  StreamItems(
    name: 'Snake Snake',
    category: '⚽️Sports',
    url:
        'https://cdn4.iconfinder.com/data/icons/avatars-of-people/5000/avatar_15-512.png',
    color: Colors.pinkAccent,
    image:"https://images.pexels.com/photos/13801327/pexels-photo-13801327.jpeg?cs=srgb&dl=pexels-elkady-13801327.jpg&fm=jpg"
        ,
    streamTitle: "My First Live",
    viewer: "230",
    followers: "1k",
    coverImage:
        "https://platform.theverge.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/22542325/PREDATOR_TRITON_500_SE_PT516_51s_Lifestyle_03.jpg?quality=90&strip=all&crop=16.666666666667,0,66.666666666667,100",
    post: '90',
    following: '89',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
  StreamItems(
    name: 'My Name Is',
    category: '🎮Gaming',
    url:
        'https://cdn0.iconfinder.com/data/icons/when-the-sun-goes-down/32/avatar_1-19-512.png',
    color: Colors.deepOrangeAccent,
    image:
        "https://media.istockphoto.com/id/1097651244/photo/teenager-playing-games-on-pc.jpg?s=612x612&w=0&k=20&c=H1MizUdcqg8SuadN-742lZqgPmByZH_uF6OTLyVhuRc=",
    streamTitle: "Learn with AI",
    viewer: "1.9k",
    followers: "230k",
    coverImage:
        "https://media.istockphoto.com/id/1397054568/photo/girl-plays-video-game-online-and-streaming-at-home.jpg?s=612x612&w=0&k=20&c=7dFAEr9hu2P6unbw0NJt06y5p0LO3Wcxf0dn4ffObC0=",
    post: '77',
    following: '6',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
  StreamItems(
    name: 'Harish Sharma',
    category: '🎮Gaming',
    url: 'https://images.emojiterra.com/twitter/v14.0/1024px/1f468-1f9b0.png',
    color: Colors.brown,
    image:
        "https://platform.theverge.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/22542325/PREDATOR_TRITON_500_SE_PT516_51s_Lifestyle_03.jpg?quality=90&strip=all&crop=16.666666666667,0,66.666666666667,100",
    streamTitle: "Coding Game",
    viewer: "10k",
    followers: "500K",
    coverImage:
        "https://tn.com.ar/resizer/v2/ser-gamer-requiere-constancia-dedicacion-tiempo-conocimientos-en-diferentes-areas-no-solo-en-videojuegos-y-paciencia-pero-la-recompensa-lo-vale-muchos-gamers-viven-de-su-actividad-foto-adobestock-SO5IB45JHBGR5CB36RMPDPFC2Q.png?auth=46d097bbea59a1745105d99153f71efd6c074ba39be3f2b2e8667f5c2583d11c&width=767",
    post: '0',
    following: '0',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
  StreamItems(
    name: 'Mr.A',
    category: '🎧Music',
    url: 'https://images.emojiterra.com/twitter/v14.0/1024px/1f468-1f9b1.png',
    color: Colors.indigoAccent,
    image:
        "https://media.istockphoto.com/id/1397054568/photo/girl-plays-video-game-online-and-streaming-at-home.jpg?s=612x612&w=0&k=20&c=7dFAEr9hu2P6unbw0NJt06y5p0LO3Wcxf0dn4ffObC0=",
    streamTitle: "Music Consort",
    viewer: "830k",
    followers: "1M",
    coverImage:
        "https://tn.com.ar/resizer/v2/ser-gamer-requiere-constancia-dedicacion-tiempo-conocimientos-en-diferentes-areas-no-solo-en-videojuegos-y-paciencia-pero-la-recompensa-lo-vale-muchos-gamers-viven-de-su-actividad-foto-adobestock-SO5IB45JHBGR5CB36RMPDPFC2Q.png?auth=46d097bbea59a1745105d99153f71efd6c074ba39be3f2b2e8667f5c2583d11c&width=767",
    post: '10',
    following: '8',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
  StreamItems(
    name: 'Aura Kirana',
    category: '🎮Gaming',
    url: 'https://symbl-cdn.com/i/webp/ef/717de6be0d2c9eb4d9d91521542da2.webp',
    color: Colors.blueAccent,
    image:
        "https://media.istockphoto.com/id/1222829734/photo/millennial-man-playing-computer-game-on-laptop-at-home.jpg?s=612x612&w=0&k=20&c=aHUHxCJfHz90JtnrPwza8OlTT40namevyHiyBJnPeG0=",
    streamTitle: "Mabar With Ayang",
    viewer: "1.5k",
    followers: "159k",
    coverImage:
        "https://media.istockphoto.com/id/1785843235/photo/female-gamer-asian-ethnicity-playing-fps-video-game-on-computer.jpg?s=612x612&w=0&k=20&c=ymwFtEBo1greK5u87DV78-VmIQbsrodXIo2fp42E-Q0=",
    post: '100',
    following: '2',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
  StreamItems(
    name: 'Jeniper',
    category: '🎮Gaming',
    url: 'https://symbl-cdn.com/i/webp/9c/4628a5e254c186333877e3449d1caf.webp',
    color: Colors.indigoAccent,
    image:
        "https://tn.com.ar/resizer/v2/ser-gamer-requiere-constancia-dedicacion-tiempo-conocimientos-en-diferentes-areas-no-solo-en-videojuegos-y-paciencia-pero-la-recompensa-lo-vale-muchos-gamers-viven-de-su-actividad-foto-adobestock-SO5IB45JHBGR5CB36RMPDPFC2Q.png?auth=46d097bbea59a1745105d99153f71efd6c074ba39be3f2b2e8667f5c2583d11c&width=767",
    streamTitle: "Fun with followers",
    viewer: "830",
    followers: "13k",
    coverImage:
        "https://media.istockphoto.com/id/1222829734/photo/millennial-man-playing-computer-game-on-laptop-at-home.jpg?s=612x612&w=0&k=20&c=aHUHxCJfHz90JtnrPwza8OlTT40namevyHiyBJnPeG0=",
    post: '950',
    following: '879',
    description:
        'I am a gamer, I often do live streaming when I play games, my live schedule is from 08:00 AM - 10:00 AM',
  ),
];
