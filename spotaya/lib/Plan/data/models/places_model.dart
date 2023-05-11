import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final String? name, imageUrl, location, activityDuration, activityType;
  final List<String> types;
  const Place({
    required this.location,
    required this.types,
    required this.name,
    required this.imageUrl,
    required this.activityDuration,
    required this.activityType,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    List<String> types = [];
    if (json['types'] != null) {
      types = List<String>.from(json['types'].map((type) => type.toString()));
    }
    return Place(
      location: json['location'] ?? 'none',
      types: types,
      name: json['name'] ?? 'none',
      imageUrl: json['photo'] ?? 'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg',
      activityDuration: json['activity_duration'] ?? 'none',
      activityType: json['activity_type'] ?? 'none',
    );
  }

  @override
  List<Object> get props => [
        location!,
        types,
        name!,
        imageUrl!,
      ];
}
