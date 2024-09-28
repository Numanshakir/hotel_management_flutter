

import 'package:cleancode/src/core/router/routers_name.dart';
import 'package:flutter/material.dart';

import '../../features/HotelDetail/presentation/pages/hostel_details_page.dart';

class GenerateRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutersName.hotelDetailPage:
        return MaterialPageRoute(builder: ((context) {
          return const HotelDetailPage();
        }));

      default:
        {
          return MaterialPageRoute(
              builder: ((context) => const Scaffold(
                body: Center(
                  child: Text("No Route"),
                ),
              )));
        }
    }
  }
}