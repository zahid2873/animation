import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({Key? key}) : super(key: key);

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> with SingleTickerProviderStateMixin {

  Animation ? animation, flipAnimation;
  AnimationController ? animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(duration: Duration(seconds: 5),vsync: this);
    flipAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Interval(0.0, 0.5,curve: Curves.linear)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Flip Animation"),
      ),
      body: AnimatedBuilder(animation: animationController!, builder: (context, child){
        return Center(
          child: InkWell(
            onTap: (){
              animationController!.repeat();
            },
            child: Container(
              height: 200,
              width: 200,

              child: Transform(
                transform: Matrix4.identity()
                ..rotateX(2 * pi * flipAnimation!.value),
                alignment: Alignment.center,
                child: Container(
                  height: 100,
                  width:  100,
                  color: Colors.green.withOpacity(0.3),
                  child: Center(
                    child: Text("This is flip",
                      style: TextStyle(fontFamily: 'Montserrat',fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
