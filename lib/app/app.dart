import 'package:flutter/material.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: Routes.home,
      routes: Routes.getRoutes(),
    );
  }
}
