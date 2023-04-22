import 'package:appwrite/appwrite.dart';

class ApiClient {
  Client get _client {
    Client client = Client();

    client
        .setEndpoint(
            'https://8080-appwrite-integrationfor-tdt5rmrat65.ws-us95.gitpod.io/v1')
        .setProject('644343c121e85f9ae324')
        .setSelfSigned();

    return client;
  }

  static Account get account => Account(_instance._client);
  static Databases get database => Databases(_instance._client);
  static Storage get storage => Storage(_instance._client);

  static final ApiClient _instance = ApiClient._internal();
  ApiClient._internal();
  factory ApiClient() => _instance;
}
