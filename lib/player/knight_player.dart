import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:teste_game/abilities/attack_sprite.dart';
import 'package:teste_game/player/knight_sprite.dart';

import '../main.dart';

class KnightPlayer extends SimplePlayer
    with ObjectCollision, JoystickListener, Lighting {
  KnightPlayer()
      : super(
          position: Vector2(
            tileSize * 5,
            tileSize * 5,
          ),
          size: Vector2(
            tileSize,
            tileSize,
          ),
          animation: SimpleDirectionAnimation(
            idleRight: KnightSprite.idleRight,
            runRight: KnightSprite.runRight,
            idleLeft: KnightSprite.idleLeft,
            runLeft: KnightSprite.runLeft,
          ),
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

    // setupLighting(
    //   LightingConfig(
    //     radius: 32,
    //     color: Colors.transparent,
    //     blurBorder: 70,
    //   ),
    // );
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 1,
      height: 2,
      align: const Offset(0, 0),
    );
    super.render(canvas);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (hasGameRef && event.id == 1) {
      simpleAttackMelee(
        damage: 20,
        size: Vector2(30, 30),
        animationDown: AttackSprite.down,
        animationLeft: AttackSprite.left,
        animationRight: AttackSprite.right,
        animationUp: AttackSprite.up,
        withPush: true,
      );
    }
    super.joystickAction(event);
  }

  @override
  void die() async {
    removeFromParent();
    final sprite = await KnightSprite.die;
    gameRef.add(
      GameDecoration.withSprite(
        sprite: sprite.getSprite(),
        position: Vector2(
          position.x,
          position.y,
        ),
        size: Vector2.all(32),
      ),
    );
    super.die();
  }
}
