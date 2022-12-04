import 'package:living_app/models/people.dart';
import 'package:living_app/models/preferences.dart';
import 'package:living_app/models/rent.dart';
import 'package:living_app/models/user.dart';
import 'package:living_app/utils/network/network_helper.dart';

class WebService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<void> savePreferences(
      RentPreferences preferences, String userId) async {
    await _helper.post(
      "customer/$userId/preferences",
      preferences,
    );
  }

  Future<RentPreferences> getPreferences(String userId) async {
    final response = await _helper.get(
      "customer/$userId/preferences",
    );
    return RentPreferences.fromJson(response['content']);
  }

  Future<List<Rent>> getRents() async {
    final response = await _helper.get(
      "rent/all",
    );
    var rents = response['content'] as List;

    return rents.map((e) => Rent.fromJson(e)).toList();
  }

  Future<People> getPeople(String userId) async {
    final response = await _helper.get(
      "customer/$userId/group",
    );
    return People.fromJson(response['content']);
  }

  Future<List<Rent>> getRentMaros(RentPreferences preferences) async {
    final response = await _helper.postMaros(
      "api/rentanal",
      preferences,
    );
    var rents = response['content'] as List;
    print('RESPONSEEEE');
    print(rents);

    return rents.map((e) => Rent.fromJson(e)).toList();
  }

  Future<Rent> getRentById(String rentId) async {
    final response = await _helper.get(
      "rent/$rentId",
    );
    return Rent.fromJson(response['content']);
  }

  Future<User> getUserDetail(String userId) async {
    final response = await _helper.get(
      "customer/$userId",
    );
    return User.fromJson(response['content']);
  }
}
