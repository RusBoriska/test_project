import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import './my classes.dart';

// Работа с аудио
class AudiosWidget extends StatefulWidget {
  const AudiosWidget({Key? key}) : super(key: key);

  @override
  State<AudiosWidget> createState() => _AudiosWidgetState();
}

class _AudiosWidgetState extends State<AudiosWidget> {
  String background = "assets/main.jpg";
  final String cat = "assets/audios/cat.mp3";
  final String dog = "assets/audios/dog.mp3";
  final String pig = "assets/audios/pig.mp3";
  String selected = "";


  void assetsAudioPlayer() {
    AssetsAudioPlayer.playAndForget(
        Audio(selected)
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(background),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              children: [
                CustomText('Давайте послушаем, как звучат некоторые животные.'),
                GradientButton(label: "Кошка", onTap: ()
                {
                  setState(() {
                    selected = cat;
                  });
                  assetsAudioPlayer();
                }
                ),
                GradientButton(label: "Собака", onTap: ()
                {
                  setState(() {
                    selected = dog;
                  });
                  assetsAudioPlayer();
                }
                ),
                GradientButton(label: "Свинья", onTap: ()
                {
                  setState(() {
                    selected = pig;
                  });
                  assetsAudioPlayer();
                }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
