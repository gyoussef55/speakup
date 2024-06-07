
import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/features/saved_files/domain/entities/audio_file.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/audio_files_repository.dart';

class GetAudioFile extends UseCase<AudioFile, String> {
  final AudioFilesRepository repository;

  GetAudioFile(this.repository);

  @override
  Future<Either<Failure, AudioFile>> excute(String params) async {
    return await repository.getAudioFile(params);
  }
}