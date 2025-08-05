import 'package:flutter/material.dart';
import 'package:flutter_register_component/flutter_register_component.dart';

void main() {
  // Configura l'endpoint globale per il backend
  setGlobalRegisterEndpoint('https://api.miodominio.com/register');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Register Component Example',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const RegisterExample(),
    );
  }
}

class RegisterExample extends StatelessWidget {
  const RegisterExample({Key? key}) : super(key: key);

  void _handleRegister(RegisterData data) {
    // Qui gestiresti la registrazione (es. chiamata API)
    print('--- REGISTRAZIONE RICEVUTA ---');
    print('Email: ${data.email}');
    print('Nome: ${data.firstName}');
    print('Cognome: ${data.lastName}');
    print(
      'Password: ${data.password.replaceAll(RegExp(r'.'), '*')}',
    ); // Maschera la password
    print('Endpoint globale configurato: ${getGlobalRegisterEndpoint()}');
    print('--- FINE DATI ---');

    // Qui potresti fare la chiamata HTTP all'endpoint
    // esempio:
    // final response = await http.post(
    //   Uri.parse(getGlobalRegisterEndpoint() ?? 'default-endpoint'),
    //   body: data.toJson(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esempio Registrazione'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Esempio di utilizzo del componente RegisterForm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            // Esempio base
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Form di registrazione base:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            RegisterForm(
              onRegister: _handleRegister,
              maxWidth: 350.0, // Larghezza massima personalizzata
            ),
            const Divider(height: 40),
            // Esempio personalizzato
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Form personalizzato con endpoint specifico:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            RegisterForm(
              onRegister: _handleRegister,
              emailLabel: 'Indirizzo Email',
              passwordLabel: 'Password Sicura',
              firstNameLabel: 'Il tuo Nome',
              lastNameLabel: 'Il tuo Cognome',
              registerButtonText: 'Crea Account',
              minPasswordLength: 8,
              maxWidth: 500.0, // Larghezza diversa per questo form
              customEndpoint:
                  'https://api-special.miodominio.com/register-premium',
              buttonStyle: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              inputDecoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
                fillColor: Color(0xFFF5F5F5),
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
