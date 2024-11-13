import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/features/city/screens/search_screen.dart';
import 'package:weather_app/features/home/models/weather_one_call_model.dart';
import 'package:weather_app/views/widgets/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/image_const.dart';
import '../../../core/constants/string_const.dart';
import '../../../core/themes/text_styles.dart';
import '../../../core/utils/utils.dart';
import '../bloc/home_bloc.dart';
import '../widgets/dialy_weather_widget.dart';
import '../widgets/hourly_weather_widget.dart';
import '../widgets/myDrawer.dart';
import '../widgets/weather_detail_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
        create: (context) => HomeBloc()..getLocation(),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeFailed) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Loading();
            }
            if (state is HomeSuccess) {
              final weather = state.weatherData;
              return Scaffold(
                  drawer: myDrawer(state, weather, context),
                  backgroundColor: AppColors.lightScaffoldBackgroundColor,
                  appBar: AppBar(
                    backgroundColor: AppColors.lightScaffoldBackgroundColor,
                    elevation: 0,
                  ),
                  body: SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          CurrentWeather(place: state.place, weather: weather),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "24 Hours",
                              style: TextStyle(
                                  color: AppColors.textColor, fontSize: 26),
                            ),
                          ),

                          padding16,
                          HourlyWeatherWidget(hourWeather: weather.hourly),
                          padding16,
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.topLeft,
                            child: Image( image: AssetImage("assets/3d/Line Chart.png")),
                          ),
                          padding16,
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Daily",
                              style: TextStyle(
                                  color: AppColors.textColor, fontSize: 26),
                            ),
                          ),
                          padding16,
                          DailyWeatherWidget(dailyWeather: weather.daily),
                          padding16,
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "WeatherDetail",
                              style: TextStyle(
                                  color: AppColors.textColor, fontSize: 26),
                            ),
                          ),
                          padding16,
                          WeatherDetailsWidget(curWeather: weather.current),
                        ],
                      ),
                    ),
                  ));
            }
            if (state is HomeFailed) {
              return SomethingWentWrong(message: state.error);
            }
            if (state is HomeLocationNotEnabled) {
              if (state.error == locationDisabledError) {
                return Center(
                  child: Text(
                    'Location services are disabled.\nPlease Restart app after enabling it.',
                    style: subTitleTextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                );
              }
              return SomethingWentWrong(message: state.error);
            }
            return const SizedBox();
          },
        ));
  }
}

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    Key? key,
    required this.place,
    required this.weather,
  }) : super(key: key);

  final String place;
  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SizedBox(
      width: _size.width,
      child: Stack(
        children: [
          Positioned(
            top: -_size.width * 0.01,
            right: -_size.width * 0.01,
            child: Image.asset(
              ImageAssets.getAsset(weather.current.weather.first.icon),
              height: _size.height * 0.25,
            ),
          ),
          Container(
            width: _size.width * 0.75,
            padding: EdgeInsets.symmetric(
                horizontal: _size.width * 0.08, vertical: _size.height * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${weather.current.temp}°',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 60,
                  ),
                ),
                padding8,
                Row(
mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      place,
                      style:
                      TextStyle(color: AppColors.textColor, fontSize: 30,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.location_on,
                      color: AppColors.textColor,
                      size: 20,
                    ),
                  ],
                ),
                padding16,
                WeatherTypeChip(title: weather.current.weather.first.main),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentWeatherAppBar extends StatelessWidget {
  const CurrentWeatherAppBar({
    Key? key,
    required this.place,
    required this.weather,
  }) : super(key: key);

  final String place;
  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SizedBox(
      width: _size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            color: AppColors.textColor,
            size: 16,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            place,
            style: TextStyle(color: AppColors.textColor, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(width: 20,),
          Image.asset(
            ImageAssets.getAsset(weather.current.weather.first.icon),
            height: _size.height * 0.03,
          ),
          Text(
            '${weather.current.temp}°',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 14,
            ),
          ),

        ],
      ),
    );
  }
}

class WeatherTypeChip extends StatelessWidget {
  const WeatherTypeChip({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: TextStyle(color: AppColors.textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
