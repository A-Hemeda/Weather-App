import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../models/city_weather_model.dart';
import '../resources/city_repository.dart';

part 'city_weather_event.dart';

part 'city_weather_state.dart';

class GetCityWeatherBloc
    extends Bloc<GetCityWeatherEvent, GetCityWeatherState> {
  GetCityWeatherBloc() : super(GetCityWeatherInitial());
  final _getCityRepository = GetCityRepository();

  @override
  Stream<GetCityWeatherState> mapEventToState(
    GetCityWeatherEvent event,
  ) async* {
    if (event is GetCityWeather) {
      yield GetCityWeatherLoading();
      try {
        Response _response =
            await _getCityRepository.getCityWeather(city: event.city);
        if (_response.statusCode == 200) {
          final data = CityWeather.fromJson(_response.data);
          yield GetCityWeatherSuccess(data);
        } else {
          yield GetCityWeatherFailed(_response.data["message"]);
        }
      } catch (error) {
        yield GetCityWeatherFailed(error.toString());
      }
    }
  }
}
