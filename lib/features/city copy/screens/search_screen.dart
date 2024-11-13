import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/image_const.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/text_styles.dart';
import '../../../core/utils/utils.dart';
import '../bloc/city_weather_bloc.dart';

class CityScreen extends StatelessWidget {
  String? city;
  CityScreen({this.city, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetCityWeatherBloc()..add(GetCityWeather(city!)),
      child: Builder(builder: (context) {
        return BlocBuilder<GetCityWeatherBloc, GetCityWeatherState>(
          builder: (context, state) {
            if (state is GetCityWeatherSuccess) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    ImageAssets.getAsset(state.weather.weather.first.icon),
                    height: _size.height * 0.03,
                  ),
                  spacer(),
                  Text(
                    "${state.weather.name}, ${state.weather.country}",
                    style: titleTextStyle(fontSize: 10),
                  ),
                  Text(
                    '${state.weather.temp}° C',
                    style: titleTextStyle(fontSize: 10),
                  ),
                  spacer(height: 12),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      }),
    );
  }
}
