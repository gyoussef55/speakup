

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:speakup/core/audio_player/custom_audio_source.dart';

class CustomAudioPlayer extends StateNotifier<bool> {
  CustomAudioPlayer({this.key}) : super(false);
  final audioPlayer = AudioPlayer();
  final Key? key;

  
  Future<void> togglePlayButton()async{
     
      if (state) {
         await audioPlayer.pause();
        state = false;
      } else {
        state = true;
        audioPlayer.play().then((value) {
           audioPlayer.pause();
          if (audioPlayer.duration!
                  .compareTo(audioPlayer.position) <=
              0) {
            audioPlayer.seek(Duration.zero);
          }
          state = false;
         
        });
      }
  
  }

  Future<void> setAudioSource(Uint8List bytes) async{
    
    await audioPlayer.setAudioSource(CustomAudioSource(bytes), preload: false);
    
  }

  Future<void> stop()async{
    await audioPlayer.stop();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  
}