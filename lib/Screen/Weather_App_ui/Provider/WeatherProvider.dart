import 'dart:async';
import 'package:flutter/material.dart';

import '../Modal/WeatherModal.dart';
import '../Weather_Api_Helper.dart';


class WeatherProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  WeatherModal? weatherModal;
  String search = 'mumbai';
  Future<WeatherModal?> fetchDataFromApi() async {
    final json = await apiHelper.fetchApi(search);
    weatherModal = WeatherModal.fromJson(json);
    return weatherModal;
  }

  WeatherProvider()
  {
    fetchDataFromApi();
  }

  // void searchWeather(String value) {
  //   value.toLowerCase();
  //   search = value;
  //   notifyListeners();
  // }

  // Future<void> favouriteCity(
  //     String name, double temp, String condition, String icon) async {
  //   favouriteList.add('$name-$temp-$condition-$icon');
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setStringList('weather', favouriteList);
  // }
  //
  // Future<void> getFavouriteCity() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   favouriteList = sharedPreferences.getStringList('weather') ?? <String>[];
  //   print(favouriteList);
  //   notifyListeners();
  // }



  // void time() {
  //   switch (date.month) {
  //     case 1:
  //       month = 'Jan';
  //       notifyListeners();
  //       break;
  //     case 2:
  //       month = 'Feb';
  //       notifyListeners();
  //       notifyListeners();
  //       break;
  //     case 3:
  //       month = 'Mar';
  //       notifyListeners();
  //       break;
  //     case 4:
  //       month = 'Apr';
  //       notifyListeners();
  //       break;
  //     case 5:
  //       month = 'May';
  //       notifyListeners();
  //       break;
  //     case 6:
  //       month = 'Jun';
  //       notifyListeners();
  //       break;
  //     case 7:
  //       month = 'Jul';
  //       notifyListeners();
  //       break;
  //     case 8:
  //       month = 'Aug';
  //       notifyListeners();
  //       break;
  //     case 9:
  //       month = 'Sep';
  //       notifyListeners();
  //       break;
  //     case 10:
  //       month = 'Oct';
  //       notifyListeners();
  //       break;
  //     case 11:
  //       month = 'Nov';
  //       notifyListeners();
  //       break;
  //     case 12:
  //       month = 'Dec';
  //       notifyListeners();
  //       break;
  //   }
  // }

  // WeatherProvider() {
  //   getFavouriteCity();
  //   Timer(
  //     const Duration(seconds: 3),
  //         () {
  //       changeTheme();
  //     },
  //   );
  // }
}