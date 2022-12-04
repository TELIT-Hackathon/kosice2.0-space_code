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
}

class RentPreferences {
  final RoommatePreferences roommatePreferences;
  final List<String> locality;
  final int maxPrice;
  final Education education;
  final Transportation transportation;
  final FreeTime freeTime;

  RentPreferences(
    this.roommatePreferences,
    this.locality,
    this.maxPrice,
    this.education,
    this.transportation,
    this.freeTime,
  );

  Map<String, dynamic> toJson() => {
        'roommatePreferences': roommatePreferences.toJson(),
        'locality': locality,
        'maxPrice': maxPrice,
        'education': education.toJson(),
        'transportation': transportation.toJson(),
        'freeTime': freeTime.toJson(),
      };
}

class RoommatePreferences {
  final String? nationality;
  final int minAge;
  final int maxAge;
  final String? gender;

  RoommatePreferences(
    this.nationality,
    this.minAge,
    this.maxAge,
    this.gender,
  );

  Map<String, dynamic> toJson() => {
        'nationality': nationality,
        'minAge': minAge,
        'maxAge': maxAge,
        'gender': gender,
      };
}
