// EXTENDING EXCEPTION CLASS FROM DART SDK...
// HERE WE CAN ADD ANY EXCEPTIONS IN FUTURE AS PER NEED...

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

// FOR REQUEST TIMEOUT AND ALL...
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error during communication\n');
}

// FOR BAD URL AND ALL...
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request\n');
}

// UNAUTHORISED USER AND ALL..
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized request\n');
}

// INVALID INPUTS AND ALL...
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid input\n');
}
