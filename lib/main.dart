import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Age Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> days = List.generate(31, (index) => (index + 1).toString());
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July',
    'August', 'September', 'October', 'November', 'December'
  ];

  String selectedDay = '1';
  String selectedMonth = 'January';
  TextEditingController yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select your birthdate:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedDay,
                  onChanged: (String? value) {
                    setState(() {
                      selectedDay = value!;
                    });
                  },
                  items: days.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedMonth,
                  onChanged: (String? value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                  items: months.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your birth year',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                int birthYear = int.tryParse(yearController.text) ?? 0;
                int currentYear = DateTime.now().year;
                int age = currentYear - birthYear;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(age: age),
                  ),
                );
              },
              child: Text('Calculate Age'),
            ),
          ],
        ),
      ),
    );
  }
}

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

class ColorBoxesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Boxes'),
      ),
      body: Center(
        child: Column(

          children: [
            Expanded(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ColorBox(Colors.red),
                ColorBox(Colors.blue),
                ColorBox(Colors.green),
                ColorBox(Colors.yellow),
                ColorBox(Colors.purple),
              ],
            ),),
            SizedBox(height: 16),

            Flexible(child:
            Row(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                ColorBox(Colors.orange),
                ColorBox(Colors.teal),
                ColorBox(Colors.pink),
                ColorBox(Colors.indigo),
                ColorBox(Colors.brown),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final Color color;

  ColorBox(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      color: color,

    );
  }
}