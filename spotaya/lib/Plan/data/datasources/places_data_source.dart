import 'package:dio/dio.dart';
import 'package:spotaya/Plan/data/models/places_model.dart';
import 'package:spotaya/Plan/network/api_constance.dart';
import 'package:spotaya/Plan/network/dio_helper.dart';

import '../models/places_filters.dart';

abstract class PlacesBaseDataSource {
  Future<List<Place>> getPlacesDataSource(PlacesFilters filters);
}

class PlacesDataSource implements PlacesBaseDataSource {
  final DioHelper _dioHelper;
  PlacesDataSource(this._dioHelper);

  @override
  Future<List<Place>> getPlacesDataSource(PlacesFilters filters) async {
    final _response = await _dioHelper
        .get(endPoint: ApiConstance.getPlacesEndPoint, query: {
          'lng': filters.log,
          'lat': filters.lat,
          'types': filters.types,
          'from_time': filters.fromTime,
          'to_time': filters.toTime,
        }) as Response;

    final places = 
  }
}
