part of 'plan_bloc.dart';

abstract class PlanState extends Equatable {
  const PlanState();  

  @override
  List<Object> get props => [];
}
class PlanInitial extends PlanState {}
