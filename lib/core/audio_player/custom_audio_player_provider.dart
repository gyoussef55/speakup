
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/audio_player/custom_audio_player.dart';

final customAudioPlayerProvider = StateNotifierProvider.autoDispose.family<CustomAudioPlayer, bool,Key?>((ref,key) {
  return CustomAudioPlayer(key: key);
});
