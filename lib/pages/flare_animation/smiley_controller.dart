import 'package:flare_flutter/base/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

class SmileyController extends FlareController{
  ActorAnimation ?_blink;
  double _timer = 0;
  
  
  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // TODO: implement advance
    _timer += elapsed;
    _blink!.apply(_timer % _blink!.duration, artboard, 0.5);
    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    // TODO: implement initialize
    _blink = artboard.getAnimation('blink');
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
    // TODO: implement setViewTransform
  }

}
