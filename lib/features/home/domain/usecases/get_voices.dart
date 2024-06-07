import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/features/home/domain/entities/voices.dart';
import 'package:speakup/features/home/domain/repositories/voices_repository.dart';

import '../../../../core/usecases/usecase.dart';

class GetVoices implements UseCase<Voices, NoParams>{
  VoicesRepository voicesRepository;
  GetVoices(this.voicesRepository);
  
  @override
  Future<Either<Failure, Voices>> excute(NoParams params) async{
    return await voicesRepository.getVoices();
  }


}