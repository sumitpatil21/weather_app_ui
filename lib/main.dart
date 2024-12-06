import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_ui/Screen/Weather_App_ui/Provider/WeatherProvider.dart';
import 'package:weather_app_ui/Screen/Weather_App_ui/View/WeatherDetailScreen.dart';
import 'package:weather_app_ui/Screen/Weather_App_ui/View/WeatherView.dart';

import 'Screen/Weather_App_ui/View/SearchScreen.dart';
import 'Screen/Weather_App_ui/View/SpleshScreen.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>WeatherProvider(),),
        // ChangeNotifierProvider(create: (context) =>SplaceProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context)=>SlpeshScreen(),
          "/home":(context)=> HomeScreen(),
          "/detail":(context)=>Weatherdetailscreen(),
          '/search': (context) => const SearchScreen(),
        },
      ),
    );
  }
}
