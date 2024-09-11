import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailedHero extends StatefulWidget {
 // String imagetake;
   DetailedHero({super.key});

  @override
  State<DetailedHero> createState() => _DetailedHeroState();
}

class _DetailedHeroState extends State<DetailedHero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Animation'),
      //   automaticallyImplyLeading: true,),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: false,
            pinned: true,
            expandedHeight: 300,
            stretch: false,
            flexibleSpace:const FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground
              ],
              background: Image(
                image: AssetImage('assets/ai-robot-wallpaper-26.jpg'),
                fit: BoxFit.cover,
              ),
            ),

          ),
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            bottom: PreferredSize(preferredSize: Size.fromHeight(-10.0),
            child: SizedBox(),
            ),
            flexibleSpace: Center(
              child: SizedBox(
                height: 20,
                width: 200,
              
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
              
              
                  ),
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index)
              
              {
                return Padding(
                  padding: EdgeInsets.all(20),
                  
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey.withOpacity(0.5)
                    ),

                  ),
                  );

              },
              childCount: 20

            )      
            )

        ],
        // children: [
        //   Hero(tag: 'Hero-Test', child: Image.asset(widget.imagetake,height: 500,width: 500,))
        // ],
      ),
    );
  }
}