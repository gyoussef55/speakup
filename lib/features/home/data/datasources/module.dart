import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/features/home/data/datasources/audio_generation_data_source.dart';
import 'package:speakup/features/home/data/datasources/configuration_data_source.dart';
import 'package:speakup/features/home/data/datasources/local_database_data_source.dart';
import 'package:speakup/features/home/data/datasources/storage_data_source.dart';
import 'package:speakup/features/home/data/datasources/voices_data_source.dart';

final audioGenerationDataSourceProvider = Provider<AudioGenerationDataSource>(
  (ref) => AudioGenerationDataSourceImpl(),
);

final configurationDataSourceProvider = Provider<ConfigurationDataSource>(
  (ref) => ConfigurationDataSourceImpl(),
);

final voicesDataSourceProvider = Provider<VoicesDataSource>(
  (ref) => VoicesDataSourceImpl(),
);

final localDatabaseDataSourceProvider = Provider<LocalDatabaseDataSource>(
  (ref) => LocalDatabaseDataSourceImpl(ref),
);

final storageDataSourceProvider = Provider<StorageDataSource>(
  (ref) => StorageDataSourceImpl(),
);