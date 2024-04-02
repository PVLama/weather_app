import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/models/weather_data_hourly.dart';
import 'package:weather_app/utils/colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({Key? key,
    required this.weatherDataHourly
  }):super(key: key);


  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 30, left: 20),
          child: const Row(
            children: [
              Icon(Icons.access_time, size: 18,color: CustomColor.wColor,),
              SizedBox(width: 5,),
              Text("Dự báo 24h", style: TextStyle(fontSize: 18, color: CustomColor.wColor),),
            ],
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList(){
    return Container(
      height: 150,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12? 14: weatherDataHourly.hourly.length,
          itemBuilder: (context, index){
            return Obx(() => GestureDetector(
                onTap: (){
                  cardIndex.value = index;
                },
                child: Container(
                  width: 90,
                  margin: EdgeInsets.only(left: 15, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                        CustomColor.greyColor.withOpacity(0.5),
                        CustomColor.greyColor.withOpacity(0.8)
                      ])),
                  child: HourlyDetails(
                    index: index,
                    cardIndex: cardIndex.toInt(),
                    temp: weatherDataHourly.hourly[index].temp!,
                    timeStamp: weatherDataHourly.hourly[index].dt!,
                    weatherIcon: weatherDataHourly.hourly[index].weatherHourly![0].icon!,
                  ),
                )));
          },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  String weatherIcon;

  HourlyDetails(
      {Key? key,
        required this.cardIndex,
        required this.index,
        required this.timeStamp,
        required this.temp,
        required this.weatherIcon})
      : super(key: key);
  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp),
              style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColor.wColor,
              )),
        ),
        Container(
            margin: const EdgeInsets.all(5),
            child: Image.asset(
              "assets/weather/$weatherIcon.png",
              height: 40,
              width: 40,
            )),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text("$temp°",
              style: const TextStyle(
                color: Colors.white
              )),
        )
      ],
    );
  }
}
