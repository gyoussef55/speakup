import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  Future<bool> requestPermission() async {
    return (await Permission.audio.request().isGranted ||
        await Permission.storage.request().isGranted);
  }
}
