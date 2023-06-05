import 'package:animation/pages/signup_animation_page.dart';
import 'package:flutter/material.dart';

class LoginAnimationPage extends StatefulWidget {
  const LoginAnimationPage({Key? key}) : super(key: key);

  @override
  State<LoginAnimationPage> createState() => _LoginAnimationPageState();
}

class _LoginAnimationPageState extends State<LoginAnimationPage> with SingleTickerProviderStateMixin {

  Animation ? animation, delayedAnimation, muchDelayedAnimation;
  AnimationController ? animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(duration: Duration(seconds: 5),vsync: this);
    animation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.fastOutSlowIn));
    delayedAnimation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Interval(0.5, 1.0,curve: Curves.fastOutSlowIn)));
    muchDelayedAnimation = Tween(begin: -1.0,end: 0.0)
        .animate(CurvedAnimation(parent: animationController!, curve: Interval(0.8,1.0, curve: Curves.fastOutSlowIn)));
    animationController!.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(animation: animationController!, builder: (context, child){
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(
                transform: Matrix4.translationValues(animation!.value*width, 0.0, 0.0),
                  child: Container(
                    //padding: EdgeInsets.only(left: 40,),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text("Hello",style: TextStyle(fontSize: 48,fontWeight: FontWeight.w900),),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text("There ",style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text('.',style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.green),),
                            ),

                           ],
                        ),
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
                      SizedBox(height: 5,),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child: Text('Forget Password',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green,
                              fontFamily: 'Montserrat',decoration: TextDecoration.underline),))
                      ),
                      SizedBox(height: 40,),
                      Container(
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
                              child: Text("LOGIN", style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
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
                                child: ImageIcon(NetworkImage("https://cdn-icons-png.flaticon.com/512/59/59439.png")),
                              ),
                              SizedBox(width: 10,),
                              Center(
                                child: Text("Log in with Facebook",style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),),
                              )

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Transform(
                  transform: Matrix4.translationValues(muchDelayedAnimation!.value*width, 0.0, 0.0),
                child: Container(
                  //alignment: Alignment.center,
                 // padding: EdgeInsets.only(left: 40, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New to Spotify ?",style: TextStyle(fontFamily: 'Montserrat'),),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupAnimationPage()));
                        },
                          child: Text('Register',style: TextStyle(fontFamily: "Montserrat", color: Colors.green,decoration: TextDecoration.underline),))

                    ],
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
