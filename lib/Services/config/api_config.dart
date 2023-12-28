import 'package:fake_store_app/Interactor/enum/persistence_enum.dart';
import 'package:fake_store_app/Services/repositories/persistence_repository.dart';
import 'package:uno/uno.dart';

const String baseUrl = 'https://fakestoreapi.com';

class APIConfig {
  static Future<Uno> request() async{
    final String? token = await PersistenceRepository().read(key: SecureKey.token);
    
    return Uno(
      baseURL: baseUrl,
      headers: {
        'Authorization': 'Bearer ${token ?? ""}',
      },
    );
  }
}