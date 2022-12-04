class Education {
  final bool kindergarten;
  final bool primarySchool;
  final bool highSchool;

  Education(this.kindergarten, this.primarySchool, this.highSchool);

  Map<String, dynamic> toJson() => {
        'kindergarten': kindergarten,
        'primarySchool': primarySchool,
        'highSchool': highSchool,
      };

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      json['kindergarten'],
      json['primarySchool'],
      json['highSchool'],
    );
  }
}

class FreeTime {
  final bool theater;
  final bool cinema;
  final bool sport;

  FreeTime(this.theater, this.cinema, this.sport);

  Map<String, dynamic> toJson() => {
        'theater': theater,
        'cinema': cinema,
        'sport': sport,
      };

  factory FreeTime.fromJson(Map<String, dynamic> json) {
    return FreeTime(
      json['theater'],
      json['cinema'],
      json['sport'],
    );
  }
}

class Transportation {
  final bool publicTransport;
  final bool nonMotor;
  final bool motor;

  Transportation(this.publicTransport, this.nonMotor, this.motor);

  Map<String, dynamic> toJson() => {
        'publicTransport': publicTransport,
        'nonMotor': nonMotor,
        'motor': motor,
      };

  factory Transportation.fromJson(Map<String, dynamic> json) {
    return Transportation(
      json['publicTransport'],
      json['nonMotor'],
      json['motor'],
    );
  }
}

class RentPreferences {
  final RoommatePreferences? roommatePreferences;
  final List<String>? cityParts;
  final int? maxPrice;
  final Education? education;
  final Transportation? transportation;
  final FreeTime? freeTime;

  RentPreferences(
    this.roommatePreferences,
    this.cityParts,
    this.maxPrice,
    this.education,
    this.transportation,
    this.freeTime,
  );

  Map<String, dynamic> toJson() => {
        'roommatePreferences': roommatePreferences?.toJson(),
        'cityParts': cityParts,
        'maxPrice': maxPrice,
        'education': education?.toJson(),
        'transportation': transportation?.toJson(),
        'freeTime': freeTime?.toJson(),
      };

  factory RentPreferences.fromJson(Map<String, dynamic> json) {
    return RentPreferences(
      RoommatePreferences.fromJson(json['roommatePreferences']),
      json['cityParts'],
      json['maxPrice'],
      Education.fromJson(json['education']),
      Transportation.fromJson(json['transportation']),
      FreeTime.fromJson(json['freeTime']),
    );
  }
}

class RoommatePreferences {
  final String? nationality;
  final String? ageFrom;
  final String? ageTo;
  final String? gender;

  RoommatePreferences(
    this.nationality,
    this.ageFrom,
    this.ageTo,
    this.gender,
  );

  Map<String, dynamic> toJson() => {
        'nationality': nationality,
        'ageFrom': ageFrom,
        'ageTo': ageTo,
        'gender': gender,
      };

  factory RoommatePreferences.fromJson(Map<String, dynamic> json) {
    return RoommatePreferences(
      json['nationality'],
      json['ageFrom'],
      json['ageTo'],
      json['gender'],
    );
  }
}
