import 'package:http/http.dart' as http;
import 'dart:convert';

findVal(req, name) {
  for (var i = 0; i < req[0].length; i++) {
    if (req[0][i].toString().split('|')[0] == name) {
      return req[0][i].toString().split('|')[1];
    }}}

findCo(registro, name) {
  for (var i = 0; i < registro.length; i++) {
    return registro[i][name];
  }}

main() async {
  Uri url = Uri.parse(
      'https://dessrvjvp.exwaiti.com/regen?network=54.1&lat=-35.5&lon=-57.9&radius=250000000&time=0&login=jvpnet1%40gmail.com&passwd=JVPjvp123');
  final res = await http.get(url);
  var obj = res.body;
  var reg = [];
  var list = jsonDecode(obj);

  for (var i = 0; i < list.length; i++) {
    //con el for saco los clientes de la capa
    for (var item in list[i]['o']) {
      if (list[i]['o'] != Null) {
        reg.add(item);
      }
    }
  }
  List valList = [];
  List coList = [];

  for (var i = 0; i < reg[0].length; i++) {
    String idObjeto = reg[i]['o'];
    String lat = reg[i]['v'][0].toString().split('|')[0];
    String lon = reg[i]['v'].toString().split('|')[1];    
    valList.add(reg[i]['val']);
    coList.add(reg[i]['co'][0]);
    String name = findVal(valList, '@oName');
    String nombre = findVal(valList, '@nombre');
    String estado = findVal(valList, '@estado');
    String n1 = findCo(coList, 'n1');
    String n2 = findCo(coList, 'n2');
    String co = findCo(coList, 'co');
    String val = findCo(coList, 'val').toString().split('|')[1];

    print(idObjeto);
    print(lat);
    print(lon);
    print(name);
    print(nombre);
    print(estado);
    print(n1);
    print(n2);
    print(co);
    print(val);
    print(' ');
  }
}
