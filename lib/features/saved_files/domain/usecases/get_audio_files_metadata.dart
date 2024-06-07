
import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/core/usecases/usecase.dart';
import 'package:speakup/features/saved_files/domain/entities/audio_files_metadata.dart';
import 'package:speakup/features/saved_files/domain/repositories/audio_files_repository.dart';

class GetAudioFiles extends UseCase<AudioFilesMetadata, NoParams> {
  final AudioFilesRepository repository;

  GetAudioFiles(this.repository);

  @override
  Future<Either<Failure, AudioFilesMetadata>> excute(NoParams params) async {
    return await repository.getAudioFiles();
  }
}