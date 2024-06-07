

import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/features/home/data/datasources/voices_data_source.dart';
import 'package:speakup/features/home/domain/entities/voices.dart';
import 'package:speakup/features/home/domain/repositories/voices_repository.dart';

class VoicesRepositoryImpl implements VoicesRepository {
  final VoicesDataSource voicesDataSource;
  VoicesRepositoryImpl(this.voicesDataSource);

  @override
  Future<Either<Failure, Voices>> getVoices() async{
    return Right(voicesDataSource.getVoices());
  
}
}