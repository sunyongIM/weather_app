import 'package:flutter/material.dart';
import 'package:weather/data/my_location.dart';
import 'package:weather/data/network.dart';
import 'package:weather/screens/weather.dart';

const String apikey = 'b2342b471d788041f51bd1269c4c5352';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // MyLocation().getMyCurrentLocation();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    double latitude2 = myLocation.latitude!;
    double longitude2 = myLocation.longitude!;
    // print('getLocation => 위도 : $latitude2, 경도 : $longitude2');
    Network network1 = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$apikey&units=metric');
    Network network2 = Network(
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude2&lon=$longitude2&appid=$apikey&units=metric');

    var weatherData = await network1.getJsonData();
    var airData = await network2.getJsonData();
    // print(airData);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Weather(
                  parseWeatherData: weatherData,
                  parseAirData: airData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
