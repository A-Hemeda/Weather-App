import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/views/widgets/padding.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/image_const.dart';
import '../../../core/utils/utils.dart';
import '../models/daily_model.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({Key? key, required this.dailyWeather})
      : super(key: key);
  final List<Daily> dailyWeather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dailyWeather.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const SizedBox();
            }
            return DaySummaryWidget(dailyWeather: dailyWeather[index]);
          }),
    );
  }
}

class DaySummaryWidget extends StatelessWidget {
  const DaySummaryWidget({
    Key? key,
    required this.dailyWeather,
  }) : super(key: key);

  final Daily dailyWeather;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),

          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              getDayFromEpoch(dailyWeather.dt),
              style: TextStyle(color: AppColors.textColor,fontSize: 24),
            ),
          ),
          Image.asset(
            ImageAssets.getSmallAsset(dailyWeather.weather.first.icon),
            width: _size.width * 0.09,
          ),
          SizedBox(width: 5,),
          Image( image: AssetImage("assets/3d-resized/01n.png"),
            width: _size.width * 0.07,
          ),
          padding32,
          Text(
            '${dailyWeather.temp.max}°',
            style: TextStyle(color: AppColors.textColor,fontSize: 18),
          ),
          padding24,
          Text(
            '${dailyWeather.temp.min}°',
            style:TextStyle(color: AppColors.textColor,fontSize: 18),
          ),
        ],
      ),
    );
  }
}
