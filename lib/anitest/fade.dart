// import 'dart:ui';

// import 'package:flutter/material.dart';

// class AnimationwithTest extends StatefulWidget {
//   const AnimationwithTest({super.key});

//   @override
//   State<AnimationwithTest> createState() => _AnimationwithTestState();
// }

// class _AnimationwithTestState extends State<AnimationwithTest> with SingleTickerProviderStateMixin {
//    late AnimationController _controller;
//     late Animation<double> _rotateanimation;
//     late Animation<double> _radiusanimation;

//    @override
//   void initState() {
  
//     _controller=AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this)..forward();

//       _rotateanimation=Tween<double>(begin: 0.0,end: 1.0 ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//       _radiusanimation=Tween<double>(begin: 450.0,end: 10.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//       _controller.addListener( ()
//       {
//          setState(() {
          
//         });

//       }
       
//       );

//       _controller.addStatusListener(
//         (status)
//         {
//           if(status==AnimationStatus.completed)
//           {
//             _controller.reverse();
//           }
//           else if(status==AnimationStatus.dismissed){
//             _controller.forward();

//           }
//         }
        
//       );


//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[500],


//       body: Stack(
//         children: [
        
//           BackdropFilter(
//             filter:ImageFilter.blur(
//               sigmaX: 4.0,
//               sigmaY: 4.0,
              
//             ),
            
//             child: Container(
//               height: 200,
//               width: 600,
//             ),
//             ),
//               Align(
//             child: FadeTransition(
//               opacity: _controller,
//               child: Container(
//                 height: 200,
//                 width: 400,
              
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius:BorderRadius.circular(_radiusanimation.value),
                
//                  // shape: BoxShape.circle,
                  
               
              
                  
//                 ),
//               ),
//             ),
//           ),

//         ],
//       ),
//     );
//   }
// }

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class RandomMovingBalls extends StatefulWidget {
  @override
  _RandomMovingBallsState createState() => _RandomMovingBallsState();
}

class _RandomMovingBallsState extends State<RandomMovingBalls> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Ball> balls;
  final int ballCount = Random().nextInt(2) + 9; // 6 or 7 balls
  late Size screenSize;
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();

    balls = List.generate(ballCount, (_) => Ball());
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Handle login logic here
    final email = _emailController.text;
    final password = _passwordController.text;

    // You can add your authentication logic here
    print('Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              balls.forEach((ball) => ball.updatePosition(screenSize));
              return CustomPaint(
                painter: BallsPainter(balls),
                size: Size.infinite,
              );
            },
          ),
          Center(
            child: Container(
              width: 400,
              height: 500,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Ball {
  late double x;
  late double y;
  double dx = (Random().nextDouble() - 0.5) * 5;
  double dy = (Random().nextDouble() - 0.5) * 5;
  Color color = Color.fromRGBO(
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
    1,
  );

  Ball() {
    x = Random().nextDouble() * 300;
    y = Random().nextDouble() * 300;
  }

  void updatePosition(Size screenSize) {
    x += dx;
    y += dy;

    if (x < 0 || x > screenSize.width) {
      dx = -dx;
      randomizeSpeed();
    }
    if (y < 0 || y > screenSize.height) {
      dy = -dy;
      randomizeSpeed();
    }
  }

  void randomizeSpeed() {
    dx = (Random().nextDouble() - 0.5) * 5;
    dy = (Random().nextDouble() - 0.5) * 5;
  }
}

class BallsPainter extends CustomPainter {
  final List<Ball> balls;

  BallsPainter(this.balls);

  @override
  void paint(Canvas canvas, Size size) {
    balls.forEach((ball) {
      final paint = Paint()
        ..color = ball.color
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(ball.x, ball.y), 60, paint); // Adjusted the radius for better visibility
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
