import 'dart:convert';

import 'package:speakup/core/utils/file_naming.dart';
import 'package:speakup/features/home/data/models/generated_audio.dart';
import 'package:http/http.dart' as http;

abstract class AudioGenerationDataSource {
  Future<GeneratedAudioModel> generateAudio(Map<String, dynamic> params);
}

class AudioGenerationDataSourceImpl implements AudioGenerationDataSource {
  @override
  Future<GeneratedAudioModel> generateAudio(Map<String, dynamic> params) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://api.elevenlabs.io/v1/text-to-speech/${params['voiceId']}'),
        headers: {
          'Content-Type': 'application/json',
          'xi-api-key': '${params['key']}',
        },
        body: jsonEncode({
          'model_id': 'eleven_multilingual_v2',
          'text': params['text'],
          'voice_settings': {
            'similarity_boost': params['similarity'],
            'stability': params['stability'],
            'style': params['style']
          },
          'use_speaker_boost': true,
        }),
      );

      if (response.statusCode == 200) {
        final name = FileNaming().generateFileNameWithPrefix('SpeakUp');
        return GeneratedAudioModel(bytes: response.bodyBytes, name: name);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
