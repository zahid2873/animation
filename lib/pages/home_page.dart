import 'package:animation/pages/parenting_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Animation ? animation, delayedAnimation, muchDelayedAnimation;
  AnimationController ? animationController;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(duration: Duration(seconds: 3),vsync: this);
    animation = Tween(begin: -1.0,end: 0.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.fastOutSlowIn));
    delayedAnimation = Tween(begin: -1.0,end: 0.0)
        .animate(CurvedAnimation(parent: animationController!,
        curve: Interval(0.5, 1.0,curve: Curves.fastOutSlowIn)));
    muchDelayedAnimation = Tween(begin: -1.0,end: 0.0)
        .animate(CurvedAnimation(parent: animationController!,
        curve: Interval(0.8, 1.0,curve: Curves.fastOutSlowIn)));
    animationController!.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(animation: animationController!,
      builder: (context, child){
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(transform: Matrix4.translationValues(animation?.value *width,0.0, 0.0),
            child: Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
            ),
            ),


            Transform(transform: Matrix4.translationValues(delayedAnimation?.value *width, 0.0,0.0),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Username'
                        ),
                      ),
                      SizedBox(height: 5,),

                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Password'
                        ),
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
            ),



            Transform(transform: Matrix4.translationValues(muchDelayedAnimation?.value *width,0.0,0.0,),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(height: 10,),
                      ElevatedButton(
                          onPressed: (){}, child: Text("Login")),
                      SizedBox(height: 5,),
                      Text("Don't have an account."),
                      SizedBox(height: 5,),
                      MaterialButton(
                          hoverColor: Colors.green,
                          highlightColor: Colors.green,
                          focusColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green,width: 2)
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ParentingAnimation()));
                          }, child: Text("Go to Parenting Animation"))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      },
     );
  }
}
