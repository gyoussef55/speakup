import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/core/network/network_info.dart';
import 'package:speakup/core/utils/permission_handler.dart';
import 'package:speakup/features/home/data/datasources/audio_generation_data_source.dart';
import 'package:speakup/features/home/data/datasources/local_database_data_source.dart';
import 'package:speakup/features/home/data/datasources/storage_data_source.dart';
import 'package:speakup/features/home/data/models/generated_audio.dart';
import 'package:speakup/features/home/domain/entities/generated_audio.dart';
import 'package:speakup/features/home/domain/repositories/generated_audio_repository.dart';

class GeneratedAudioRepositoryImpl implements GeneratedAudioRepository {
  final AudioGenerationDataSource audioGenerationDataSource;
  final LocalDatabaseDataSource localDatabaseDataSource;
  final StorageDataSource storageDataSource;
  final NetworkInfo networkInfo;

  GeneratedAudioRepositoryImpl(this.audioGenerationDataSource,
      this.localDatabaseDataSource, this.storageDataSource, this.networkInfo);

  @override
  Future<Either<Failure, GeneratedAudio>> generateAudio(
      Map<String, dynamic> params) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await audioGenerationDataSource.generateAudio(params));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveGeneratedAudio(
      GeneratedAudio generatedAudio) async {
    if (await PermissionHandler().requestPermission()) {
      try {
        final generatedAudioModel =
            GeneratedAudioModel.fromEntity(generatedAudio);
        await storageDataSource.saveGeneratedAudio(generatedAudioModel);
        await localDatabaseDataSource.saveGeneratedAudio(generatedAudioModel);
        return const Right(null);
      } catch (e) {
        return Left(SavingFailure());
      }
    } else {
      return Left(PermissionFailure());
    }
  }
}
