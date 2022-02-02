import 'package:flutter/material.dart';
import 'package:myapp/shared/bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(),
      appBar: AppBar(title: Text('Profile')),
    );
  }
}
