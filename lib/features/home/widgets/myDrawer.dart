import 'package:weather_app/features/city/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_colors.dart';
import '../../../views/screens/bottom_nav_bar.dart';
import '../../city copy/screens/search_screen.dart';
import '../bloc/home_bloc.dart';
import '../models/weather_one_call_model.dart';
import '../screens/home_screen.dart';

Drawer myDrawer(HomeSuccess state, WeatherData weather, BuildContext context) {
  final _size = MediaQuery.of(context).size;

  return Drawer(
    backgroundColor: const Color(0xFF313a43),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
    ),
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.settings_outlined,
              color: AppColors.textColor,
              size: 26,
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.star,
              color: AppColors.textColor,
              size: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Favourite location',
              style: TextStyle(fontSize: 16, color: AppColors.textColor),
            ),
            const SizedBox(
              width: 60,
            ),
            Icon(
              Icons.info_outline,
              color: AppColors.textColor,
              size: 24,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CurrentWeatherAppBar(place: state.place, weather: weather),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          indent: 2,
          thickness: 0.5,
          color: Colors.white,
          endIndent: 2,
          height: 5,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.add_location_outlined,
              color: AppColors.textColor,
              size: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Other locations',
              style: TextStyle(fontSize: 16, color: AppColors.textColor),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CityScreen(city: 'cairo'),
        const SizedBox(
          height: 20,
        ),
        CityScreen(city: 'giza',),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          selectedColor: Colors.white.withOpacity(0.1),
          title: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(27)),
            ),
            child: const Text(
              'Manage locations',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (Context) => SearchScreen()),
            );
          },
        ),
        const Divider(
          indent: 2,
          thickness: 0.5,
          color: Colors.white,
          endIndent: 2,
          height: 5,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.info_outline,
              color: AppColors.textColor,
              size: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Report wrong location',
              style: TextStyle(fontSize: 16, color: AppColors.textColor),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.headset_mic_outlined,
              color: AppColors.textColor,
              size: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Contact us',
              style: TextStyle(fontSize: 16, color: AppColors.textColor),
            ),
            const SizedBox(
              width: 60,
            ),
          ],
        ),
      ],
    ),
  );
}
