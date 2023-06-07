import 'package:flutter/material.dart';

class AnimatedTogglePage extends StatefulWidget {
  const AnimatedTogglePage({Key? key}) : super(key: key);

  @override
  State<AnimatedTogglePage> createState() => _AnimatedTogglePageState();
}

class _AnimatedTogglePageState extends State<AnimatedTogglePage> {
  bool toggleValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: toggleValue ? Colors.greenAccent[100] : Colors.redAccent.withOpacity(0.6),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeIn,
                  top: 3,
                  left: toggleValue ? 60.0 : 0.0,
                  right: toggleValue ? 0.0 : 60.0,
                  child: InkWell(
                    onTap: toggleButton,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 1000),
                      transitionBuilder: (child, animation){
                        return RotationTransition(turns: animation,child: child,);
                      },
                      child: toggleValue ? Icon(Icons.check_circle,color: Colors.green,size: 35,key: UniqueKey(),)
                          :Icon(Icons.remove_circle_outline,color: Colors.red,size: 35, key: UniqueKey(),),
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

   toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}
