
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/features/saved_files/data/datasources/local_database_data_source.dart';
import 'package:speakup/features/saved_files/data/datasources/storage_data_source.dart';

final localDatabaseDataSourceProvider = Provider<LocalDatabaseDataSource>(
  (ref) => LocalDatabaseDataSourceImpl(ref),
);

final storageDataSourceProvider = Provider<StorageDataSource>(
  (ref) => StorageDataSourceImpl(),
);