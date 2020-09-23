import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;

  User({
    this.name,
    this.address,
    this.email,
    this.id,
    this.phone,
    this.username,
    this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    this.city,
    this.geo,
    this.zipcode,
    this.street,
    this.suite,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@JsonSerializable()
class Geo {
  String lat;
  String lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}
