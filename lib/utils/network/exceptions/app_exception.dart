class AppException implements Exception {
  final String _message;

  AppException([this._message = '']);

  @override
  String toString() {
    return _message;
  }
}

class FetchDataException extends AppException {
  FetchDataException() : super('Chyba pripojenia 🤖');
}

class EntityNotFoundException extends AppException {
  EntityNotFoundException([String message = ''])
      : super(
          message == '' ? 'Neplatný alebo neexistujúci objekt 🙃' : message,
        );
}

class GenericErrorException extends AppException {
  GenericErrorException() : super('Ups, niečo sa pokazilo 🤧');
}

class BadRequestException extends AppException {
  BadRequestException() : super('Neplatná požiadavka 🤧');
}

class UnauthorizedException extends AppException {
  UnauthorizedException() : super('Nepovolená operácia ❌');
}
