import 'package:flutter/material.dart';
import 'package:myapp/shared/bottom_navigation.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(),
      appBar: AppBar(title: Text('Topics')),
    );
  }
}
