
import 'package:app_fluttr/views/sidebar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarScreen(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
      ),
      body: const Center(
        child: Text('HOME SCREEN'),
      ),
    );
  }
}
