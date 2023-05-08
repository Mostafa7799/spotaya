part of 'plan_bloc.dart';

class PlanState extends Equatable {
  final RequestState getPlanState;
  final String getPlanMessage;
  final List<Place> getPlaceData;

  const PlanState({
    this.getPlanState = RequestState.loading,
    this.getPlanMessage = '',
    this.getPlaceData = const [],
  });

  PlanState copyWith({
    RequestState? getPlanState,
    String? getPlanMessage,
    List<Place>? getPlaceData,
  }) =>
      PlanState(
        getPlanState: getPlanState ?? this.getPlanState,
        getPlanMessage: getPlanMessage ?? this.getPlanMessage,
        getPlaceData: getPlaceData ?? this.getPlaceData,
      );

  @override
  List<Object> get props => [
        getPlanState,
        getPlanMessage,
        getPlaceData,
      ];
}
