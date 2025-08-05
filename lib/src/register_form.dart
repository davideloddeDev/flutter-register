import 'package:flutter/material.dart';
import 'models/register_data.dart';

// Variabile globale per l'endpoint del backend
String? _globalRegisterEndpoint;

// Funzioni per gestire l'endpoint globale
void setGlobalRegisterEndpoint(String endpoint) {
  _globalRegisterEndpoint = endpoint;
}

String? getGlobalRegisterEndpoint() {
  return _globalRegisterEndpoint;
}

typedef RegisterCallback = void Function(RegisterData data);

class RegisterForm extends StatefulWidget {
  final RegisterCallback onRegister;
  final String? emailLabel;
  final String? passwordLabel;
  final String? firstNameLabel;
  final String? lastNameLabel;
  final String? registerButtonText;
  final TextStyle? labelStyle;
  final InputDecoration? inputDecoration;
  final ButtonStyle? buttonStyle;
  final EdgeInsets? padding;
  final bool validateEmail;
  final bool validatePassword;
  final int minPasswordLength;
  final double maxWidth;
  final String? customEndpoint;

  const RegisterForm({
    Key? key,
    required this.onRegister,
    this.emailLabel = 'Email',
    this.passwordLabel = 'Password',
    this.firstNameLabel = 'Nome',
    this.lastNameLabel = 'Cognome',
    this.registerButtonText = 'Registrati',
    this.labelStyle,
    this.inputDecoration,
    this.buttonStyle,
    this.padding,
    this.validateEmail = true,
    this.validatePassword = true,
    this.minPasswordLength = 6,
    this.maxWidth = 400.0,
    this.customEndpoint,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (!widget.validateEmail) return null;
    if (value == null || value.isEmpty) {
      return 'Inserisci un\'email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Inserisci un\'email valida';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (!widget.validatePassword) return null;
    if (value == null || value.isEmpty) {
      return 'Inserisci una password';
    }
    if (value.length < widget.minPasswordLength) {
      return 'La password deve essere di almeno ${widget.minPasswordLength} caratteri';
    }
    return null;
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Inserisci $fieldName';
    }
    return null;
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final registerData = RegisterData(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
      );

      // Aggiungi informazioni sull'endpoint se disponibile
      final endpoint = widget.customEndpoint ?? getGlobalRegisterEndpoint();
      if (endpoint != null) {
        print('Endpoint configurato: $endpoint');
        // Qui potresti aggiungere la logica per chiamare l'API
      }

      widget.onRegister(registerData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: widget.maxWidth,
        ),
        child: Padding(
          padding: widget.padding ?? const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: widget.inputDecoration?.copyWith(
                        labelText: widget.firstNameLabel,
                      ) ??
                      InputDecoration(
                        labelText: widget.firstNameLabel,
                        border: const OutlineInputBorder(),
                        labelStyle: widget.labelStyle,
                      ),
                  validator: (value) => _validateRequired(value, 'il nome'),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameController,
                  decoration: widget.inputDecoration?.copyWith(
                        labelText: widget.lastNameLabel,
                      ) ??
                      InputDecoration(
                        labelText: widget.lastNameLabel,
                        border: const OutlineInputBorder(),
                        labelStyle: widget.labelStyle,
                      ),
                  validator: (value) => _validateRequired(value, 'il cognome'),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: widget.inputDecoration?.copyWith(
                        labelText: widget.emailLabel,
                      ) ??
                      InputDecoration(
                        labelText: widget.emailLabel,
                        border: const OutlineInputBorder(),
                        labelStyle: widget.labelStyle,
                      ),
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: widget.inputDecoration?.copyWith(
                        labelText: widget.passwordLabel,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ) ??
                      InputDecoration(
                        labelText: widget.passwordLabel,
                        border: const OutlineInputBorder(),
                        labelStyle: widget.labelStyle,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                  validator: _validatePassword,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _handleSubmit(),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleSubmit,
                  style: widget.buttonStyle,
                  child: Text(widget.registerButtonText!),
                ),
              ], // children
            ), // Column
          ), // Form
        ), // Padding
      ), // ConstrainedBox
    ); // Center
  }
}
