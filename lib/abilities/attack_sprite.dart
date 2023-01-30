import 'package:bonfire/bonfire.dart';

class AttackSprite {
  static Future<SpriteAnimation> _sequenceImage(String path) {
    return SpriteAnimation.load(
      'abilities/$path',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get left =>
      _sequenceImage('attack_effect_left.png');
  static Future<SpriteAnimation> get right =>
      _sequenceImage('attack_effect_right.png');
  static Future<SpriteAnimation> get up =>
      _sequenceImage('attack_effect_top.png');
  static Future<SpriteAnimation> get down =>
      _sequenceImage('attack_effect_bottom.png');
}
