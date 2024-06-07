import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ConfigurationDataSource {
  Future<String> getConfiguration();
}

class ConfigurationDataSourceImpl implements ConfigurationDataSource {
  @override
  Future<String> getConfiguration() async {
    try {
      final accounts = FirebaseFirestore.instance.collection('accounts');
      final query = await accounts.get();
      final size = query.size;
      return query.docs[Random().nextInt(size)].data()['key'];
    } catch (e) {
      throw Exception();
    }
  }
}
