import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/routes.dart';
import 'package:weather_app/widget.dart/custom_button.dart';
import '../../providers/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            Text("Hello, ${user.username}"),
            CustomButton(
              label: 'go to detail',
              onTap: () {
                Navigator.pushNamed(context, Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
