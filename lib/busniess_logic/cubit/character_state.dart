// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {
  CharacterInitial();
}

class CharacterLoading extends CharacterState {
  CharacterLoading();
}

class CharacterLoaded extends CharacterState {
  List<CharacterModel> listCharacter;
  CharacterLoaded({
    required this.listCharacter,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CharacterLoaded && other.listCharacter == listCharacter;
  }

  @override
  int get hashCode => listCharacter.hashCode;
}

class CharacterError extends CharacterState {
  String message;
  CharacterError({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CharacterError && other.message==message;
  }

  @override
  int get hashCode => message.hashCode;

}
