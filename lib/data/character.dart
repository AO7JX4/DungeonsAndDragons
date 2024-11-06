import 'package:dungeons_and_dragons/data/appearance.dart';
import 'package:dungeons_and_dragons/data/item.dart';
import 'package:dungeons_and_dragons/data/money.dart';
import 'package:dungeons_and_dragons/data/attributes.dart';

class Character {
  final String name;
  final int level;
  final Money purse;
  final Attributes stats;
  final Appearance appearance;
  final List<Item> inventory;

  Character(
      {required this.name,
      required this.level,
      required this.purse,
      required this.stats,
      required this.appearance,
      required this.inventory});
}
