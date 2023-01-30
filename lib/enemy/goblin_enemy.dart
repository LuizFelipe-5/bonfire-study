import 'package:bonfire/bonfire.dart';
import 'package:teste_game/abilities/attack_sprite.dart';
import 'package:teste_game/controllers/goblin_generator_controller.dart';
import 'package:teste_game/main.dart';

import 'goblin_sprite.dart';

class GoblinEnemy extends SimpleEnemy
    with ObjectCollision, UseStateController<GoblinGeneratorController> {
  GoblinEnemy({
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2(32, 32),
          animation: SimpleDirectionAnimation(
            idleRight: GoblinSprite.idleRight,
            runRight: GoblinSprite.runRight,
            idleLeft: GoblinSprite.idleLeft,
            runLeft: GoblinSprite.runLeft,
          ),
          life: 50,
          speed: 50,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 20),
            align: Vector2(6, 15),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        simpleAttackMelee(
          damage: 10,
          size: Vector2(40, 40),
          animationDown: AttackSprite.down,
          animationLeft: AttackSprite.left,
          animationRight: AttackSprite.right,
          animationUp: AttackSprite.up,
          // withPush: true,
          direction: lastDirection,
        );
      },
      radiusVision: tileSize * 30,
    );
    super.update(dt);
  }

  @override
  void die() {
    controller.respawnDouble();
    removeFromParent();
    super.die();
  }
}
