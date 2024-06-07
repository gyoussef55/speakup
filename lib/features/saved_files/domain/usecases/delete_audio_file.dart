
import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/audio_files_repository.dart';

class DeleteAudioFile extends UseCase<void, String> {
  final AudioFilesRepository repository;

  DeleteAudioFile(this.repository);

  @override
  Future<Either<Failure, void>> excute(String params) async {
    return await repository.deleteAudioFile(params);
  }
}