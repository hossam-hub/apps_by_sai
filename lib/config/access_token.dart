import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sai_app/modules/login/login_controller.dart';

class AccessToken{

  FlutterSecureStorage storage = FlutterSecureStorage();

  static var userToken;
}