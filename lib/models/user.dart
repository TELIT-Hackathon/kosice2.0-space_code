import 'package:intl/intl.dart';
import 'package:living_app/models/enums/gender.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? birthDate;
  final String? photo;
  final Gender? gender;

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.birthDate,
    this.photo,
    this.gender,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['firstName'],
      json['lastName'],
      json['email'],
      json['birthDate'] != null
          ? DateFormat('dd.MM.yyyy').format(DateTime.parse(json['birthDate']))
          : null,
      json['photo'],
      json['gender'] != null ? Gender.values.byName(json['gender']) : null,
    );
  }
}
