

import 'package:speakup/features/home/domain/entities/generated_audio.dart';

class GeneratedAudioModel extends GeneratedAudio {
  GeneratedAudioModel({required super.bytes, required super.name});

 factory GeneratedAudioModel.fromEntity(GeneratedAudio generatedAudio) =>
      GeneratedAudioModel(bytes: generatedAudio.bytes, name: generatedAudio.name);
  
}