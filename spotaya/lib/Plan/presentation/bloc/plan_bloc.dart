import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/places_model.dart';
import '../../data/models/places_filters.dart';
import '../../../core/const/request_state.dart';
import '../../data/use_cases/get_places_use_case.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final GetPlacesUseCase _getPlacesUseCase;

  PlanBloc(this._getPlacesUseCase) : super(const PlanState()) {
    on<GetPlanEvent>(_getPlaces);
  }

  FutureOr<void> _getPlaces(GetPlanEvent event, Emitter<PlanState> emit) async {
    final result = await _getPlacesUseCase(event.filters);

    result.fold(
            (failure) => emit(state.copyWith(
          getPlanState: RequestState.error,
          getPlanMessage: failure.errorMessage,
        )),
            (plan) => emit(state.copyWith(
          getPlanState: RequestState.success,
          getPlaceData: plan,
        )));
  }
}
