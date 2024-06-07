import 'package:dartz/dartz.dart';

import 'package:speakup/core/error/failures.dart';
import 'package:speakup/core/utils/permission_handler.dart';
import 'package:speakup/features/saved_files/data/datasources/local_database_data_source.dart';
import 'package:speakup/features/saved_files/data/datasources/storage_data_source.dart';

import 'package:speakup/features/saved_files/domain/entities/audio_file.dart';

import 'package:speakup/features/saved_files/domain/entities/audio_files_metadata.dart';

import '../../domain/repositories/audio_files_repository.dart';

class AudioFilesRepositoryImpl implements AudioFilesRepository {
  final LocalDatabaseDataSource localDatabaseDataSource;
  final StorageDataSource storageDataSource;

  AudioFilesRepositoryImpl({
    required this.localDatabaseDataSource,
    required this.storageDataSource,
  });

  @override
  Future<Either<Failure, void>> deleteAudioFile(String name) async {
    if (await PermissionHandler().requestPermission()) {
      try {
        await localDatabaseDataSource.deleteFile(name);
        await storageDataSource.deleteFile(name);
        return const Right(null);
      } catch (e) {
        return Left(DeletingFailure());
      }
    } else {
      return Left(PermissionFailure());
    }
  }

  @override
  Future<Either<Failure, AudioFile>> getAudioFile(String name) async {
    if (await PermissionHandler().requestPermission()) {
      try {
        return Right(await storageDataSource.getFile(name));
      } catch (e) {
        return Left(FetchingFailure());
      }
    } else {
      return Left(PermissionFailure());
    }
  }

  @override
  Future<Either<Failure, AudioFilesMetadata>> getAudioFiles() async {
    if (await PermissionHandler().requestPermission()) {
      try {
        return Right(await localDatabaseDataSource.getSavedFiles());
      } catch (e) {
        return Left(SavingFailure());
      }
    } else {
      return Left(PermissionFailure());
    }
  }
}
