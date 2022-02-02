import 'package:flutter/material.dart';
import 'package:myapp/shared/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AppBottomNavigationBar(),
        body: Center(
      child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/about'),
          child: Text('About')),
    ));
  }
}
