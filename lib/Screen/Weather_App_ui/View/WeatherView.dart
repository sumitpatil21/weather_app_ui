import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_ui/Global.dart';

import '../Provider/WeatherProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var weatherProviderTrue =
        Provider.of<WeatherProvider>(context, listen: true);
    var weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: weatherProviderFalse.fetchDataFromApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final call = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.black,
                        // spreadRadius: 1,
                        blurRadius: 7,
                        blurStyle: BlurStyle.outer,

                      )]
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQvrbCXUD9K97pQwxER1xa2m82uiCxElhDzA&s"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("/search");
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                                Text(
                                  " " + call!.locationModal.name,
                                  style:
                                      TextStyle(fontSize: 22, letterSpacing: 2),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 20, end: 250, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          call.locationModal.name,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Friday, 6 Dec",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/detail");
                        },
                        child: Container(
                          height: 230,
                          width: 400,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade400,
                                Colors.blue.shade700,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade300.withOpacity(.5),
                                blurStyle: BlurStyle.solid,
                                blurRadius: 10,
                                spreadRadius: -12,
                                offset: Offset(0, 25),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                call.currentModal.temp_c.toString() + "  ",
                                style: TextStyle(
                                    fontSize: 55,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white54),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 20,
                                ),
                                child: Text(
                                  call.currentModal.condition.text,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white54),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 130, left: 20, bottom: 20),
                        child: Image(
                          image: AssetImage("Assest/image/lightrain.png"),
                          height: 180,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      iconlist.length,
                      (index) => Column(
                        children: [
                          Text(iconlist[index]["name"].toString()),
                          Container(
                            margin: EdgeInsetsDirectional.all(20),
                            height: 95,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Image(
                                image: AssetImage(
                                  iconlist[index]["img"].toString(),
                                ),
                                height: 60,
                              ),
                            ),
                          ),
                          Text(iconlist[index]["main"].toString()),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Next 7 Day",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        iconlist.length,
                        (index) => Column(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.all(20),
                              height: 140,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    call.forecastModal.forecastDay[0].hour[index]
                                        .temp_c
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue),
                                  ),
                                  Image(
                                      image: AssetImage(
                                          "Assest/image/heavycloud.png"),
                                      height: 40),
                                  Text(
                                    call.forecastModal.forecastDay[0].day
                                        .chanceOfRain
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

List iconlist = [
  {"img": "Assest/image/windspeed.png", "name": "Wind Speed", "main": "2km/h"},
  {"img": "Assest/image/humidity.png", "name": "Humidity", "main": "65"},
  {"img": "Assest/image/max-temp.png", "name": "Max Temp", "main": "17c"}
];
