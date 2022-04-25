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
  print(estacion.length);
  print(acometida.length);
  print(nodo.length);
  print(valCierre.length);
  print(erclo.length);
  print(hidrante.length);
  print(pozo.length);
  print(tanque.length);
  print(valAire.length);

  
}

