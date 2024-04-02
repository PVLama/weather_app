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
            Container(
              padding: EdgeInsets.all(12),
              height:60,
              width: 60,
              decoration: BoxDecoration(
                color: CustomColor.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(AppAssets.icWind,),
            ),
            Container(
              padding: EdgeInsets.all(12),
              height:60,
              width: 60,
              decoration: BoxDecoration(
                color: CustomColor.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(AppAssets.icCloud),
            ),
            Container(
              padding: EdgeInsets.all(12),
              height:60,
              width: 60,
              decoration: BoxDecoration(
                color: CustomColor.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(AppAssets.icHumidity),
            ),
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
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,

              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds}%",
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text("${weatherDataCurrent.current.humidity} %",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,

              ),
            )
          ],
        ),
      ],
    );
  }

  Widget tempeatureAreaWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        // Image.asset(AppAssets.icCloud, height: 80, width: 80,),
        Container(
          height: 50,
          width: 1,
          color: CustomColor.dividerLine,
        ),
        RichText(
            text: TextSpan(
              children: [
                TextSpan( text: "${weatherDataCurrent.current.temp!.toInt()}°",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 68,
                        color: CustomColor.textColorBlack
                    )),
                TextSpan( text: "${weatherDataCurrent.current.weather![0].description}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: CustomColor.textColorBlack
                    )),

              ],
        ))
      ],
    );
  }
}
