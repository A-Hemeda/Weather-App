import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/features/home/widgets/SvgIcons.dart';
import 'package:flutter/material.dart';
import '../models/current_model.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    Key? key,
    required this.curWeather,
  }) : super(key: key);

  final Current curWeather;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.7,
        crossAxisCount: 2,
      ),
      children: [
        HeadingDetailWidget(
          title: "Humidity",
          value: '${curWeather.humidity}',
          unit: '%',
        ),
        HeadingDetailWidget(
            title: "Wind Speed", value: '${curWeather.windSpeed}', unit: 'm/s',),
        HeadingDetailWidget(
            title: "Pressure", value: '${curWeather.pressure}', unit: 'hPa',),
        HeadingDetailWidget(title: "UV", value: '${curWeather.uvi}',),
        HeadingDetailWidget(
            title: "Visibility", value: '${curWeather.visibility}', unit: 'km',),
        HeadingDetailWidget(
            title: "Cloudiness", value: '${curWeather.clouds}', unit: '%',),
      ],
    );
  }
}

class HeadingDetailWidget extends StatelessWidget {
  final String title;
  final String value;
  final String unit;

  const HeadingDetailWidget({
    Key? key,
    required this.title,
    required this.value,
    this.unit = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(0.1),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  title,
                  style: TextStyle(color: AppColors.textColor, fontSize: 20),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: value,
                        style: TextStyle(
                            color: AppColors.textColor, fontSize: 24),
                      ),
                      TextSpan(
                        text: ' $unit',
                        style: TextStyle(
                            color: AppColors.textColor, fontSize: 24),
                      ),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
