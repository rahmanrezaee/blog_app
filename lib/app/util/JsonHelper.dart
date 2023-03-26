import 'package:bloc_app/app/models/user_model.dart';

class JsonHelper {
  JsonHelper._();

  static String getUserId(UserModel? user) {
    return user?.id ?? "";
  }
}
