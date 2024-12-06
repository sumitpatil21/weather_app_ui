import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/WeatherProvider.dart';
import 'WeatherView.dart';

class Weatherdetailscreen extends StatelessWidget {
  const Weatherdetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: FutureBuilder(
        future: weatherProviderFalse.fetchDataFromApi(),
        builder: (context, snapshot) {
          final call = snapshot.data;
          if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        call!.locationModal.name,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0,left: 10,right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          call.forecastModal.forecastDay[0].hour.length,
                          (index) => Container(
                            margin: EdgeInsets.all(10),
                            height: 160,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Text(
                                    call.forecastModal.forecastDay[0].day
                                            .maxtemp_c
                                            .round()
                                            .toString() +
                                        "C",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Image(
                                  image: AssetImage("Assest/image/heavyrain.png"),
                                  height: 40,
                                ),
                                Text(
                                  call.forecastModal.forecastDay[0].hour[index].hourConditionModal.text
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 480,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(120),
                          topRight: Radius.circular(120))),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 30,
                        bottom: 180,
                        child: Container(
                          height: 380,
                          width: 380,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              colors: [
                                Colors.blue.shade100,
                                Colors.blue.shade300,
                                Colors.blue.shade500
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, bottom: 20),
                                child: Text(
                                  call.currentModal.condition.text,
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  iconlist.length,
                                  (index) => Column(
                                    children: [
                                      Text(
                                        iconlist[index]["name"].toString(),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18),
                                      ),
                                      Container(
                                        margin: EdgeInsetsDirectional.only(
                                            top: 13,
                                            start: 20,
                                            end: 20,
                                            bottom: 8),
                                        height: 75,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade50,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Image(
                                            width: 40,
                                            image: AssetImage(
                                              iconlist[index]["img"].toString(),
                                            ),
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          iconlist[index]["main"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 50,
                          bottom: 450,
                          child: Image(
                            image: AssetImage("Assest/image/heavyrain.png"),
                            height: 150,
                          )),
                      Positioned(
                        left: 250,
                        top: -60,
                        child: Text(
                          call.currentModal.temp_c.round().toString(),
                          style: TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.w900,
                              color: Colors.white54),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        left: 20,
                        child: Container(
                          height: 70,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade100,
                                  blurRadius: 18,
                                )
                              ],),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("7 Dec, Sunday",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.blue),),
                                Text("26/11",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Colors.black45),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 420,
                        left: 20,
                        child: Container(
                          height: 70,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade100,
                                blurRadius: 18,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("8 Dec, Monday",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.blue),),
                                Text("27/11",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Colors.black45),),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
