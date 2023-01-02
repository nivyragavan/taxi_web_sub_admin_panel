import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/style.dart';
import '../routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = OverviewPageRoute.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverviewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case ProfilePageRoute:
        return _customIcon(Icons.account_circle_outlined, itemName);
      case ManualBookingRoute:
        return _customIcon(Icons.directions_car_rounded, itemName);
      case RidesBookedRoute:
        return _customIcon(Icons.access_time, itemName);
      case RidesInProgressRoute:
        return _customIcon(Icons.loop_rounded, itemName);
      case RidesCompletedRoute:
        return _customIcon(Icons.check_circle_outlined, itemName);
      case RidesCancelledRoute:
        return _customIcon(Icons.cancel_outlined, itemName);
      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: green);

    return Icon(
      icon,
      color: isHovering(itemName) ? black : dark.withOpacity(0.8),
    );
  }
}
