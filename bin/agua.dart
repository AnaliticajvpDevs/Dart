import 'dart:io';
import 'package:http/http.dart' as http;
//import 'package:dart_mssql/dart_mssql.dart';
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
  findVal(registro, name) {
    for (var item in registro['val']) {
      if (item.split('|')[0] == name) {
        return (item.split('|')[1]);
      }
    }
  }

  List acometida = [];
  List estacion = [];
  List nodo = [];
  List valCierre = [];
  List erclo = [];
  List hidrante = [];
  List pozo = [];
  List planta = [];
  List tanque = [];
  List valAire = [];

  for (var item in reg) {
    if (item['ocfg'].toString() == '[go/a/b]') {
      estacion.add(item);
    }
    if (item['ocfg'].toString() == '[go/a/ac]') {
      acometida.add(item);
    }
    if (item['ocfg'].toString() == '[go/a/de]') {
      nodo.add(item);
    }
    if (item['ocfg'].toString() == '[go/a/e]') {
      valCierre.add(item);
    }
    if (item['ocfg'].toString() == '[go/a/erclo]') {
      erclo.add(item);
    }
    if (item['ocfg'].toString() == '[go/a/h]') {
      hidrante.add(item);
    }
    if (item['ocfg'].toString() == '[go/a/p]') {
      pozo.add(item);
    }
    if (item['ocfg'].toString() == '[go/a/pl]') {
      planta.add(item);
    }
    if (item['ocfg'].toString() == '[go/a/t]') {
      tanque.add(item);
    }
    if (item['ocfg'].toString() == '[go/a/va]') {
      valAire.add(item);
    }
  }
  for (var item in valAire) {
    var idObjeto = item['o'];
    var lat = item['v'][0].split('|')[0];
    var lon = item['v'][0].split('|')[1];
    var nombre = findVal(item, '@oName');
    var sector = findVal(item, '@sector');
    var estadoAud = findVal(item, '@estadoaud');
    var estadoMant = findVal(item, '@estadomant');
    var diametroV = findVal(item, '@diametroV');
    var comentario = findVal(item, '@com');

    //print(idObjeto);
    //print(lat);
    //print(lon);
    //print(nombre);
    //print(sector);
    //print(estadoAud);
    //print(estadoMant);
    //print(diametroV);
    //print(comentario);
    //print("-----------");
  }

  for (var item in estacion) {
    var idObjeto = item['o'];
    var lat = item['v'][0].split('|')[0];
    var lon = item['v'][0].split('|')[1];
    //var ahora = item("now");
    var nombre = findVal(item, '@oName');
    var presion = findVal(item, '@presion');
    var auditoria = findVal(item, "@estadoaud");
    var mantenimiento = findVal(item, "@estadomant");
    var sector = findVal(item, '@sector');
    var comentario = findVal(item, "@com");
    var marca = findVal(item, "@marca");
    var pmax = findVal(item, "@presMax");
    var pmin = findVal(item, "@presMin");
    var pot = findVal(item, "@pot");
    var fechaIns = findVal(item, "@fechai");
    //var tiempo      = findVal(item,"$iTime")
    //var fecha = time.strftime("%d/%m/%y");
    //var hora = time.strftime("%I:%M:%S");
    
  }

  for (var item in nodo) {
    var idObjeto = item['o'];
    var lat = item['v'][0].split('|')[0];
    var lon = item['v'][0].split('|')[1];
    //var ahora = item("now");
    //var nombre = findVal(item, '@oName');
    //var contratista = findVal(item, '@contratista');
    //var auditoria = findVal(item, "@estadoaud");
    //var mantenimiento = findVal(item, "@estadomant");
    //var sector = findVal(item, '@sector');
    //var comentario = findVal(item, "@com");
    //var tiempo      = findVal(item,"$iTime")
    //var diametro = findVal(item, "@diametroH");
    //var fecha = time.strftime("%d/%m/%y");
    //var hora = time.strftime("%I:%M:%S");

  

  }

  for (var item in valCierre) {
    var idObjeto = item['o'];
    var lat = item['v'][0].split('|')[0];
    var lon = item['v'][0].split('|')[1];
    //var ahora = item("now");
    //var nombre = findVal(item, '@oName');
    //var tipo = findVal(item, '@tipo');
    //var auditoria = findVal(item, "@estadoaud");
    //var mantenimiento = findVal(item, "@estadomant");
    //var sector = findVal(item, '@sector');
    //var oType = findVal(item, "@oType");
    //var tiempo  = findVal(item,"$iTime")
    //var fecha = time.strftime("%d/%m/%y");
    //var hora = time.strftime("%I:%M:%S");

    
  }

  for (var item in erclo) {
    var idObjeto = item['o'];
    var lat = item['v'][0].split('|')[0];
    var lon = item['v'][0].split('|')[1];
    //var ahora = item("now");
    var nombre = findVal(item, '@oName');
    var tipo = findVal(item, '@tipo');
    var auditoria = findVal(item, "@estadoaud");
    var mantenimiento = findVal(item, "@estadomant");
    var sector = findVal(item, '@sector');
    var oType = findVal(item, "@oType");
    var comentario = findVal(item, "@com");
      //var tiempo      = findVal(item,"$iTime")
      //var fecha = time.strftime("%d/%m/%y");
      //var hora = time.strftime("%I:%M:%S");      
  }

  for (var item in hidrante) {
    var idObjeto = item['o'];
    var lat = item['v'][0].split('|')[0];
    var lon = item['v'][0].split('|')[1];
    //var ahora = item("now");
    var nombre = findVal(item, '@oName');
    var tipo = findVal(item, '@tipo');
    var auditoria = findVal(item, "@estadoaud");
    var mantenimiento = findVal(item, "@estadomant");
    var sector = findVal(item, '@sector');
    var comentario = findVal(item, "@com");
    var diametro = findVal(item, "@diametroH");
      //var tiempo      = findVal(item,"$iTime")
      //var fecha = time.strftime("%d/%m/%y");
      //var hora = time.strftime("%I:%M:%S");
    print(idObjeto);
    print(lat);
    print(lon);
    print(nombre);
    print('-------');
    }

}
