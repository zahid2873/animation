import 'package:animation/pages/transforming_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ParentingAnimation extends StatefulWidget {
  const ParentingAnimation({Key? key}) : super(key: key);

  @override
  State<ParentingAnimation> createState() => _ParentingAnimationState();
}

class _ParentingAnimationState extends State<ParentingAnimation> with SingleTickerProviderStateMixin {
  Animation ? animation, childAnimation;
  AnimationController ? animationController;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(duration: Duration(seconds: 4),vsync: this );
    animation = Tween(begin: -0.25, end: 0.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.easeIn));
    childAnimation = Tween(begin: 10.0, end: 125.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.easeIn));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    animationController!.forward();
    return AnimatedBuilder(animation: animationController!, builder: (context,child){
      return Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Container(
            child: Transform(transform: Matrix4.translationValues(animation!.value *width, 0.0, 0.0),
            child: Center(
                child: AnimatedBuilder(animation: childAnimation!, builder: (context,child){
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      height: childAnimation!.value * 2,
                      width: childAnimation!.value *2,
                      child: ListView(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Username"
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TransformingAnimation()));
                          }, child: Text(" Go to Transform Animation"))
                        ],
                      ),
                    ),
                  );
                },),
            ),
            ),
          ),
        ),
      );
    });
  }
}
