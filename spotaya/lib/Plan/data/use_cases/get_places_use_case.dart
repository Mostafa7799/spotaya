import 'package:dartz/dartz.dart';
import 'package:spotaya/Plan/data/models/places_filters.dart';

import '../../network/failure.dart';
import '../models/places_model.dart';
import '../repositories/places_repo.dart';

class GetPlacesUseCase {
  final PlacesBaseRepo _placesBaseRepo;
  const GetPlacesUseCase(this._placesBaseRepo);

  Future<Either<Failure, List<Place>>> call(PlacesFilters filters) async =>
      await _placesBaseRepo.getPlaces(filters);
}
