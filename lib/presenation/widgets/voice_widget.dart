
import 'dart:async';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class VoiceWidget extends StatefulWidget {
  const VoiceWidget({
    Key? key,
    required this.url,
    required this.mode,
  }) : super(key: key);

  final String url;
  final PlayerMode mode;

  @override
  State<VoiceWidget> createState(){

    return  _VoiceWidgetState( this.url, this.mode);
  }
}

class _VoiceWidgetState extends State<VoiceWidget> {
  final AudioPlayer audioPlayer = AudioPlayer();
  final String url;
  final PlayerMode mode;
  late AudioPlayer _audioplayer;
    PlayerState? _audioplayerState;
    PlayerState _playerState=PlayerState.stopped;
    PlayingRoute _plauingRouteState=PlayingRoute.SPEAKERS;
    Duration? _duration;
    Duration? _position;
    StreamSubscription<PlayerControlCommand>? _palyerControlCommandSubscribtion;
    StreamSubscription? _durationSubscription;
    StreamSubscription? _positionSubscribtion;
    StreamSubscription? _playerCompleteSubscribtion;
    StreamSubscription? _playerErrorSubscribtion;
    StreamSubscription? _playerStateSubscribtion;
    bool isplaying,ispaused;




   _VoiceWidgetState(this.url, this.mode);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

mixin PlayingRoute {
}