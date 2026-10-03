# Hallazgos de Duplicación

## 2.1 Fragmentos Duplicados
La duplicación se encuentra en el archivo `lib/api_service.dart`, dentro de las funciones `obtenerPlantas()` y `obtenerPedidos()`.
Se repiten exactamente las siguientes tres líneas de código que manejan la petición HTTP y decodificación:

```dart
final r = await http.get(Uri.parse('$base/...'));
if (r.statusCode != 200) { throw Exception('Error de red'); }
final lista = jsonDecode(r.body) as List;
```

## 2.2 Patrón Aplicado
Para eliminar esta duplicación y respetar el principio **DRY (Don't Repeat Yourself)**, se aplicó el patrón **Template Method** (refactorizado mediante la extracción a un método genérico). 
Elegimos esta solución porque el esqueleto del algoritmo de petición de red es idéntico; lo único que cambia es el endpoint y el mapeo del JSON. Esto nos permite centralizar el comportamiento común y delegar la instanciación de objetos.
