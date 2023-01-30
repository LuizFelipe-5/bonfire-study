import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:teste_game/controllers/goblin_generator_controller.dart';
import 'package:teste_game/enemy/goblin_enemy.dart';
import 'package:teste_game/player/knight_player.dart';

const double tileSize = 32;

void main() {
  BonfireInjector.instance.put((i) => GoblinGeneratorController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Game(),
    );
  }
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      // lightingColorGame: Colors.black.withOpacity(0.9),
      map: TiledWorldMap(
        'maps/map.json',
        forceTileSize: const Size(
          tileSize,
          tileSize,
        ),
      ),
      player: KnightPlayer(),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.red,
            margin: const EdgeInsets.all(20),
          ),
        ],
      ),
      components: [
        GoblinEnemy(
          position: Vector2(
            tileSize * 10,
            tileSize * 10,
          ),
        ),
      ],
    );
  }
}
