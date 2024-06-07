
import 'package:dartz/dartz.dart';
import 'package:speakup/features/saved_files/domain/entities/audio_files_metadata.dart';
import '../../../../core/error/failures.dart';
import '../entities/audio_file.dart';

abstract class AudioFilesRepository {
  Future<Either<Failure,AudioFilesMetadata>> getAudioFiles();
  Future<Either<Failure,AudioFile>> getAudioFile(String name);
  Future<Either<Failure,void>> deleteAudioFile(String name);
}