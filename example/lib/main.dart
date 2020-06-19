import 'package:pogo/game_engine.dart';
import 'package:pogo_rive/plugin.dart';

// Shows use of RiveComponent, RivePrefab along with single- and double-tap
// functionality.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Screen.setFullScreen();
  await Screen.setPortrait();

  GestureInitializer.detectSingleTaps = true;
  GestureInitializer.detectDoubleTaps = true;

  Game().debugMode = true;  // turn off if debug visualizations not wanted
  runApp(Game().widget);

  await Screen.waitForStartupSizing();

  MainEntity();
}


class MainEntity extends GameEntity {
  final TextConfig fpsTextConfig = const TextConfig(color: const Color(0xFFFFFFFF));
  TextPrefab fpsText;

  MainEntity() {
    Player(Vector2(Screen.size.width / 2, Screen.size.height / 2));
    fpsText = TextPrefab(
        TextComponent("", textConfig: fpsTextConfig, pivot: Pivot.topLeft),
        position: Vector2(0, 20),
        enabled: false,
    );
  }

  @override
  void update() {
    fpsText.enabled = Game().debugMode;
    if (fpsText.enabled) {
      fpsText.textComponent.text = Game().fps(120).toStringAsFixed(1);
    }
  }
}


class Player extends GameEntity with SingleTapDetector, DoubleTapDetector {
  Size screenSize;

  final List<String> _animations = ["Stand", "Wave", "Jump", "Dance"];
  int _currentAnimation = 0;
  RivePrefab riveAnim;

  bool loaded = false;

  Player(Vector2 position) {
    this.position = position;
    RiveComponent.fromFile("assets/Bob_Minion.flr", "Stand", scale: 0.33)
        .then((comp) => riveAnim = RivePrefab(comp, parent: this))
    ;
  }

  @override
  void onSingleTap() {
    cycleAnimation();
  }

  @override
  void onDoubleTap() {
    riveAnim.scale.x += 0.1;
    riveAnim.scale.y += 0.1;
    riveAnim.position.y += 20;
  }

  void cycleAnimation() {
    if (_currentAnimation == _animations.length - 1) {
      _currentAnimation = 0;
    } else {
      _currentAnimation++;
    }
    riveAnim.riveComponent.setAnimation(_animations[_currentAnimation]);
  }

}
