
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/data/database.dart';

final databaseProivder = Provider<DatabaseProvider>((ref) {
  return DatabaseProviderImpl();

});
