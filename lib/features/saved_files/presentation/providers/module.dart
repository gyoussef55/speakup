import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/usecases/usecase.dart';
import 'package:speakup/core/utils/floating_snack_bar.dart';
import 'package:speakup/features/saved_files/domain/entities/audio_files_metadata.dart';
import 'package:speakup/features/saved_files/domain/usecases/module.dart';

import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/audio_file.dart';

class AudioFilesNotifier extends StateNotifier<AudioFilesMetadata> {
  final Ref ref;
  AudioFilesNotifier(this.ref) : super(AudioFilesMetadata([])) {
    loadAudioFiles();
  }

  Future<void> loadAudioFiles() async {
    final audioFilesOrFailure =
        await ref.read(getAudioFilesProvider).excute(NoParams());
    audioFilesOrFailure.fold((failure) {
      FloatingSnackBar.showSnackBar(failure.message);
    }, (audioFiles) {
      if (!mounted) return;
      state = audioFiles;
    });
  }

  Future<void> deleteAudioFile(String name) async {
    final deleteAudioFileOrFailure =
        await ref.read(deleteFileProvider).excute(name);
    deleteAudioFileOrFailure.fold((failure) {
      FloatingSnackBar.showSnackBar(failure.message);
    }, (audioFiles) {
      FloatingSnackBar.showSnackBar(AppStrings.audioDeletedMessage);
    });
    if (!mounted) return;
    state = AudioFilesMetadata(
        state.names.where((element) => element != name).toList());
  }

  Future<AudioFile> getAudioFile(String name) async {
    final getAudioFileOrFailure = await ref.read(getFileProvider).excute(name);
    final audioFileOrFailure = getAudioFileOrFailure.fold((failure) {
      FloatingSnackBar.showSnackBar(failure.message);
    }, (audioFile) => audioFile);
    return audioFileOrFailure!;
  }

  Future<void> shareAudioFile(String name) async {
    final shareAudioFileOrFailure =
        await ref.read(shareAudioFileProvider).excute(name);
    shareAudioFileOrFailure.fold((failure) {
      FloatingSnackBar.showSnackBar(failure.message);
    }, (audioFiles) => null);
  }
}

final audioFilesNotifierProvider =
    StateNotifierProvider.autoDispose<AudioFilesNotifier, AudioFilesMetadata>(
        (ref) {
  return AudioFilesNotifier(ref);
});
