import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
class ValueChangeAnimation extends StatefulWidget {
  const ValueChangeAnimation({Key? key}) : super(key: key);

  @override
  State<ValueChangeAnimation> createState() => _ValueChangeAnimationState();
}

class _ValueChangeAnimationState extends State<ValueChangeAnimation> with SingleTickerProviderStateMixin {
  
  Animation ? animation;
  AnimationController ? animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(duration: Duration(seconds: 5),vsync: this);
    animation = IntTween(begin: 20, end: 0)
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.easeOut));
    animationController!.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(animation: animationController!, builder: (context, child){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Loadin..."),
                  Text(animation!.value.toString(), style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),),
                ],
              ),
            );
          }),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child: Text("Go to "))
        ],
      ),
    );
  }
}
