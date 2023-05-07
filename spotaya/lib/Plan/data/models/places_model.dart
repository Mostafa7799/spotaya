import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final String name, imageUrl, location, activityDuration;
  final List<String> types;
  const Place({
    required this.location,
    required this.types,
    required this.name,
    required this.imageUrl,
    required this.activityDuration,
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
      imageUrl: json['image'] ?? 'none',
      activityDuration: json['activity_duration'] ?? 'none',
    );
  }

  @override
  List<Object> get props => [
        location,
        types,
        name,
        imageUrl,
      ];
}
