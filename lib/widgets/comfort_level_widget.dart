import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_data_current.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/utils/colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({Key? key, required this.weatherDataCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 1, left: 20, bottom: 20),
          child: Text(
            "Comfort Level",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 0, trackWidth: 12
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "Humidity",
                      bottomLabelStyle: const TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.1,
                        height: 1.5,
                        fontWeight: FontWeight.w400
                      )
                    ),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                      hideShadow: false,
                      trackColor: Colors.grey.withAlpha(100),
                      progressBarColors: [
                        Color(0xFF5390d9),
                        Color(0xFF80ffdb),
                      ]
                    )
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Feels Like ",
                        style: TextStyle(
                          fontSize: 14,
                          height: 0.8,
                          color: CustomColor.textColorBlack,
                          fontWeight: FontWeight.w400
                        )
                      ),
                      TextSpan(
                          text: "${weatherDataCurrent.current.feelsLike}",
                          style: const TextStyle(
                              fontSize: 14,
                              height: 0.8,
                              color: CustomColor.textColorBlack,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ]
                  )),
                  Container(
                    height: 25,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    width: 1,
                    color: CustomColor.dividerLine,
                  ),
                  RichText(text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "UV ",
                            style: TextStyle(
                                fontSize: 14,
                                height: 0.8,
                                color: CustomColor.textColorBlack,
                                fontWeight: FontWeight.w400
                            )
                        ),
                        TextSpan(
                            text: "${weatherDataCurrent.current.uvIndex}",
                            style: const TextStyle(
                                fontSize: 14,
                                height: 0.8,
                                color: CustomColor.textColorBlack,
                                fontWeight: FontWeight.w400
                            )
                        ),
                      ]
                  )),
              ]
                ,)
            ],
          ),
        )
      ],
    );
  }
}
