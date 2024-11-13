part of 'city_weather_bloc.dart';

abstract class CityWeatherEvent extends Equatable {
  const CityWeatherEvent();
}

class SearchCityWeather extends CityWeatherEvent {
  final String city;

  const SearchCityWeather(this.city);

  @override
  List<Object?> get props => [city];
}
