import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/core/usecases/usecase.dart';
import 'package:speakup/features/home/domain/entities/generated_audio.dart';
import 'package:speakup/features/home/domain/repositories/generated_audio_repository.dart';

class GenerateAudio implements UseCase<GeneratedAudio, Map<String,dynamic>>{
  GeneratedAudioRepository generatedAudioRepository;
  GenerateAudio(this.generatedAudioRepository);
  @override
  Future<Either<Failure, GeneratedAudio>> excute(Map<String, dynamic> params) async{
   return await  generatedAudioRepository.generateAudio(params);
  }


}