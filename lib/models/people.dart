import 'package:living_app/models/preferences.dart';

class LocationUser {
  final String id;
  final String firstName;
  final String lastName;
  final String photo;

  LocationUser(
    this.id,
    this.firstName,
    this.lastName,
    this.photo,
  );

  factory LocationUser.fromJson(Map<String, dynamic> json) {
    return LocationUser(
      json['id'],
      json['firstName'],
      json['lastName'],
      json['photo'],
    );
  }
}

class People {
  final List<LocationUser> users;
  final RentPreferences rentPreferences;

  People(
    this.users,
    this.rentPreferences,
  );

  factory People.fromJson(Map<String, dynamic> json) {
    var users = json['customers'] as List;
    List<LocationUser> usersParsed =
        users.map((i) => LocationUser.fromJson(i)).toList();

    return People(
      usersParsed,
      RentPreferences.fromJson(json['rentPreferences']),
    );
  }
}
