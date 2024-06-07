import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/features/home/domain/entities/voices.dart';

abstract class VoicesRepository {

  Future<Either<Failure, Voices>> getVoices();

}