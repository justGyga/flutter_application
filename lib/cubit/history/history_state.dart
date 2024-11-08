part of 'history_cubit.dart';


abstract class HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final String mass;
  final String radius;
  final double? v1;

  HistoryLoaded({required this.mass, required this.radius, this.v1});
}

class HistoryError extends HistoryState {}