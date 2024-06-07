
import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/core/usecases/usecase.dart';
import 'package:speakup/features/home/domain/entities/generated_audio.dart';
import 'package:speakup/features/home/domain/repositories/generated_audio_repository.dart';

class SaveGeneratedAudio implements UseCase<void,GeneratedAudio> {
  GeneratedAudioRepository generatedAudioRepository;
  SaveGeneratedAudio(this.generatedAudioRepository);
  @override
  Future<Either<Failure, void>> excute(GeneratedAudio generatedAudio) async{
      return await generatedAudioRepository.saveGeneratedAudio(generatedAudio);
     
  }

}