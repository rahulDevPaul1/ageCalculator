import 'package:flutter/material.dart';

import '3rd page.dart';


class ResultPage extends StatelessWidget {
  final int age;

  ResultPage({required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Age: $age years',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ColorBoxesPage(),
                  ),
                );
              },
              child: Text('Go to Color Boxes Page'),
            ),
          ],
        ),
      ),
    );
  }
}