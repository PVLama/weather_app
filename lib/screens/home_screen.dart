
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app/consts/app_assets.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/widgets/comfort_level_widget.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/daily_data_widget.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(AppAssets.imageBackGrd, fit: BoxFit.fill,)),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Obx(() => globalController.checkLoading().isTrue?
            Center(
              child: Image.asset(AppAssets.imageBackGrd1,
              height: 150,
              width: 150,
                fit: BoxFit.cover,
              ),
            ) : Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 20,),
                   HeaderWidget(),
                  CurrentWeatherWidget(
                    weatherDataCurrent: globalController.getData().getCurrentWeather(),
                  ),
                  HourlyDataWidget(weatherDataHourly: globalController.getData().getHourlyWeather()),
                  DailyDataWidget(
                    weatherDataDaily: globalController.getData().getDailyWeather(),
                  ),
                  Container(
                    height: 1,
                    color: CustomColor.dividerLine,
                  ),
                  const SizedBox(height: 10,),
                  ComfortLevel(weatherDataCurrent: globalController.getData().getCurrentWeather()),
                ]
            ),
          )),
        ),
      ),
      ]
    );
  }
}
