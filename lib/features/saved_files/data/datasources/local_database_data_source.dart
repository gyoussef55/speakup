
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speakup/core/utils/file_saving_directory_path.dart';
import 'package:speakup/features/saved_files/data/models/audio_files_metadata_model.dart';
import 'package:path/path.dart' as path;
import '../../../../core/data/database_provider.dart';

abstract class LocalDatabaseDataSource {
  Future<AudioFilesMetadataModel> getSavedFiles();
  Future<void> deleteFile(String name);
}

class LocalDatabaseDataSourceImpl implements LocalDatabaseDataSource {
  final Ref ref;
  LocalDatabaseDataSourceImpl(this.ref);
  @override
  Future<void> deleteFile(String name) async{
    try{
       final dbProvider =  ref.read(databaseProivder);
      await dbProvider.initDatabase();
      final database = dbProvider.getDatabaseInstance();
      final savingDirectoryPath = await SavingDirectoryPath.getSavingDirectoryPath();
      await database.delete('files',where: 'path = ?',whereArgs: ['$savingDirectoryPath/$name']);
    }catch (e){
      throw Exception();
    }
  }

  @override
  Future<AudioFilesMetadataModel> getSavedFiles() async{
    try{
       final dbProvider =  ref.read(databaseProivder);
      await dbProvider.initDatabase();
      final database = dbProvider.getDatabaseInstance();
      final List<Map<String,dynamic>> maps = await database.query('files');
      
      final allFiles = await compute((message){
        List<String> availableFiles = [];
        List<String> notFoundFiles = [];
        for(var row in maps){
          final filePath = row['path'] as String;
          final name = path.basename(filePath);
           if(File(filePath).existsSync()){
              availableFiles.add(name);
           }else{
              notFoundFiles.add(name);
           }
        }
       
       return {'availableFiles':availableFiles,'notFoundFiles':notFoundFiles};

      }, maps);

      for(var name in allFiles['notFoundFiles']!){
          deleteFile(name);
        }

      return AudioFilesMetadataModel(allFiles['availableFiles']!.reversed.toList());

    }catch (e){
      throw Exception();
    }
  }

 
  
  
  
  }