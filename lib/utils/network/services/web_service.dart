import 'package:living_app/models/rent.dart';
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

  Future<List<Rent>> getRents() async {
    final response = await _helper.get(
      "rent/all",
    );
    var rents = response['content'] as List;

    return rents.map((e) => Rent.fromJson(e)).toList();
  }

  Future<User> getUserDetail(String userId) async {
    final response = await _helper.get(
      "customer/$userId",
    );
    return User.fromJson(response['content']);
  }
}
