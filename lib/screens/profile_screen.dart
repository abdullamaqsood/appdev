import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Coming Soon')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("We're building an amazing profile experience for you to manage your account!",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 16),
            CheckboxListTile(
              title: Text('Sign In'),
              value: false,
              onChanged: (value) {
                // Sign in functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
