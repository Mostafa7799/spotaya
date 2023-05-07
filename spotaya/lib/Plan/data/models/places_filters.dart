import 'package:equatable/equatable.dart';

class PlacesFilters extends Equatable {
  final String lat, log, fromTime, toTime, types;

  const PlacesFilters({
    required this.lat,
    required this.log,
    required this.fromTime,
    required this.toTime,
    required this.types,
  });

  @override
  List<Object?> get props => [
        lat,
        log,
        fromTime,
        toTime,
        types,
      ];
}
