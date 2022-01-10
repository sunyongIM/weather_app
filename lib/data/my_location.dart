import 'package:geolocator/geolocator.dart';

class MyLocation{
  double? latitude;
  double? longitude;

  Future<void> getMyCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      // print(position);
      // print('myLocation => 위도 : $latitude, 경도 : $longitude');
    } catch (e) {
      print('에러가 발생했습니다');
    }
  }
}