import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/coffee.dart';

/**
 * ingredients에 Espresso가 포함된 커피를 들만 모아 title 기준 오름차순으로 정렬해주세요.
 */

var api = "api.sampleapis.com";

Future<List<Coffee>> fetchEspressoCoffees() async {
  Uri hotCoffeeUri = Uri.https(api, "/coffee/hot");
  Uri icedCoffeeUri = Uri.https(api, "/coffee/iced");
  final hotCoffeesResponse = await http.get(hotCoffeeUri);
  final icedCoffeesResponse = await http.get(icedCoffeeUri);
  List hotCoffeesJson = jsonDecode(hotCoffeesResponse.body);
  List icedCoffeesJson = jsonDecode(icedCoffeesResponse.body);
  
  List<Coffee> hotCoffees = hotCoffeesJson.map((item) => Coffee.fromJson(item)).toList();
  List<Coffee> icedCoffees = icedCoffeesJson.map((item) => Coffee.fromJson(item)).toList();

  return hotCoffees;
}