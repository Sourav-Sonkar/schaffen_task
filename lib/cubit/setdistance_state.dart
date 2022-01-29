part of 'setdistance_cubit.dart';

@immutable
abstract class SetdistanceState {}

class SetdistanceInitial extends SetdistanceState {}

class SetdistanceLoading extends SetdistanceState {}

class SetdistanceLoaded extends SetdistanceState {
  final double? distance;
  final double? time;
  SetdistanceLoaded({required this.time, required this.distance});
}

class SetdistanceFailed extends SetdistanceState {
  final String? message;
  SetdistanceFailed({required this.message});
}
