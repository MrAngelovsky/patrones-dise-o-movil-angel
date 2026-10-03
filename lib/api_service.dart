import 'dart:convert';
import 'package:http/http.dart' as http;

const String base = 'https://api.viveroxochicalco.com';

Future<List<Planta>> obtenerPlantas() async {
  final r = await http.get(Uri.parse('$base/plantas'));
  if (r.statusCode != 200) { throw Exception('Error de red'); }
  final lista = jsonDecode(r.body) as List;
  return lista.map((e) => Planta.desdeJson(e)).toList();
}

Future<List<Pedido>> obtenerPedidos() async {
  final r = await http.get(Uri.parse('$base/pedidos'));
  if (r.statusCode != 200) { throw Exception('Error de red'); }
  final lista = jsonDecode(r.body) as List;
  return lista.map((e) => Pedido.desdeJson(e)).toList();
}

class Planta {
  Planta.desdeJson(dynamic json);
}

class Pedido {
  Pedido.desdeJson(dynamic json);
}
