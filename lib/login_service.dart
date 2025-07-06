import 'package:http/http.dart' as http;
import 'dart:convert';

// Cambia la IP según tu caso: "localhost" si estás en PC, "10.0.2.2" si estás en emulador Android
Future<String> loginUsuario(String correo, String contrasena) async {
  final url = Uri.parse("http://10.0.2.2/flutter_login/login.php");

  final response = await http.post(
    url,
    body: {'correo': correo, 'contrasena': contrasena},
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['estado'] == 'success') {
      return "✅ Bienvenido";
    } else {
      return "❌ ${data['mensaje']}";
    }
  } else {
    return "⚠️ Error al conectar con el servidor";
  }
}
