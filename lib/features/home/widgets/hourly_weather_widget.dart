import 'package:weather_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/image_const.dart';
import '../../../core/utils/utils.dart';
import '../../../views/widgets/padding.dart';
import '../models/current_model.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({
    Key? key,
    required this.hourWeather,
  }) : super(key: key);

  final List<Current> hourWeather;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SizedBox(
      height: _size.height * 0.16,
      child: ListView.builder(
          itemCount: hourWeather.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,

          itemBuilder: (context, index) {
            if (index == 0) {
              return const SizedBox();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4,),
                child: Column(
                  children: [
                    Text(
                      getTimeInHour(hourWeather[index].dt),
                      style: TextStyle(color: AppColors.textColor),
                    ),
                    padding12,
                    Image.asset(
                      ImageAssets.getSmallAsset(
                          hourWeather[index].weather.first.icon),
                      height: _size.height * 0.05,
                    ),
                    padding12,
                    Text(
                      '${hourWeather[index].temp}°',
                      style: TextStyle(color: AppColors.textColor),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
