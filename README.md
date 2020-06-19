# pogo_rive

Rive (formerly Flare) plugin to the [Pogo Game Engine](https://pub.dev/packages/pogo).

[Rive](https://rive.app/) is a design tool for vector-based animation.  The [Flare-Flutter package](https://pub.dev/packages/flare_flutter) does the bulk of the work.

## Adding the plugin to your Pogo project

Add the [pogo_rive package](https://pub.dev/packages/pogo_rive) dependency to your project's `pubspec.yaml`, for example (check your version number):

```yaml
dependencies:
  pogo_tiled: ^0.1.0
```

A plugin import is required in addition to the Pogo import in each source file that uses it:

```dart
import 'package:pogo/game_engine.dart';
import 'package:pogo_rive/plugin.dart';
```

# RiveComponent class

The RiveComponent class is a component for use in building a [GameEntity](https://github.com/juanitogan/pogo/blob/master/doc/game_entity.md).  It draws and controls a given Rive animation.

## Constructors

| | |
| :-- | :-- |
| _\<default\>_ | Takes a FlutterActorArtboard by reference. |
| fromFile      | Takes a Rive filename (cached or not).  Returns a Future. |

**TODO look into caching**

## Properties

| | |
| :-- | :-- |
| animationName * | Read-only.  Name of the currently playing animation. |
| artboard      * | Read-only.  Reference to the source FlutterActorArtboard object. |
| debugColor      | Color to draw debug-mode information.  Default: `Color(0xFFFF00FF)` magenta. |
| height          | Read-only.  Scaled height of the source artboard (the height that will be drawn). |
| pivot         * | [Pivot](/doc/pivot.md) point for rotation and anchor point for placement.  Default: `System.defaultPivot` which defaults to `Pivot.center`. |
| scale         * | A scale factor can be provided to adapt the Rive's units to the app's units.  Default: `1.0`. |
| unscaledHeight  | Read-only.  Unscaled height of the source artboard. |
| unscaledWidth   | Read-only.  Unscaled width of the source artboard. |
| width           | Read-only.  Scaled width of the source artboard (the width that will be drawn). |

\* Also is a constructor parameter.

## Methods

| | |
| :-- | :-- |
| loaded       | Returns whether the animation has loaded yet or not. |
| render       | Draws the Rive, translated by the set Pivot, at the set scale.  To execute, call from a `GameEnity.update()`. |
| setAnimation | Sets a new animation for playback by animation name. |
| update       | Updates the animation state.  To execute, call from a `GameEnity.update()`. |

----

See the [example app](example/lib/main.dart).

# RivePrefab

A [prefab](https://github.com/juanitogan/pogo/blob/master/doc/prefabs.md) that implements RiveComponent.

# RiveParticle

An implementation of RiveComponent specific to the built-in [ParticleComponent](https://github.com/juanitogan/pogo/blob/master/doc/components/particle.md).

See Pogo's [**particles** example app](https://github.com/juanitogan/pogo/blob/master/doc/examples/particles/lib/main.dart).
