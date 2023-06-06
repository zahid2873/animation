import 'package:flutter/material.dart';

class AliveUi extends StatefulWidget {
  const AliveUi({Key? key}) : super(key: key);

  @override
  State<AliveUi> createState() => _AliveUiState();
}

class _AliveUiState extends State<AliveUi> with SingleTickerProviderStateMixin {

  Animation ? cardAnimation, delayedCardAnimation, fabButtonAnimation, infoAnimation;
  AnimationController ? animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(duration: Duration(seconds: 4),vsync: this);
    cardAnimation = Tween(begin: 0.0, end: -0.025)
        .animate(CurvedAnimation(parent: animationController!, curve: Curves.fastOutSlowIn));
    delayedCardAnimation = Tween(begin: 0.0, end: -0.050)
        .animate(CurvedAnimation(parent: animationController!,
          curve: Interval(0.5, 1.0,curve: Curves.fastOutSlowIn),));
    fabButtonAnimation = Tween(begin:1.0, end: -0.0008)
        .animate(CurvedAnimation(parent: animationController!,
          curve: Interval(0.8, 1.0,curve: Curves.fastOutSlowIn)));
    infoAnimation = Tween(begin: 0.0, end:0.025)
        .animate(CurvedAnimation(parent: animationController!,
          curve: Interval(0.7, 1.0,curve: Curves.fastOutSlowIn)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    animationController!.forward();
    return AnimatedBuilder(animation: animationController!, builder: (context, child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios),color: Colors.black,),
          title: Text('Near By', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black),),
          actions: [
            // Padding(padding: EdgeInsets.only(right: 8),
            //   child: ImageIcon(NetworkImage("https://png.pngtree.com/template/20191108/ourmid/pngtree-nature-beauty-logo-design-template-woman-healthcare-logo-design-image_328612.jpg"),),
            // ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 20,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, delayedCardAnimation!.value*devHeight, 0.0),
                        width: 270,
                        height: 520,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                  ),
                  Positioned(
                      left: 10,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, cardAnimation!.value*devHeight, 0.0),
                        width: 290,
                        height: 520,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                  ),
                  Container(
                    width: 310,
                    height: 520,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-vV-LzhfVA71bnNN-MG-lpF4qygHPQ_7fPQ&usqp=CAU"),fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 430,
                      left: 15,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, infoAnimation!.value*devHeight, 0.0),
                        width: 270,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.0,
                              color: Colors.black12,
                              spreadRadius: 2.0,
                            ),
                          ]
                        ),
                        child: Container(
                          padding: EdgeInsets.all(7),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Lexica",style: TextStyle(fontFamily: 'Montserrat',fontSize: 20),),
                                  Icon(Icons.female,size: 40,),
                                  SizedBox(width: 95,),
                                  Text("5.8 km",style: TextStyle(fontFamily: 'Monserrat',fontSize: 20,color: Colors.grey),),
                                ],
                              ),
                              SizedBox(height: 9,),
                              Row(
                                children: [
                                  Text("Fate is wonderful", style: TextStyle(fontSize: 15, fontFamily: 'Monserrat',color: Colors.grey),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),

            Container(
              transform: Matrix4.translationValues(0.0, fabButtonAnimation!.value*devHeight, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'btn1',
                    elevation:0,
                    backgroundColor: Colors.white,
                    onPressed: (){},child: Icon(Icons.close,color: Colors.black,),),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(
                        color: Colors.transparent,
                        style: BorderStyle.solid,
                        width: 2.0,
                      )
                    ),
                    child: Container(
                      child: Center(
                        child: IconButton(onPressed: (){},
                            icon: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8iv5MDa3-gxzlrpKIwtJ6UXe_IfRYCfocZGntbRBzF9sLKEeTT8zCSoyrEOglDdCQkCA&usqp=CAU"),color: Colors.lightBlueAccent[300],),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: 'btn2',
                    elevation:0,
                    backgroundColor: Colors.white,
                    onPressed: (){},child: Icon(Icons.favorite,color: Colors.red,),),
                ],
              ),
            )

          ],
        ),
      );
    });
  }
}
