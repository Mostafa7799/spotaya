import 'package:dartz/dartz.dart';

import '../../network/failure.dart';
import '../models/places_filters.dart';
import '../models/places_model.dart';

abstract class PlacesBaseRepo {
  Future<Either<Failure, List<Place>>> getPlaces(PlacesFilters filters);
}
