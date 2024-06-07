import 'dart:io';

import 'package:speakup/features/saved_files/data/models/audio_file_model.dart';

import '../../../../core/utils/file_saving_directory_path.dart';

abstract class StorageDataSource {
  Future<AudioFileModel> getFile(String name);
  Future<void> deleteFile(String name);
}

class StorageDataSourceImpl implements StorageDataSource {
  @override
  Future<void> deleteFile(String name) async {
    try {
      final savingDirectoryPath = await SavingDirectoryPath.getSavingDirectoryPath();
      await File('$savingDirectoryPath/$name')
          .delete();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<AudioFileModel> getFile(String name) async {
    try {
      final savingDirectoryPath = await SavingDirectoryPath.getSavingDirectoryPath();
      final file = await File(
              '$savingDirectoryPath/$name')
          .readAsBytes();
      return AudioFileModel(name, file);
    } catch (e) {
      throw Exception();
    }
  }
}
