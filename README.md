# Flutter Register Component

Un componente Flutter riutilizzabile per creare form di registrazione con validazione integrata.

## Caratteristiche

- ✅ Campi per email, password, nome e cognome
- ✅ Validazione automatica dell'email
- ✅ Validazione della password con lunghezza minima configurabile
- ✅ Mostra/nascondi password
- ✅ **Larghezza massima configurabile** per design responsive
- ✅ **Gestione endpoint backend** (globale e per singolo form)
- ✅ Completamente personalizzabile (stili, etichette, decorazioni)
- ✅ Gestione automatica della navigazione tra campi
- ✅ Support per Material Design 3

## Installazione

Aggiungi questo al tuo `pubspec.yaml`:

```yaml
dependencies:
  flutter_register_component:
    git:
      url: https://github.com/davideloddeDev/flutter-register.git
```

Poi esegui:

```bash
flutter pub get
```

## Utilizzo Base

```dart
import 'package:flutter/material.dart';
import 'package:flutter_register_component/flutter_register_component.dart';

void main() {
  // Configura l'endpoint globale (opzionale)
  setGlobalRegisterEndpoint('https://api.miodominio.com/register');
  runApp(MyApp());
}

class MyRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrazione')),
      body: RegisterForm(
        onRegister: (RegisterData data) {
          // Gestisci i dati di registrazione
          print('Email: ${data.email}');
          print('Nome: ${data.firstName}');
          print('Cognome: ${data.lastName}');
          // Effettua la chiamata API, salva i dati, ecc.
        },
        maxWidth: 400.0, // Larghezza massima (opzionale)
      ),
    );
  }
}
```

## Personalizzazione

```dart
RegisterForm(
  onRegister: (data) => _handleRegister(data),
  emailLabel: 'Indirizzo Email',
  passwordLabel: 'Password Sicura',
  firstNameLabel: 'Il tuo Nome',
  lastNameLabel: 'Il tuo Cognome',
  registerButtonText: 'Crea Account',
  minPasswordLength: 8,
  maxWidth: 500.0, // Larghezza massima personalizzata
  customEndpoint: 'https://api-special.com/register-premium', // Endpoint specifico
  validateEmail: true,
  validatePassword: true,
  buttonStyle: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 16),
  ),
  inputDecoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    filled: true,
    fillColor: Colors.grey[100],
  ),
  labelStyle: TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  ),
  padding: EdgeInsets.all(20),
)
```

## Parametri

| Parametro | Tipo | Default | Descrizione |
|-----------|------|---------|-------------|
| `onRegister` | `RegisterCallback` | **required** | Callback chiamato quando il form è valido e inviato |
| `emailLabel` | `String?` | `'Email'` | Etichetta del campo email |
| `passwordLabel` | `String?` | `'Password'` | Etichetta del campo password |
| `firstNameLabel` | `String?` | `'Nome'` | Etichetta del campo nome |
| `lastNameLabel` | `String?` | `'Cognome'` | Etichetta del campo cognome |
| `registerButtonText` | `String?` | `'Registrati'` | Testo del pulsante di registrazione |
| `maxWidth` | `double` | `400.0` | Larghezza massima del form |
| `customEndpoint` | `String?` | `null` | Endpoint specifico per questo form |
| `labelStyle` | `TextStyle?` | `null` | Stile delle etichette |
| `inputDecoration` | `InputDecoration?` | `null` | Decorazione dei campi input |
| `buttonStyle` | `ButtonStyle?` | `null` | Stile del pulsante |
| `padding` | `EdgeInsets?` | `EdgeInsets.all(16.0)` | Padding del form |
| `validateEmail` | `bool` | `true` | Abilita validazione email |
| `validatePassword` | `bool` | `true` | Abilita validazione password |
| `minPasswordLength` | `int` | `6` | Lunghezza minima password |

## Modello Dati

Il componente utilizza la classe `RegisterData`:

```dart
class RegisterData {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  // Include anche metodi toJson(), fromJson(), toString(), ecc.
}
```

## Gestione Endpoint Backend

Il componente supporta due modi per configurare gli endpoint:

### 1. Endpoint Globale
```dart
void main() {
  // Configura una volta per tutta l'app
  setGlobalRegisterEndpoint('https://api.miodominio.com/register');
  runApp(MyApp());
}

// Tutti i form useranno questo endpoint
RegisterForm(onRegister: _handleRegister)
```

### 2. Endpoint Personalizzato per Form
```dart
RegisterForm(
  onRegister: _handleRegister,
  customEndpoint: 'https://api-special.com/register-premium',
  // Questo form userà l'endpoint specifico invece di quello globale
)
```

### 3. Funzioni di Utility
```dart
// Imposta endpoint globale
setGlobalRegisterEndpoint('https://api.example.com/register');

// Ottieni endpoint corrente
String? currentEndpoint = getGlobalRegisterEndpoint();
```

## Esempio Completo

Controlla la cartella `test_app/` per un esempio completo di utilizzo con diverse personalizzazioni e funzionalità avanzate.

Per eseguire l'esempio:

```bash
cd test_app
flutter pub get
flutter run -d chrome
```

L'esempio mostra:
- Form base con larghezza controllata
- Form personalizzato con endpoint specifico
- Configurazione di endpoint globale
- Diverse personalizzazioni di stile

## Validazione

Il componente include validazione automatica per:

- **Email**: Formato email valido (regex)
- **Password**: Lunghezza minima configurabile
- **Nome e Cognome**: Campi obbligatori non vuoti

La validazione può essere disabilitata impostando `validateEmail` o `validatePassword` a `false`.

## Contribuire

1. Fork del progetto
2. Crea un branch per la tua feature (`git checkout -b feature/AmazingFeature`)
3. Commit delle tue modifiche (`git commit -m 'Add some AmazingFeature'`)
4. Push del branch (`git push origin feature/AmazingFeature`)
5. Apri una Pull Request

## Licenza

Distribuito sotto la licenza MIT. Vedi `LICENSE` per maggiori informazioni.

## Changelog

### 1.0.0
- Release iniziale
- Form di registrazione con 4 campi
- Validazione integrata
- Personalizzazione completa
- Esempio di utilizzo
