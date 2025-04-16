class ErrorException implements Exception {
  final String message;
  final int? statusCode;

  ErrorException(this.message, {this.statusCode});

  @override
  String toString() => 'ErrorException(message: $message, statusCode: $statusCode)';
}