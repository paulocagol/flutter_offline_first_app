import 'package:http/http.dart';

class BaseService {
  Client client = Client();
}

class _BaseService extends BaseClient {
  final Client _client;

  _BaseService(this._client);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['X-Parse-Application-Id'] = 'JBdA3fZBYRKNTlXaWxZzpUNrtTckggovrvSF5gvR';
    request.headers['X-Parse-REST-API-Key'] = 'hkiIVCchQ4LpgcxlHIHh8ZXAq4WHG0MS2nrGhERy';
    request.headers['Content-Type'] = 'application/json';

    return _client.send(request);
  }
}
