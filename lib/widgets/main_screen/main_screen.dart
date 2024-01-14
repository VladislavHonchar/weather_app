import 'package:flutter/material.dart';

class Weather {
  final String city;
  final Widget weatherIconToday;
  final String weatherIconTomorrow;
  final String gradusToday;
  final String gradusTomorrow;

  Weather({
    required this.city,
    required this.weatherIconToday,
    required this.weatherIconTomorrow,
    required this.gradusToday,
    required this.gradusTomorrow,
  });


}



class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final _region = TextEditingController();
  final _weatherList = [
  Weather(
    city: "Kiyv",
    weatherIconToday: Icon(Icons.ac_unit,
    color: Colors.white,),
    weatherIconTomorrow: 'b',
    gradusToday: '3',
    gradusTomorrow: '4',
  ),
  Weather(
    city: "Odesa",
    weatherIconToday: Icon(Icons.ac_unit,
    color: Colors.white,),
    weatherIconTomorrow: 'b',
    gradusToday: '3',
    gradusTomorrow: '4',
  ),
  Weather(
    city: "Odenburg",
    weatherIconToday: Icon(Icons.ac_unit,
    color: Colors.white,),
    weatherIconTomorrow: 'b',
    gradusToday: '3',
    gradusTomorrow: '4',
  ),
];

var _currentWeatherList = <Weather>[];



void _currentWeather() {
  final textFromTextField = _region.text;
  if(textFromTextField.isNotEmpty){
    _currentWeatherList = _weatherList.where((Weather weather) {
      return weather.city.toLowerCase().contains(textFromTextField.toLowerCase());
    }).toList();
  }
  setState(() {
    
  });
}

@override
  void initState() {
    super.initState();
    _currentWeatherList = _weatherList;
    _region.addListener(_currentWeather);
  }




  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 12, 22),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 12, 22),
        foregroundColor: Colors.white,
        title: Text("Your Weather"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              final weather = _currentWeatherList[index];
            return Column(
              children: [
                Text(weather.city,
                style: TextStyle(color: Colors.white),),
                weather.weatherIconToday,
                Text(weather.weatherIconTomorrow),
                Text(weather.gradusToday),
                Text(weather.gradusTomorrow),
              ],
            );
              
            },
          ),
          TextField(
            controller: _region,
          )
        ],
      ),
    );
  }
}