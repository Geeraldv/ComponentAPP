import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({ Key? key }) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amber[600],
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: Text('Animated'),
        ),

        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve:Curves.fastOutSlowIn,
            width: _width,
            height: _height,
           
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ) ,

          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[800],
        child: Icon(Icons.play_arrow_rounded),
        onPressed: _cambiarForma,
        ),
    );
  }


  void _cambiarForma (){
    
    final random = Random();
      setState(() {

        _height = random.nextInt(300).toDouble();
        _width = random.nextInt(300).toDouble();
        _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());

        _color =  Color.fromRGBO(

          random.nextInt(255).toInt(), 
          random.nextInt(255).toInt(), 
          random.nextInt(255).toInt(), 
          1);

      });
  }
}