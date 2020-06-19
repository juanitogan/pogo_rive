import 'package:flutter/foundation.dart';

import 'package:pogo/game_engine.dart';
import 'package:pogo_rive/src/components/rive_component.dart';

class RiveParticle extends ParticleComponent {
  final RiveComponent rive;

  RiveParticle({
    @required this.rive,
    double lifespan,
  }) : super(
          lifespan: lifespan,
        );

  @override
  void render() {
    GameCanvas.main.save();
      GameCanvas.main.translate(-rive.width / 2, -rive.height / 2);
      rive.render();
    GameCanvas.main.restore();
  }

  @override
  void update() {
    super.update();
    rive.update();
  }
}
