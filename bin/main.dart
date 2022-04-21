import 'package:http/http.dart' as http;
import 'dart:convert';

main() async {
  Uri url = Uri.parse(
      'https://xyt-a1.herokuapp.com/oread?id=53.7&serverAlias=srvjvp');
  final res = await http.get(url);

  var obj = res.body;
  var reg = [];
  var list = jsonDecode(obj);
  for (var i = 0; i < list.length; i++) {
    //con el for saco los clientes de la capa
    for (var item in list[0]['o']) {
      reg.add(item);
    }
  }
  cliente(reg[120]);
}

cliente(cli) {
  var idobjeto      = cli['o'];
  var lat           = cli['v'][0].split('|')[0];
  var lon           = cli['v'][0].split('|')[1];
  var nombre        = findVal(cli, '@oName');
  var presion       = findVal(cli, '@presion');
  var auditoria     = findVal(cli, "@estadoaud");
  var mantenimiento = findVal(cli, "@estadomant");
  var sector        = findVal(cli, '@sector');

  print(idobjeto);
  print(lat);
  print(lon);
  print(nombre);
  print(presion);
  print(auditoria);
  print(mantenimiento);
  print(sector);
}
findVal(registro, name) {
  for (var item in registro['val']) {
    if (item.split('|')[0] == name) {
      return (item.split('|')[1]);
    }
  }
}