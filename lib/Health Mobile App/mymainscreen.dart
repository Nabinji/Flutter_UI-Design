// import 'package:device_preview/device_preview.dart';
// import 'package:ecommerce/pages/home_page.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(DevicePreview(
//     enabled: false,
//     builder: (context) => const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       builder: DevicePreview.appBuilder,
//       locale: DevicePreview.locale(context),
//       title: 'health app',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorSchemeSeed: const Color(0xff5a73d8),
//         textTheme: GoogleFonts.plusJakartaSansTextTheme(
//           Theme.of(context).textTheme,
//         ),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
