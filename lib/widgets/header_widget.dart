import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/colors.dart';

import '../controllers/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  @override
  void initState(){
    getAddress(
        globalController.getLatitude().value,
        globalController.getLongitude().value
    );
    super.initState();
  }
  void getAddress(lat, lon)async{
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];
    setState(() {
      city = place.locality!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              const Text("Hà Nội",  style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8,
                color: CustomColor.wColor
              ),),
              Text(
                date,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
