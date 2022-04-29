import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main.dart';

main() async {
  Uri url = Uri.parse(
      'https://dessrvjvp.exwaiti.com/regen?network=54.15&lat=-35.5&lon=-57.9&radius=250000000&time=0&login=jvpnet1%40gmail.com&passwd=JVPjvp123');
  final res = await http.get(url);
  var obj = res.body;
  var reg = [];
  var list = jsonDecode(obj);

  for (var i = 0; i < list.length; i++) {
    //con el for saco los clientes de la capa
    for (var item in list[i]['o']) {
      reg.add(item);
    }
  }
  List latLon = [];
  for (var i = 0; i < reg.length; i++) {
    String idNombre = reg[i]['o'];
    List coo = reg[i]['v'];
    for (var i = 0; i < coo.length; i++) {
      coo[i][0].toString();
      latLon.add(coo[i].toString().split('|')[0]);
      latLon.add(coo[i].toString().split('|')[1]);
    }
    print(idNombre);//Nombre de la zona
    print(latLon); //Latitud y Longitud de la zona
    print("---------------------");
    
  }
}
