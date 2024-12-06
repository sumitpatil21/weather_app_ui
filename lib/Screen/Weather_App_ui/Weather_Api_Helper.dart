import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper{

  Future<Map> fetchApi(String search) async {
    String api = "http://api.weatherapi.com/v1/forecast.json?key=a777c157f45445c2adb171746241409&q=$search";
    Uri url = Uri.parse(api);
    Response response = await http.get(url);

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return data;
    }
    else{
      return {};
    }
  }
}