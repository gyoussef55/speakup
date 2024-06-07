import 'package:intl/intl.dart';
class FileNaming {
   String generateFileNameWithPrefix(String prefix) {
    
    var now = DateTime.now();
    
    var formatter = DateFormat('yyyyMMdd_HHmmss');
    String formattedTime = formatter.format(now);
    
    String fileName = '${prefix}_$formattedTime';
    
    return fileName;
  }
}