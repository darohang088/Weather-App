import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeData.light(
      useMaterial3: true,
    ).copyWith(textTheme: GoogleFonts.kantumruyProTextTheme());

    return MaterialApp(
      title: 'Provider App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: Routes.home,
      routes: Routes.getRoutes(),
    );
  }
}
