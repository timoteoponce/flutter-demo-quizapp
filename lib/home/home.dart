import 'package:flutter/material.dart';
import 'package:myapp/login/login.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/shared/bottom_navigation.dart';
import 'package:myapp/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authService = AppAuthService();
    return StreamBuilder(
        stream: authService.userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else if (snapshot.hasError) {
            return Text("Error");
          } else if (snapshot.hasData) {
            return TopicsScreen();
          } else {
            return LoginScreen();
          }
        }
    );
  }
}
