import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/features/home/data/datasources/configuration_data_source.dart';
import 'package:speakup/features/home/domain/repositories/configuration_repository.dart';

import '../../../../core/network/network_info.dart';

class ConfigurationRepositoryImpl implements ConfigurationRepository {
  final ConfigurationDataSource configurationDataSource;
  final NetworkInfo networkInfo;

  ConfigurationRepositoryImpl(this.configurationDataSource, this.networkInfo);

  @override
  Future<Either<Failure, String>> getKey() async {
    if(await networkInfo.isConnected){
      try {
        return Right(await configurationDataSource.getConfiguration());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
