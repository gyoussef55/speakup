import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:path_provider/path_provider.dart';

class SavingDirectoryPath {
  static Future<String> getSavingDirectoryPath() async {
    if (Platform.isAndroid) {
      return await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_MUSIC);
    } else if (Platform.isIOS) {
      return getDownloadsDirectory().toString();
    } else {
      return '';
    }
  }
}
