
import 'package:sajilo_upachar_ai/features/auth/domain/usecase/login_user.dart';

import '../../domain/entities/user.dart';

class AuthController {
  final LoginUser loginUser;

  AuthController(this.loginUser);

  Future<User> login(String email, String password) {
    return loginUser(email, password);
  }
}
