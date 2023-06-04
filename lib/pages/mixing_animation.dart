import 'package:flutter/material.dart';

class MixingAnimation extends StatefulWidget {
  const MixingAnimation({Key? key}) : super(key: key);

  @override
  State<MixingAnimation> createState() => _MixingAnimationState();
}

class _MixingAnimationState extends State<MixingAnimation> with SingleTickerProviderStateMixin {

  Animation ? animation;
  AnimationController ? animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(duration: Duration(seconds: 8),vsync: this);
    animation = Tween(begin: 0.0, end: -0.15)
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.ease));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(animation: animationController!, builder: (context, child){
            return Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(onPressed: (){}, child: Text("Previous Page")),
                          ElevatedButton(onPressed: (){}, child: Text("Next Page")),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage("https://static01.nyt.com/images/2022/09/23/multimedia/23onsoccer-neymar2-1-5679/23onsoccer-neymar2-1-5679-mediumSquareAt3X.jpg",),
                          fit: BoxFit.cover),
                        ),
                        transform: Matrix4.translationValues(0.0, animation!.value * width, 0.0),
                      ),
                      onTap: (){
                        animationController!.forward();
                      },
                      onDoubleTap: (){
                        animationController!.reverse();
                      },
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
