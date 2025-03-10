class UserInfo {
  final String title;
  final String company;
  final String img;

  UserInfo({
    required this.title,
    required this.company,
    required this.img,
  });
}

List<UserInfo> userInfo = [
  UserInfo(
    title: "Flutter Developer",
    company: "Google, California",
    img:
        "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
  ),
  UserInfo(
    title: "Android Developer",
    company: "Microsoft California",
    img:
        "https://cm.codes/media/5odmek2z/hhp-removebg-preview.png",
  ),
  UserInfo(
    title: "Flutter Developer",
    company: "WTF Media, Nepal",
    img: "https://yt3.googleusercontent.com/XMf1uKscdqHYXZP_pcYrjUoQlBgYdQpPtpdrbyXMpd6X1vtDd0ui3q_TnWHNjpEJG-w-u08qvg=s900-c-k-c0x00ffffff-no-rj",
  ),
  UserInfo(
    title: "Flutter UI Developer",
    company: "Online Platform",
    img: "https://kmphitech.com/wp-content/uploads/2021/04/Mobile-UI-UX-Design.png",
  ),
  UserInfo(
    title: "Content Creation",
    company: "Google, California",
    img: "https://static.vecteezy.com/system/resources/previews/011/382/410/non_2x/teens-create-video-content-3d-character-illustration-free-png.png",
  ),
];
