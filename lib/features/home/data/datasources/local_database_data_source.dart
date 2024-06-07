import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/utils/file_saving_directory_path.dart';
import 'package:speakup/features/home/data/models/generated_audio.dart';

import '../../../../core/data/database_provider.dart';

abstract class LocalDatabaseDataSource {
  Future<void> saveGeneratedAudio(GeneratedAudioModel generatedAudio);
}

class LocalDatabaseDataSourceImpl implements LocalDatabaseDataSource {
  final Ref ref;
  LocalDatabaseDataSourceImpl(this.ref);

  @override
  Future<void> saveGeneratedAudio(GeneratedAudioModel generatedAudio) async {
    try {
      final dbProvider = ref.read(databaseProivder);
      await dbProvider.initDatabase();
      final database = dbProvider.getDatabaseInstance();
      final savingDirectoryPath = await SavingDirectoryPath.getSavingDirectoryPath();
      await database.insert('files', {
        'path':
            '$savingDirectoryPath/${generatedAudio.name}.${generatedAudio.extension}',
      });
    } catch (e) {
      throw Exception();
    }
  }
}
