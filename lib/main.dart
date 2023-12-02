import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int selectedDay = 1;
  int selectedMonth = 1;
  int selectedYear = 1971;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Calculator'),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 280),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            DropdownButton<int>(
              value: selectedDay,
              onChanged: (value) {
                setState(() {
                  selectedDay = value!;
                });
              },
              items: List.generate(31, (index) {
                return DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text('${index + 1}'),
                );
              }),
            ),
            SizedBox(height: 16.0),
            DropdownButton<int>(
              value: selectedMonth,
              onChanged: (value) {
                setState(() {
                  selectedMonth = value!;
                });
              },
              items: List.generate(12, (index) {
                return DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text('${index + 1}'),
                );
              }),
            ),
            SizedBox(height: 16.0),
            DropdownButton<int>(
              value: selectedYear,
              onChanged: (value) {
                setState(() {
                  selectedYear = value!;
                });
              },
              items: List.generate(53, (index) {
                return DropdownMenuItem<int>(
                  value: 1971 + index,
                  child: Text('${1971 + index}'),
                );
              }),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: {
                    'day': selectedDay,
                    'month': selectedMonth,
                    'year': selectedYear,
                  },
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

  @override
  Widget build(BuildContext context) {
    Map<String, int> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, int>;

    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateTime(args['year']!, args['month']!, args['day']!);

    Duration difference = currentDate.difference(birthDate);
    int age = (difference.inDays / 365).floor();

    return Scaffold(

      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your age is $age years.',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage(),
                )
                );
              }, child: Text('Next'),
            )
          ],
        ),

      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            colorfulBox(Colors.red),
            colorfulBox(Colors.blue),
            colorfulBox(Colors.green),
            colorfulBox(Colors.yellow),
            colorfulBox(Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget colorfulBox(Color color) {
    return SizedBox(
      width: 400,
      height: 120,
      child: Container(
        color: color,
      ),
    );
  }
}


