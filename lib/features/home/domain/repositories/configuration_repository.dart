
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class ConfigurationRepository {
  Future<Either<Failure,String>> getKey();
}