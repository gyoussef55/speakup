import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/features/home/data/datasources/module.dart';
import 'package:speakup/features/home/data/repositories/configuration_repository_impl.dart';
import 'package:speakup/features/home/data/repositories/generated_audio_repository_impl.dart';
import 'package:speakup/features/home/data/repositories/voices_repository_impl.dart';
import 'package:speakup/features/home/domain/repositories/configuration_repository.dart';
import 'package:speakup/features/home/domain/repositories/generated_audio_repository.dart';
import 'package:speakup/features/home/domain/repositories/voices_repository.dart';

import '../../../../core/network/network_info.dart';

final generatedAudioProvider = Provider<GeneratedAudioRepository>((ref) {
  return GeneratedAudioRepositoryImpl(
    ref.read(audioGenerationDataSourceProvider),
    ref.read(localDatabaseDataSourceProvider),
    ref.read(storageDataSourceProvider),
    ref.read(networkInfoProvider),
  );
});

final configurationProvider = Provider<ConfigurationRepository>((ref) {
  return ConfigurationRepositoryImpl(
      ref.read(configurationDataSourceProvider), ref.read(networkInfoProvider));
});

final voicesProvider = Provider<VoicesRepository>((ref) {
  return VoicesRepositoryImpl(ref.read(voicesDataSourceProvider));
});
