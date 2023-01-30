import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:teste_game/enemy/goblin_enemy.dart';
import 'package:teste_game/main.dart';

class GoblinGeneratorController extends StateController<GoblinEnemy> {
  final _positionsToRespawn = [
    Vector2(tileSize * 4, tileSize * 4),
    Vector2(tileSize * 16, tileSize * 4),
    Vector2(tileSize * 4, tileSize * 16),
    Vector2(tileSize * 16, tileSize * 16),
  ];
  final _respawns = 2;

  void _respawn(Vector2 position) {
    final hasGameRef = component?.hasGameRef ?? false;
    if (hasGameRef) {
      final goblin = GoblinEnemy(position: position);
      gameRef.add(goblin);
    }
  }

  void respawnDouble() {
    final random = Random();
    final positions = List<Vector2>.from(_positionsToRespawn);
    int numberOfRespawns = _respawns;

    while (numberOfRespawns > 0) {
      // final indexPosition = random.nextInt(positions.length);
      // final position = positions[indexPosition];
      // _respawn(position);
      // positions.remove(position);
      // numberOfRespawns -= 1;
      final index = random.nextInt(positions.length);
      final position = positions.removeAt(index);
      _respawn(position);
      numberOfRespawns--;
    }
  }

  @override
  void update(double dt, GoblinEnemy component) {}
}
