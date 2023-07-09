// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:untitled1/data/models/abilities.dart';
import 'package:untitled1/data/models/voice_line.dart';

class CharacterModel {
  String displayName;
  String description;
  String displayIcon;
  String fullPortrait;

  late List<Ability> abilities;
  Voiceline voice_line;

  CharacterModel({
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.fullPortrait,
    required this.voice_line,
  });
}
