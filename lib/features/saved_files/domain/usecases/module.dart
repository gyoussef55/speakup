
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/features/saved_files/domain/usecases/delete_audio_file.dart';
import 'package:speakup/features/saved_files/domain/usecases/get_audio_file.dart';
import 'package:speakup/features/saved_files/domain/usecases/get_audio_files_metadata.dart';
import 'package:speakup/features/saved_files/domain/usecases/share_audio_file.dart';

import '../../data/repositories/module.dart';

final getFileProvider = Provider<GetAudioFile>((ref) {
  return GetAudioFile(ref.read(audioFilesProvider));
});

final deleteFileProvider = Provider<DeleteAudioFile>((ref) {
  return DeleteAudioFile(ref.read(audioFilesProvider));
});

final getAudioFilesProvider = Provider<GetAudioFiles>((ref) {
  return GetAudioFiles(ref.read(audioFilesProvider));
});

final shareAudioFileProvider = Provider<ShareAudioFile>((ref) {
  return ShareAudioFile();
});