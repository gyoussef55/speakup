import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/utils/floating_snack_bar.dart';
import 'package:speakup/features/home/domain/usecases/module.dart';
import 'package:speakup/features/home/presentation/providers/configuration_provider.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/generated_audio.dart';

class GeneratedAudioNotifier extends StateNotifier<GeneratedAudio?> {
  GeneratedAudioNotifier(this.ref) : super(null);

  final Ref ref;

  Future<void> generateAudio(Map<String, dynamic> params) async {
    final keyOrFailure = await ref.read(configurationProvider);
    final key = keyOrFailure.fold((l) {
      FloatingSnackBar.showSnackBar(l.message);
      return '';
    }, (r) => r);
    if (key.isEmpty) {
      return;
    }
    params.addEntries([MapEntry('key', key)]);
    final generatedAudioOrFailure =
        await ref.read(generateAudioProvider).excute(params);
    generatedAudioOrFailure.fold((l) {
      state = null;
      FloatingSnackBar.showSnackBar(l.message);
    }, (r) => state = r);
  }

  Future<void> saveGeneratedAudio() async {
    final savedOrFailure =
        await ref.read(saveGeneratedAudioProvider).excute(state!);
    savedOrFailure.fold((l) {
      FloatingSnackBar.showSnackBar(l.message);
    }, (r) {
      FloatingSnackBar.showSnackBar(AppStrings.audioSavedMessage);
    });
  }

  Future<void> disposeGeneratedAudio() async {
    state = null;
  }

  Future<void> shareGeneratedAudio() async {
    final sharedOrFailure =
        await ref.read(shareGeneratedAudioProvider).excute(state!);
    sharedOrFailure.fold((l) {
      FloatingSnackBar.showSnackBar(l.message);
    }, (r) => null);
  }
}

final generatedAudioNotifierProvider =
    StateNotifierProvider<GeneratedAudioNotifier, GeneratedAudio?>((ref) {
  return GeneratedAudioNotifier(ref);
});
