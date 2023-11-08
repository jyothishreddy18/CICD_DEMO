class AppException implements Exception {
  final message;
  final prefix;
  AppException(this.message, this.prefix);

  String toString() {
    return '$message$prefix';
  }
}



class FetchDataException extends AppException{
  FetchDataException([String? message]):  super(message,'Error during Communication');
}
class BadRequestException extends AppException{
  BadRequestException([String? message]):  super(message,'Invalid request');
}
class UnauthoriseExceptions extends AppException{
  UnauthoriseExceptions([String? message]):  super(message,'UnAuthorised Exception');
}
class InvalidInputExeption extends AppException{
  InvalidInputExeption([String? message]):  super(message,'Invalaid Input Exception');
}
class MethodNotAllowedException extends AppException{
  MethodNotAllowedException([String? message]):  super(message,'Method not allowed for the requested resource.');
}