import 'package:flutter/material.dart';

import '../../views/screens/bottom_nav_bar.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const BottomNavBar());
    default:
      return MaterialPageRoute(builder: (_) => const BottomNavBar());
  }
}
