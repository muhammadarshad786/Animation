import 'dart:async';

import 'package:animation_task/Animation/heartanimation.dart';
import 'package:animation_task/Animation/heroanimation.dart';
import 'package:animation_task/Animation/tweenanimation.dart';
import 'package:animation_task/anitest/fade.dart';
import 'package:animation_task/detailed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  RandomMovingBalls(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double height=400;
  double width=200;
  Color _color=Colors.blue;
  double _opacity=1;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
     
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            
            duration: Duration(seconds: 1),
            height: height,
            width: width,
            color: _color,
            
            child:Column(
              children: [
                ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize:Size (100,100)
              ),
              onPressed: (){
              
              setState(() {
                _color=Colors.red;
              });
            }, child: const Text('Animation color')) ,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize:Size (100,100)
              ),
              onPressed: (){
              
              setState(() {
                height=500;
              });
            }, child: const Text('Animation sized')) ,
            AnimatedOpacity(
              opacity: _opacity,
               duration: Duration(seconds: 1),
               child: Text('hello',style: TextStyle(fontSize: 30),),
               
               ),
               ElevatedButton(onPressed: (){
                setState(() {
                  _opacity=0;
                });
               }, child: Text('opacity'))
              ],
            )

            
            
            
            )

        ]
        
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
