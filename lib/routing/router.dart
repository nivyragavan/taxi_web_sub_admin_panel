import 'package:flutter/material.dart';
import 'package:taxi_app_sub_admin_panel/routing/routes.dart';

import '../view/manual_booking.dart';
import '../view/overview.dart';
import '../view/profile.dart';
import '../view/ride_booked.dart';
import '../view/ride_cancelled.dart';
import '../view/ride_completed.dart';
import '../view/ride_progress.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverviewPageRoute:
      return _getPageRoute(OverviewPage());
    case ProfilePageRoute:
      return _getPageRoute(ProfilePage());
    case ManualBookingRoute:
      return _getPageRoute(ManualBookingPage());
    case RidesBookedRoute:
      return _getPageRoute(RidesBookedPage());
    case RidesInProgressRoute:
      return _getPageRoute(RidesInProgressPage());
    case RidesCompletedRoute:
      return _getPageRoute(RidesCompletedPage());
    case RidesCancelledRoute:
      return _getPageRoute(RidesCancelledPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
