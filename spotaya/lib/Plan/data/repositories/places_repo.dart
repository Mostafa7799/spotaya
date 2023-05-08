import 'package:dartz/dartz.dart';
import 'package:spotaya/Plan/data/datasources/places_data_source.dart';
import 'package:spotaya/Plan/network/exceptions.dart';

import '../../network/failure.dart';
import '../models/places_filters.dart';
import '../models/places_model.dart';

abstract class PlacesBaseRepo {
  Future<Either<Failure, List<Place>>> getPlaces(PlacesFilters filters);
}

class PlacesRepo implements PlacesBaseRepo {
  final PlacesBaseDataSource _dataSource;
  const PlacesRepo(this._dataSource);

  @override
  Future<Either<Failure, List<Place>>> getPlaces(PlacesFilters filters) async {
    try {
      final result = await _dataSource.getPlacesDataSource(filters);
      return Right(result);
    } on PrimaryServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.message));
    }
  }
}
