import 'package:flutter/material.dart';

class TweenAni extends StatefulWidget {
  const TweenAni({super.key});

  @override
  State<TweenAni> createState() => _TweenAniState();
}

class _TweenAniState extends State<TweenAni> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TweenAnimationBuilder(
            child: Text('Hello Tween Animation',style: TextStyle(fontSize: 30),),
            tween: Tween<double>(begin: 0,end: 1),
             duration: Duration(seconds: 4),
              builder: (BuildContext context,double _val, child){

                // return Opacity(opacity: _val,
                // child: child,
                
                // );
                return Padding(padding: EdgeInsets.all(20),
                child: child,);
              })
        ],
      ),




    );
  }
}