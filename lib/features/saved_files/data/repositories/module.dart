
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/features/saved_files/data/datasources/module.dart';
import 'package:speakup/features/saved_files/data/repositories/audio_files_repository_impl.dart';
import 'package:speakup/features/saved_files/domain/repositories/audio_files_repository.dart';

final  audioFilesProvider = Provider<AudioFilesRepository>((ref){
  return AudioFilesRepositoryImpl(
    localDatabaseDataSource: ref.read(localDatabaseDataSourceProvider),
    storageDataSource: ref.read(storageDataSourceProvider),
  );
});