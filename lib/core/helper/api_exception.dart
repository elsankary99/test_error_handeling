abstract class ApiException implements Exception {}

class InternalServerError implements ApiException {
  @override
  String toString() => "Internal Server Error";
}

class NotFound implements ApiException {
  @override
  String toString() => "Not Found";
}

class NotInterNetConnection implements ApiException {
  @override
  String toString() => "NotInter Net Connection";
}
