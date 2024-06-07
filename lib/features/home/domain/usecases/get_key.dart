
import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/core/usecases/usecase.dart';
import 'package:speakup/features/home/domain/repositories/configuration_repository.dart';

class GetKey implements UseCase<String,NoParams>{
  
  ConfigurationRepository configurationRepository;

  GetKey(this.configurationRepository);

  @override
  Future<Either<Failure, String>> excute(NoParams params) async{
    return await configurationRepository.getKey();
  }

}