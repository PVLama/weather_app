import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/colors.dart';

import '../models/weather_data_daily.dart';

class DailyDataWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataWidget({Key? key, required this.weatherDataDaily}) : super(key: key);

  String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration:BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF9e66ab).withOpacity(0.3), // Màu nhạt ở cuối
            Color(0xFF5a189a).withOpacity(0.7), // Màu chính ở đầu
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Dự báo ngày tới",
              style: TextStyle(color: CustomColor.wColor, fontSize: 17),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }
  Widget dailyList(){
    return SizedBox(
      height: 300,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7 ? 7 : weatherDataDaily.daily.length,
          itemBuilder:(context, index){
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                          getDay(weatherDataDaily.daily[index].dt),
                        style: const TextStyle(
                          color: CustomColor.wColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Image.asset(
                        "assets/weather/${weatherDataDaily.daily[index].weatherDaily![0].icon}.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "${weatherDataDaily.daily[index].temp!.min}°"
                        " - ${weatherDataDaily.daily[index].temp!.max}°",
                      style: TextStyle(fontSize: 16, color: CustomColor.wColor),
                    ),
                    Container(
                      height: 1,
                      color: CustomColor.dividerLine,
                    )
                  ],
                ),
              )
            ],
          );
          }
      ),
    );
  }
}
