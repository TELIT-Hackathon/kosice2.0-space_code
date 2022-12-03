import 'package:living_app/models/enums/building.dart';

class LocationUser {
  final String id;
  final String firstName;
  final String surName;
  final String photo;

  LocationUser(
    this.id,
    this.firstName,
    this.surName,
    this.photo,
  );

  factory LocationUser.fromJson(Map<String, dynamic> json) {
    return LocationUser(
      json['id'],
      json['firstName'],
      json['surName'],
      json['photo'],
    );
  }
}

class People {
  final String id;
  final String location;
  final List<LocationUser> users;
  final BuildingType type;
  final double price;

  People(
    this.id,
    this.location,
    this.users,
    this.type,
    this.price,
  );

  factory People.fromJson(Map<String, dynamic> json) {
    var users = json['users'] as List;
    List<LocationUser> usersParsed =
        users.map((i) => LocationUser.fromJson(i)).toList();

    return People(
      json['id'],
      json['location'],
      usersParsed,
      BuildingType.values.byName(json['type']),
      json['price'],
    );
  }
}
