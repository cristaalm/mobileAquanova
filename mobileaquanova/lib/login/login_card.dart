// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/login/login_get.dart';

// Nueva pantalla de login completa
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final error = await LoginController.authenticateUser(username, password);

    if (error == null) {
      _navigateToHome();
    } else {
      setState(() {
        _errorMessage = error;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsAquanova.backgroundLight,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Column(
              children: [
                // Logo
                Column(
                  children: [
                    Image.asset(
                      'lib/assets/resources/aquanova2.png',
                      width: 300,
                      height: 300,
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                // Card de login
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: ColorsAquanova.lightLetters,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: ColorsAquanova.backgroundDark.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorsAquanova.darkLetters,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      // Campo de usuario
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          labelStyle: TextStyle(
                            color: _errorMessage != null ? ColorsAquanova.red : ColorsAquanova.tableText,
                          ),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _errorMessage != null ? ColorsAquanova.red : ColorsAquanova.darkLetters),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _errorMessage != null ? ColorsAquanova.red : ColorsAquanova.tableText, width: 2), 
                          ),
                          prefixIcon: Icon(Icons.person, color: _errorMessage != null ? ColorsAquanova.red : ColorsAquanova.tableText),
                        ),
                        // El campo de usuario no debería tener obscureText: true
                      ),
                      const SizedBox(height: 16),
                      // Campo de contraseña
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(
                            color: _errorMessage != null ? ColorsAquanova.red : ColorsAquanova.tableText,
                          ),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _errorMessage != null ? ColorsAquanova.red : ColorsAquanova.darkLetters),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _errorMessage != null ? ColorsAquanova.red : ColorsAquanova.tableText, width: 2), 
                          ),
                          prefixIcon: Icon(Icons.lock, color: _errorMessage != null ? ColorsAquanova.red : ColorsAquanova.tableText),
                        ),
                        obscureText: true,
                      ),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: ColorsAquanova.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      const SizedBox(height: 24),
                      // Botón de login
                      ElevatedButton(
                        onPressed: _isLoading ? () {} : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isLoading 
                          ? const Color.fromARGB(255, 166, 232, 227) 
                          : ColorsAquanova.backgroundMedium,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  backgroundColor: ColorsAquanova.tableText,
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(ColorsAquanova.darkLetters),
                                ),
                              )
                            : const Text(
                                'INGRESAR',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsAquanova.darkLetters
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}