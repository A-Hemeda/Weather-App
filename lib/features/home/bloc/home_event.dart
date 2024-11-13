part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetHomeData extends HomeEvent {
  final double lat;
  final double long;

  const GetHomeData({required this.lat, required this.long});

  @override
  List<Object?> get props => [lat, long];
}

class LocationError extends HomeEvent {
  final String error;

  const LocationError(this.error);

  @override
  List<Object?> get props => [error];
}
