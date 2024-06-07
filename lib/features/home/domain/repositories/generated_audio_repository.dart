
import 'package:dartz/dartz.dart';
import 'package:speakup/features/home/domain/entities/generated_audio.dart';

import '../../../../core/error/failures.dart';

abstract class GeneratedAudioRepository {

  Future<Either<Failure, GeneratedAudio>> generateAudio(Map<String,dynamic> params);
  Future<Either<Failure, void>> saveGeneratedAudio(GeneratedAudio generatedAudio);
}
