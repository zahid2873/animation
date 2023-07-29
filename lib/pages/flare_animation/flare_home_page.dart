import 'package:animation/pages/flare_animation/smiley_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareHomePage extends StatefulWidget {
  const FlareHomePage({Key? key}) : super(key: key);

  @override
  State<FlareHomePage> createState() => _FlareHomePageState();
}

class _FlareHomePageState extends State<FlareHomePage> {
  double rating = 5.0;
  String currentAnimation ="5+";
  SmileyController _smileyController = SmileyController();
  _onChanged(double value){
    setState(() {
      var direction = rating < value? '+' : '-';
      currentAnimation = '${value.round()}$direction';
      rating = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height *0.2,
                width: MediaQuery.of(context).size.height *0.2,

                child: FlareActor("assets/happiness_emoji.flr",
                alignment: Alignment.center,
                  fit: BoxFit.cover,
                  animation: currentAnimation,
                  controller: _smileyController,
                )),
            Slider(value: rating,
                max: 5,
                min: 1,
                divisions: 4,
                onChanged: _onChanged),
            Text("${rating}",style: TextStyle(fontSize: 14),)
          ],
        ),
      ),
    );
  }
}
