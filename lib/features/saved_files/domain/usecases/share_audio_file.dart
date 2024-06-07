import 'package:dartz/dartz.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/core/usecases/usecase.dart';
import 'package:speakup/core/utils/file_saving_directory_path.dart';

import '../../../../core/utils/permission_handler.dart';

class ShareAudioFile extends UseCase<void, String> {
  ShareAudioFile();

  @override
  Future<Either<Failure, void>> excute(String params) async {
    if(await PermissionHandler().requestPermission()){
      try {
      final savingDirectoryPath = await SavingDirectoryPath.getSavingDirectoryPath();
      await Share.shareXFiles([XFile('$savingDirectoryPath/$params')]);
      return const Right(null);
    } catch (e) {
      return Left(SharingFailure());
    }

    } else {
      return Left(PermissionFailure());
    }
    
  }
}
