import 'package:dart_playground/fetch_espresso_coffees.dart';
import 'package:dart_playground/model/coffee.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  test('ingredients에 Espresso가 포함되어 있고 title 오름차순 정렬 되어야합니다.', () async {
    List<Coffee> coffees1 = await fetchEspressoCoffees();
    List<String> temperatures = ['hot', 'iced'];
    var coffeesResponse = await Future.wait(temperatures.map((t) => http.get(Uri.https(api, "/coffee/$t"))).toList());
    var coffees2 = coffeesResponse.map((r) => jsonDecode(r.body))
        .expand((i) => i)
        .map((j) => Coffee.fromJson(j))
        .where((c) => c.ingredients.contains("Espresso")).toList();
    coffees2.sort((a, b) => a.title.compareTo(b.title));
    for (int i = 0; i < 10; i++) {
      expect(coffees1[i] == coffees2[i], true);
    }
  });
}
