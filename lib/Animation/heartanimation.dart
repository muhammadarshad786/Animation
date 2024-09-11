import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin  {

 late AnimationController _controller;
 late Animation<Color ?> _coloranimation;
 late Animation<double> _sizedanimation;
 bool isFav=false;
 


@override
  void initState() {
  
    _controller=AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this);
      _coloranimation=ColorTween(begin: Colors.green,end: Colors.red).animate(_controller);

      _sizedanimation=TweenSequence<double>([
        TweenSequenceItem<double>(tween: Tween<double>(begin: 30,end: 50), weight: 50),
         TweenSequenceItem<double>(tween: Tween<double>(begin: 50,end: 30), weight: 50),
          
        ]
      ).animate(_controller);

      _controller.addListener((){
        print(_controller.value);
        print(_coloranimation.value);
      });
      _controller.addStatusListener((status){
        print(status);

        if(status==AnimationStatus.completed)
        {
          setState(() {
            isFav=true;
            
          });
        }
         if(status==AnimationStatus.dismissed)
        {
          setState(() {
            isFav=false;
            
          });
        }
      });

      super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(children: [
AnimatedBuilder(animation: _controller, builder: (BuildContext context,_,){
  return IconButton(
    icon: Icon( Icons.heart_broken,
    color:_coloranimation.value ,
    size: _sizedanimation.value,
    
    ),
    onPressed: (){
      
     isFav? _controller.reverse():_controller.forward();
    },
   
  );
})

      ],),
    );
  }
}