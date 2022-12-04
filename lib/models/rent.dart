class Rent {
  final String id;
  final String? name;
  final String? city;
  final String? country;
  final String? cityPart;
  final String? street;
  final String? houseNumber;
  final double latitude;
  final double longitude;
  final double pricePerPerson;
  final double pricePerArea;
  final String? rentState;
  final String? rentType;
  final double squaredMeters;
  final int numberOfRooms;
  final int numberOfOccupants;
  final String? photo;
  final String? description;

  Rent(
    this.id,
    this.name,
    this.city,
    this.country,
    this.cityPart,
    this.street,
    this.houseNumber,
    this.latitude,
    this.longitude,
    this.pricePerPerson,
    this.pricePerArea,
    this.rentState,
    this.rentType,
    this.squaredMeters,
    this.numberOfRooms,
    this.numberOfOccupants,
    this.photo,
    this.description,
  );

  factory Rent.fromJson(Map<String, dynamic> json) {
    return Rent(
      json['id'],
      json['name'],
      json['city'],
      json['country'],
      json['cityPart'],
      json['street'],
      json['houseNumber'],
      json['latitude'],
      json['longitude'],
      json['pricePerPerson'],
      json['pricePerArea'],
      json['rentState'],
      json['rentType'],
      json['squaredMeters'],
      json['numberOfRooms'],
      json['numberOfOccupants'],
      json['photo'],
      json['description'],
    );
  }
}
