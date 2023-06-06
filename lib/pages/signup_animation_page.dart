import 'package:animation/pages/alive_ui.dart';
import 'package:flutter/material.dart';

class SignupAnimationPage extends StatefulWidget {
  const SignupAnimationPage({Key? key}) : super(key: key);

  @override
  State<SignupAnimationPage> createState() => _SignupAnimationPageState();
}

class _SignupAnimationPageState extends State<SignupAnimationPage> with SingleTickerProviderStateMixin {
  Animation ? animation, delayedAnimation;
  AnimationController ? animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(duration: Duration(seconds: 5),vsync: this);
    animation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.fastOutSlowIn));
    delayedAnimation = Tween(begin: -1.0,end: 0.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Interval(0.5, 1.0,curve: Curves.fastOutSlowIn)));
    animationController!.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(animation: animationController!, builder: (context, child){
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(transform: Matrix4.translationValues(animation! . value * width, 0.0, 0.0),
              child: Container(
                child: Row(
                  children: [
                    Text("Signup",style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),),
                    Container(
                      child: Text(".",style: TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 60),),
                    )
                  ],
                ),
              ),
              ),
              Transform(
                transform: Matrix4.translationValues(delayedAnimation!.value*width, 0.0, 0.0),
                child: Container(
                  padding: EdgeInsets.only( top: 20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Colors.green),
                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Colors.green),
                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'NICK NAME',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Colors.green),
                            )
                        ),
                      ),

                      // SizedBox(height: 5,),
                      // Container(
                      //     alignment: Alignment.centerRight,
                      //     child: TextButton(onPressed: (){}, child: Text('Forget Password',
                      //       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green,
                      //           fontFamily: 'Montserrat',decoration: TextDecoration.underline),))
                      // ),
                      SizedBox(height: 40,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>AliveUi()));
                        },
                        child: Container(
                          // padding: EdgeInsets.only(left: 40),
                          height: 40,
                          width: double.infinity,
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: GestureDetector(
                              child: Center(
                                child: Text("SIGNUP", style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          //alignment: Alignment.center,
                          // padding: EdgeInsets.only(left: 40),
                          height: 40,
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Container(
                            //alignment: Alignment.center,
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text("Go BacK",style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),),
                                )

                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    });
  }
}
