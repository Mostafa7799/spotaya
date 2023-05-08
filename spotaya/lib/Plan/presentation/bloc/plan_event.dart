part of 'plan_bloc.dart';

abstract class PlanEvent extends Equatable {
  const PlanEvent();

  @override
  List<Object> get props => [];
}

class GetPlanEvent extends PlanEvent {
  final PlacesFilters filters;
  const GetPlanEvent({required this.filters});

  @override
  List<Object> get props => [filters];  
}
