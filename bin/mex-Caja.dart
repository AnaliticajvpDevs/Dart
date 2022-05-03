import 'package:http/http.dart' as http;
import 'dart:convert';

findVal(req, name) {
  for (var i = 0; i < req[0].length; i++) {
    if (req[0][i].toString().split('|')[0] == name) {
      return req[0][i].toString().split('|')[1];
    }
  }
}

findCo(registro, name) {
  for (var i = 0; i < registro.length; i++) {
    return registro[0][i][name];
  }
}

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

  for (var i = 0; i < reg.length; i++) {
    var idObjeto = reg[15]['o'];
    var lat = reg[15]['v'][0].toString().split("|")[0];
    var lon = reg[15]['v'][0].toString().split("|")[1];

    valList.add(reg[15]['val']);
    coList.add(reg[15]['co']);

    var nombre = findVal(valList, '@nombre');
    var name = findVal(valList, '@oName');
    var estado = findVal(valList, '@estado');
    var subregion = findVal(valList, '@subregion');
    var region = findVal(valList, '@region');
    var oType = findVal(valList, '@oType');
    var n1 = findCo(coList, 'n1');
    var co = findCo(coList, 'co');
    var val = findCo(coList, 'val').toString().split('|')[1];
/*
    print(idObjeto);
    print(lat);
    print(lon);
    print(nombre);
    print(name);
    print(estado);
    print(subregion);
    print(region);
    print(oType);
    print(n1);
    print(co);
    print(val);
    print('---------------------');*/
  }
  //print(reg[15]['co'][0]);
  //print(findCo(coList, 'val'));
}
