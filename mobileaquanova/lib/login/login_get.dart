
class LoginController {
  // Método para autenticar al usuario
  static Future<String?> authenticateUser(String username, String password) async {
    // Simulando un retraso para la autenticación
    await Future.delayed(const Duration(seconds: 2));

    // Validaciones básicas
    if (username.isEmpty || password.isEmpty) {
      return 'Por favor ingrese usuario y contraseña';
    }


    if (username == 'admin' && password == 'password') {
      return null;  
    } else {
      return 'Usuario o contraseña incorrectos';
    }
  }
}