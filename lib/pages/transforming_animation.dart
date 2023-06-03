import 'package:flutter/material.dart';

class TransformingAnimation extends StatefulWidget {
  const TransformingAnimation({Key? key}) : super(key: key);

  @override
  State<TransformingAnimation> createState() => _TransformingAnimationState();
}

class _TransformingAnimationState extends State<TransformingAnimation> with SingleTickerProviderStateMixin {

  Animation  ? animation, transformAnimation;
  AnimationController ? animationController;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(duration: Duration(seconds: 15),vsync: this);
    animation = Tween(begin: 10.0, end: 200.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.ease));
    transformAnimation = BorderRadiusTween(
        begin: BorderRadius.circular(130.0),
        end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.ease));
    animationController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animationController!, builder: (context, child){
      return Scaffold(
        body: Center(
          child: Stack(
            children: [
               Center(
                 child: Container(
                   alignment: Alignment.center,
                   height: animation!.value,
                   width: animation!.value,
                   decoration: BoxDecoration(
                     borderRadius: transformAnimation!.value,
                     image: DecorationImage(
                         image: NetworkImage("https://static01.nyt.com/images/2022/09/23/multimedia/23onsoccer-neymar2-1-5679/23onsoccer-neymar2-1-5679-mediumSquareAt3X.jpg"),
                     )
                   ),
                 ),
               )
            ],
          ),
        ),
      );
    });
  }
}
