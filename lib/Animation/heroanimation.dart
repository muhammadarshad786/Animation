import 'package:animation_task/detailed.dart';
import 'package:flutter/material.dart';

class HeroAni extends StatefulWidget {
  const HeroAni({super.key});

  @override
  State<HeroAni> createState() => _HeroAniState();
}

class _HeroAniState extends State<HeroAni> {

  final GlobalKey<AnimatedListState> _keycou=GlobalKey<AnimatedListState>();
 List<String> data=['arshad','ali','raza'];

@override
initState()
{
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_)
  {
    action();
    
  });

   
  
 
  
}

void action()
{

        data.forEach((data) {
        _keycou.currentState!.insertItem( data.length - 1,duration: Duration(milliseconds: 100));
        });
}


  Tween<Offset> _offset=Tween(begin: Offset(0, 1),end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation'),),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: AnimatedList(
              key: _keycou,
              initialItemCount: data.length,
              itemBuilder: (BuildContext context, int index, Animation<double> animation) { 
                return SlideTransition(
                  position: animation.drive(_offset),
                  child: ListTile(
                    leading: Text(data[index]),
                  ),
                  
                  );
                  
               },
             
            ),
          ),

          // Hero(
          //   tag: 'Hero-Test',
          //   child: ListTile(
          //     onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedHero(imagetake: 'assets/ai-robot-wallpaper-24.jpg')));},
          //     title: Text('title'),
          //     leading: Image.asset('assets/ai-robot-wallpaper-24.jpg',height: 300,width: 300,),
          //     trailing: Text('data'),
          //     subtitle: Text('sub'),
          //   ),
          // ),
        
          Hero(
            tag: 'hero-test-1',
            child: Image.asset('assets/ai-robot-wallpaper-24.jpg',height: 300,width: 300,))
        ],
        
        ),
    );
  }
}