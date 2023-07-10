import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled1/data/models/abilities.dart';
import 'package:untitled1/data/models/role.dart';
import 'package:untitled1/data/models/voice_line.dart';
import 'package:untitled1/data/repo/repo_layer.dart';

import '../../data/models/character.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.repoLayer) : super(CharacterInitial());

  final RepoLayer repoLayer;

  Future<List<CharacterModel>> requestCharachhter() async{

    try{
      final response = await repoLayer.getAgent();
      if(response==null){
        return [];
      }

      final responseDecoded=json.decode(response.body);
      final Mohamed=responseDecoded['data'] as List <dynamic>;
      final list= Mohamed.map((dynamic e){
        final role = e["role"] ?? {};
        final roleInfo =Role(uuid: role["uuid"] ?? "",
         displayName: role["displayName"] ?? "",
          description: role["description"] ?? "",
           displayIcon: role["displayIcon"] ?? "");



           final ability = e["abilities"] as List<dynamic>;
           final abilityInfo = ability.map((a){
            return Ability(slot: a["slot"] ?? "",
             displayName: a["displayName"] ?? "",
              description: a["description"] ?? "",
               displayIcon: a["displayIcon"] ?? "");
           }).toList();
           abilityInfo.retainWhere((element) => element.displayIcon.isNotEmpty);


           final voiceLine =e["voiceLine"] ?? {};
           final voiceMediaList =voiceLine["mediaList"] as List;
           final voiceMedia = Voiceline(voiceLine: voiceMediaList[0]["wave"]);


           return CharacterModel(displayName: e["displayName"] ?? ""
           , description: e["description"] ?? "",
            displayIcon: e["displayIcon"] ?? "",
             fullPortrait: e["fullPortrait"] ?? "",
              voice_line: voiceMedia,
               role: roleInfo);
      }).toSet().toList();

      list.retainWhere((element) => element.fullPortrait.isNotEmpty);
      return list;



    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e.toString());
    }

  }



}
