

class WeatherDataHourly {
  List<Hourly> hourly;
  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(
          hourly: List<Hourly>.from(json['hourly'].map((e) => Hourly.fromJson(e))));
}

class Hourly {
  int? dt;
  int? temp;
  List<WeatherHourly>? weatherHourly;

  Hourly({
    this.dt,
    this.temp,
    this.weatherHourly,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    dt: json['dt'] as int?,
    temp: (json['temp'] as num?)?.round(),
    weatherHourly: (json['weather'] as List<dynamic>?)
        ?.map((e) => WeatherHourly.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'temp': temp,
    'weather': weatherHourly?.map((e) => e.toJson()).toList(),
  };
}

class WeatherHourly {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherHourly({this.id, this.main, this.description, this.icon});

  // from json
  factory WeatherHourly.fromJson(Map<String, dynamic> json) => WeatherHourly(
    id: json['id'] as int?,
    main: json['main'] as String?,
    description: json['description'] as String?,
    icon: json['icon'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'main': main,
    'description': description,
    'icon': icon,
  };
}
