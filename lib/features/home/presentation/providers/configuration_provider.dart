import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/core/usecases/usecase.dart';
import 'package:speakup/features/home/domain/usecases/module.dart';

final configurationProvider = Provider<Future<Either<Failure, String>>>((ref) {
  return ref.read(getConfigurationProvider).excute(NoParams());
});
