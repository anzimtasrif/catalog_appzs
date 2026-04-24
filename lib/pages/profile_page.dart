import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profile.JPG"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Anzim Tasrif",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text("anzimtasrif89@gmail.com"),
          ],
        ),
      ),
    );
  }
}
