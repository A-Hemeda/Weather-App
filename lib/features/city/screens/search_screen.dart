import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/image_const.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/text_styles.dart';
import '../../../core/utils/utils.dart';
import '../../home/widgets/weather_detail_widget.dart';
import '../bloc/city_weather_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CityWeatherBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            // centerTitle: true,
            backgroundColor: Color(0xFF7CB2F2),
            title: SizedBox(
              width: _size.width * 0.7,
              child: TextField(
                controller: _searchController,
                style: titleTextStyle(fontSize: 18),
                onSubmitted: (value) {
                  BlocProvider.of<CityWeatherBloc>(context)
                      .add(SearchCityWeather(value));
                },
                decoration: InputDecoration(
                  hintText: 'Search City',
                  hintStyle: subTitleTextStyle(fontSize: 18),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: 28,
                    color: AppColors.iconColor,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                  key: const ValueKey('refresh'),
                  onPressed: () {
                    BlocProvider.of<CityWeatherBloc>(context)
                        .add(SearchCityWeather(_searchController.text));
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 28,
                    color: AppColors.iconColor,
                  ))
            ],
          ),
          backgroundColor: Color(0xFF7CB2F2),
          body: BlocListener<CityWeatherBloc, CityWeatherState>(
            listener: (context, state) {
              if (state is CityWeatherFailed) {
                showSnackBar(context, state.error);
              }
            },
            child: BlocBuilder<CityWeatherBloc, CityWeatherState>(
              builder: (context, state) {
                if (state is CityWeatherInitial) {
                  return Container(
                    height: _size.height * 0.8,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/3d/02d.png',
                          height: _size.height * 0.25,
                        ),
                        spacer(),
                        Text(
                          'Search the weather \nof the city you want !',
                          textAlign: TextAlign.center,
                          style: titleTextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                }
                if (state is CityWeatherLoading) {
                  return const Loading();
                }
                if (state is CityWeatherSuccess) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SizedBox(
                        width: _size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            spacer(),
                            Image.asset(
                              ImageAssets.getAsset(
                                  state.weather.weather.first.icon),
                              height: _size.height * 0.3,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.lightBackgroundColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                state.weather.weather.first.main,
                                style: titleTextStyle(fontSize: 16),
                              ),
                            ),
                            spacer(height: 12),
                            Text(
                              "${state.weather.name}, ${state.weather.country}",
                              style: titleTextStyle(fontSize: 22),
                            ),
                            spacer(height: 20),
                            Text(
                              '${state.weather.temp}° C',
                              style: titleTextStyle(fontSize: 54),
                            ),
                            spacer(height: 12),
                            Text(
                              '${state.weather.tempMax}° C / ${state.weather.tempMin}° C',
                              style: subTitleTextStyle(fontSize: 18),
                            ),
                            spacer(height: _size.height * 0.01),
                            GridView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.5, crossAxisCount: 2),
                              children: [
                                HeadingDetailWidget(
                                  title: "Humidity",
                                  value: '${state.weather.humidity}%',
                                ),
                                HeadingDetailWidget(
                                  title: "Wind Speed",
                                  value: '${state.weather.wind} m/s',
                                ),
                                HeadingDetailWidget(
                                  title: "Pressure",
                                  value: '${state.weather.pressure} hPa',
                                ),
                                HeadingDetailWidget(
                                  title: "Visibility",
                                  value:
                                      '${state.weather.visibility / 1000} km',
                                ),
                                HeadingDetailWidget(
                                  title: "Cloudiness",
                                  value: '${state.weather.clouds}%',
                                ),
                                HeadingDetailWidget(
                                  title: "Feels Like",
                                  value: '${state.weather.feelsLike}',
                                ),
                                HeadingDetailWidget(
                                  title: "Sunrise",
                                  value: getTimeInHHMM(state.weather.sunrise),
                                ),
                                HeadingDetailWidget(
                                  title: "Sunset",
                                  value: getTimeInHHMM(state.weather.sunset),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                if (state is CityWeatherFailed) {
                  return const SomethingWentWrong();
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
