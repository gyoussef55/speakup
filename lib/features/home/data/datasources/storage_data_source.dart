import 'dart:io';

import 'package:speakup/core/utils/file_saving_directory_path.dart';
import 'package:speakup/features/home/data/models/generated_audio.dart';

abstract class StorageDataSource {
  Future<void> saveGeneratedAudio(GeneratedAudioModel generatedAudio);
}

class StorageDataSourceImpl implements StorageDataSource {
  @override
  Future<void> saveGeneratedAudio(GeneratedAudioModel generatedAudio) async {
    try {
      final savingDirectoryPath =
          await SavingDirectoryPath.getSavingDirectoryPath();
      if (!await Directory(savingDirectoryPath).exists()) {
        await Directory(savingDirectoryPath).create();
      }
      final file = await File(
              '$savingDirectoryPath/${generatedAudio.name}.${generatedAudio.extension}')
          .writeAsBytes(generatedAudio.bytes);
      await file.exists();
    } catch (e) {
      throw Exception();
    }
  }
}
