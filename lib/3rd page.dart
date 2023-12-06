import 'package:flutter/material.dart';

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

              //First color Box
              Container(
                height: 104,
                width: 400,
                color: Colors.yellow,
              ),
              //Scond Color box
              Container(
                height: 104,
                width: 400,
                color:Colors.orange,
              ),
              //3rd color box
              Container(
                height: 104,
                width: 400,
                color:Colors.red,
              ),
              //4th color box
              Container(
                height: 104,
                width: 400,
                color:Colors.grey,
              ),
              //5th color box
              Container(
                height: 104,
                width: 400,
                color:Colors.green,
              ),
              //6th color box
              Container(
                height: 104,
                width: 400,
                color:Colors.pink,
                child: Row(
                  children: [
                    Container(
                      height: 104,
                      width: 90,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 104,
                      width: 90,
                      color: Colors.red,
                    ),
                    Container(
                      height: 104,
                      width: 90,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 104,
                      width: 90,
                      color: Colors.black26,
                    ),
                  ],

                ),
              ),
            ],
          ),

        )
    );
  }
}

class ColorBox extends StatelessWidget {
  final Color color;

  ColorBox(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 104,
      color: color,

    );
  }
}