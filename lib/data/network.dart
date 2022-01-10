import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Network{
  late final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async{
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    //import에 as http를 붙여주지 않으면,
    //Response response = await get(uri);
    //Response와 get의 출처를 알기 어렵다.
    if(response.statusCode == 200){
      String jsonData = response.body;
      var parsingData = convert.jsonDecode(jsonData);
      return parsingData;
    } else {
      print(response.statusCode);
      return response.statusCode;
    }
  }
}