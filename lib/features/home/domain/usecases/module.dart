
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/features/home/data/repositories/module.dart';
import 'package:speakup/features/home/domain/usecases/generate_audio.dart';
import 'package:speakup/features/home/domain/usecases/get_key.dart';
import 'package:speakup/features/home/domain/usecases/get_voices.dart';
import 'package:speakup/features/home/domain/usecases/save_generated_audio.dart';
import 'package:speakup/features/home/domain/usecases/share_generated_audio.dart';

final generateAudioProvider = Provider<GenerateAudio>((ref) {
  return GenerateAudio(ref.read(generatedAudioProvider));
});

final getVoicesProvider = Provider<GetVoices>((ref) {
  return GetVoices(ref.read(voicesProvider));
});

final getConfigurationProvider = Provider<GetKey>((ref) {
  return GetKey(ref.read(configurationProvider));
});

final saveGeneratedAudioProvider = Provider<SaveGeneratedAudio>((ref) {
  return SaveGeneratedAudio(ref.read(generatedAudioProvider));
});

final shareGeneratedAudioProvider = Provider<ShareGeneratedAudio>((ref) {
  return ShareGeneratedAudio();
});

