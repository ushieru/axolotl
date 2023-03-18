// ignore_for_file: constant_identifier_names

enum Methods { GET, POST, PUT, DELETE }

extension MethodsExtension on Methods {
  static Methods stringToMethod(String method) {
    switch (method) {
      case 'GET':
        return Methods.GET;
      case 'POST':
        return Methods.POST;
      case 'PUT':
        return Methods.PUT;
      case 'DELETE':
        return Methods.DELETE;
    }
    return Methods.GET;
  }
}
