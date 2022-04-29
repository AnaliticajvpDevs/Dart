import 'package:http/http.dart' as http;
import 'dart:convert';

main() async {
  Uri url = Uri.parse(
      'https://dessrvjvp.exwaiti.com/regen?network=54.3&lat=-35.5&lon=-57.9&radius=250000000&time=0&login=jvpnet1%40gmail.com&passwd=JVPjvp123');
  final res = await http.get(url);
  var obj = res.body;
  var reg = [];
  var list = jsonDecode(obj);

  //print(obj);
  print(list[0]['o'].length);
}
