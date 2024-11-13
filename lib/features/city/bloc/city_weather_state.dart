part of 'city_weather_bloc.dart';

abstract class CityWeatherState extends Equatable {
  const CityWeatherState();
}

class CityWeatherInitial extends CityWeatherState {
  @override
  List<Object> get props => [];
}

class CityWeatherLoading extends CityWeatherState {
  @override
  List<Object> get props => [];
}

class CityWeatherSuccess extends CityWeatherState {
  final CityWeather weather;

  const CityWeatherSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}

class CityWeatherFailed extends CityWeatherState {
  final String error;

  const CityWeatherFailed(this.error);

  @override
  List<Object> get props => [error];
}
