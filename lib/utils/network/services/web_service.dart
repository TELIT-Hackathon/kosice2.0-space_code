import 'package:living_app/models/user.dart';
import 'package:living_app/utils/network/network_helper.dart';

class WebService {
  final ApiBaseHelper _helper = ApiBaseHelper();

// Future<LoginToken> login(LoginUser loginUser) async {
//   final response = await _helper.post(
//     "auth/login",
//     loginUser,
//     doAuth: false,
//   );
//   return LoginToken.fromJson(response['content']);
// }

// Future<void> logout(LogoutDto logoutDto) async {
//   await _helper.post(
//     "auth/logout",
//     logoutDto,
//   );
// }

  Future<User> getUserDetail(String userId) async {
    final response = await _helper.get(
      "customer/${userId}",
    );
    return User.fromJson(response['content']);
  }
}
