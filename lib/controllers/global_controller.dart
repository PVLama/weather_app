
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/fetch_weather.dart';
import 'package:weather_app/models/weather_data.dart';

class GlobalController extends GetxController{
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  
  final weatherData = WeatherData().obs;
  WeatherData getData(){
    return weatherData.value;
  }
  @override
  void onInit(){
    if(_isLoading.isTrue){
      getLocation();
    }else{
      getIndex();
    }
    super.onInit();
  }
  getLocation()async{
    bool isServiceEnable;
    LocationPermission locationPermission;

    isServiceEnable = await Geolocator.isLocationServiceEnabled();

    if(!isServiceEnable){
      return Future.error("Location not enabled");
    }

    locationPermission = await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.deniedForever){
      return Future.error("Denied forever");
    }else if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        return Future.error("Is Denied");
      }
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
          _latitude.value = value.latitude;
          _longitude.value = value.longitude;
          return FetchWeatherAPI().processData(value.latitude, value.longitude)
            .then((value) {
              weatherData.value = value;
              _isLoading.value = false;
          });
    });
  }

  RxInt getIndex(){
    return _currentIndex;
  }

}