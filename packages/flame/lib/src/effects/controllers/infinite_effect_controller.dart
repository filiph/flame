import 'package:flame/effects.dart';

/// Effect controller that wraps a [child] effect controller and repeats it
/// infinitely.
class InfiniteEffectController extends EffectController
    with HasSingleChildEffectController {
  InfiniteEffectController(EffectController child)
      : _child = child,
        super.empty();

  final EffectController _child;

  @override
  EffectController get child => _child;

  @override
  bool get completed => false;

  @override
  double? get duration => double.infinity;

  @override
  double get progress => child.progress;

  @override
  bool get isRandom => child.isRandom;

  @override
  double advance(double dt) {
    var t = dt;
    for (;;) {
      t = child.advance(t);
      if (t == 0) {
        break;
      }
      child.setToStart();
    }
    return 0;
  }

  @override
  double recede(double dt) {
    var t = dt;
    for (;;) {
      t = child.recede(t);
      if (t == 0) {
        break;
      }
      child.setToEnd();
    }
    return 0;
  }
}
