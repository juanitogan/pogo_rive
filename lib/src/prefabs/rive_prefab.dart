import 'package:pogo/game_engine.dart';
import 'package:pogo_rive/src/components/rive_component.dart';

export 'package:pogo_rive/src/components/rive_component.dart';

/// A [GameEntity] containing a [RiveComponent].
/// This gives components position, Z order, rotation, and scale.
///
/// This creates a prefabricated entity intended for single-use entities.
class RivePrefab extends GameEntity {
  RiveComponent riveComponent;

  RivePrefab(
      this.riveComponent,
      {
        Vector2 position,
        int     zOrder = 0,
        double  rotation,
        double  rotationDeg,
        Vector2 scale,
        bool    enabled = true,
        GameEntity parent,
      }
  ) : super(
    position:    position,
    zOrder:      zOrder,
    rotation:    rotation,
    rotationDeg: rotationDeg,
    scale:       scale,
    enabled:     enabled,
    parent:      parent,
  );

  @override
  void update() {
    riveComponent.update();
    riveComponent.render();
  }

}
