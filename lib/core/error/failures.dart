
import 'package:speakup/core/constants/app_strings.dart';

abstract class Failure  {
abstract final String message;

}

class ServerFailure extends Failure {
  @override
  String get message => AppStrings.serverFailureMessage;
 
}

class SharingFailure extends Failure {
  @override
  String get message => AppStrings.sharingFailureMessage;
  
}

class SavingFailure extends Failure {
  @override
  
  String get message => AppStrings.savingFailureMessage;
  
}

class PermissionFailure extends Failure {
  @override
  
  String get message => AppStrings.permissionFailureMessage;
  
}

class FetchingFailure extends Failure {
  @override
  
  String get message => AppStrings.fetchingFailureMessage;
  
}

class DeletingFailure extends Failure {
  @override
  
  String get message => AppStrings.deletingFailureMessage;
  
}

class NetworkFailure extends Failure {
  @override
  
  String get message => AppStrings.networkFailureMessage;
  
}