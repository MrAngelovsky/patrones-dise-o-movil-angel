import 'dart:convert';
import 'package:http/http.dart' as http;

const String base = 'https://api.viveroxochicalco.com';

Future<List<T>> _obtenerLista<T>(String endpoint, T Function(dynamic) mapeador) async {
  final r = await http.get(Uri.parse('$base$endpoint'));
  if (r.statusCode != 200) { throw Exception('Error de red'); }
  final lista = jsonDecode(r.body) as List;
  return lista.map((e) => mapeador(e)).toList();
}

Future<List<Planta>> obtenerPlantas() {
  return _obtenerLista('/plantas', (e) => Planta.desdeJson(e));
}

Future<List<Pedido>> obtenerPedidos() {
  return _obtenerLista('/pedidos', (e) => Pedido.desdeJson(e));
}

class Planta {
  Planta.desdeJson(dynamic json);
}

class Pedido {
  Pedido.desdeJson(dynamic json);
}
