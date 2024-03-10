import 'package:better_player/better_player.dart';
import 'package:better_player_example/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NormalPlayerPage extends StatefulWidget {
  @override
  _NormalPlayerPageState createState() => _NormalPlayerPageState();
}

class _NormalPlayerPageState extends State<NormalPlayerPage> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true,
      looping: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ],
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
        "https://train.file.g2storage.com/teacher/section/videos/encoded/p240/1698914206-8a246c99-be97-475e-8b0a-bd6ca69dcd30.mp4",
      resolutions:  {"p240": "https://train.file.g2storage.com/teacher/section/videos/encoded/p240/1698914206-8a246c99-be97-475e-8b0a-bd6ca69dcd30.mp4",
        "p360": "https://train.file.g2storage.com/teacher/section/videos/encoded/p360/1698914206-8a246c99-be97-475e-8b0a-bd6ca69dcd30.mp4",
        "p480": "https://train.file.g2storage.com/teacher/section/videos/encoded/p480/1698914206-8a246c99-be97-475e-8b0a-bd6ca69dcd30.mp4",
        "p720": "https://train.file.g2storage.com/teacher/section/videos/encoded/p720/1698914206-8a246c99-be97-475e-8b0a-bd6ca69dcd30.mp4"}
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(_betterPlayerDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal player page"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
        ],
      ),
    );
  }
}
