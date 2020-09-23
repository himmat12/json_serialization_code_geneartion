// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    email: json['email'] as String,
    id: json['id'] as int,
    phone: json['phone'] as String,
    username: json['username'] as String,
    website: json['website'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    city: json['city'] as String,
    geo: json['geo'] == null
        ? null
        : Geo.fromJson(json['geo'] as Map<String, dynamic>),
    zipcode: json['zipcode'] as String,
    street: json['street'] as String,
    suite: json['suite'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return Geo(
    lat: json['lat'] as String,
    lng: json['lng'] as String,
  );
}

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
