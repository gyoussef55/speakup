import 'package:share_plus/share_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:speakup/core/error/failures.dart';
import 'package:speakup/features/home/domain/entities/generated_audio.dart';

import '../../../../core/usecases/usecase.dart';

class ShareGeneratedAudio implements UseCase<void, GeneratedAudio> {
  @override
  Future<Either<Failure, void>> excute(GeneratedAudio generatedAudio) async {
    try {
      await Share.shareXFiles([
        XFile.fromData(generatedAudio.bytes,
            name: generatedAudio.name, mimeType: generatedAudio.extension)
      ]);
      return const Right(null);
    } catch (e) {
      return Left(SharingFailure());
    }
  }
}
