import 'package:flutter/material.dart';
import 'package:weather_app/consts/app_assets.dart';
import 'package:weather_app/models/weather_data_current.dart';
import 'package:weather_app/utils/colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key,
    required this.weatherDataCurrent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tempeatureAreaWidget(),
        const SizedBox(height: 10,),
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }
  Widget currentWeatherMoreDetailsWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppAssets.icWind, height: 40, width: 40),
            Image.asset(AppAssets.icCloud, height: 40, width: 40),
            Image.asset(AppAssets.icHumidity, height: 40, width: 40,),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 70,
              child: Text("${weatherDataCurrent.current.windSpeed} km/h",
                style: TextStyle(fontSize: 14, color: CustomColor.wColor),
                textAlign: TextAlign.center,

              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds} %",
                style: const TextStyle(fontSize: 12, color: CustomColor.wColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text("${weatherDataCurrent.current.humidity} %",
                style: const TextStyle(fontSize: 14, color: CustomColor.wColor),
                textAlign: TextAlign.center,

              ),
            )
          ],
        ),
      ],
    );
  }

  Widget tempeatureAreaWidget(){
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RichText(
              text: TextSpan(
                children: [
                  TextSpan( text: "${weatherDataCurrent.current.temp!.toInt()}°",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 68,
                          color: CustomColor.wColor
                      )),
                  TextSpan( text: "${weatherDataCurrent.current.weather![0].description}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: CustomColor.wColor
                      )),

                ],
          )),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            width: 1,
            color: CustomColor.dividerLine,
          ),
          Image.asset(
            "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
            height: 80,
            width: 80,
          ),
        ],
      ),
    );
  }
}
