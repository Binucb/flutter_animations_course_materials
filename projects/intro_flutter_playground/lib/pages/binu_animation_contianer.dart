import 'package:flutter/material.dart';
import 'dart:math';

class BinuAnimation extends StatefulWidget {
  const BinuAnimation({Key? key}) : super(key: key);

  @override
  State<BinuAnimation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BinuAnimation> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(16);

  final random = Random();

  void _randomize() {
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Binu's try"),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/0/0c/E-girl.png',
                  ))),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          // child: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.network(
          //     'https://upload.wikimedia.org/wikipedia/commons/0/0c/E-girl.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomize,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
