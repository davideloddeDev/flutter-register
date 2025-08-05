# Flutter Register Component

Un componente Flutter riutilizzabile per creare form di registrazione con validazione integrata.

## Caratteristiche

- ✅ Campi per email, password, nome e cognome
- ✅ Validazione automatica dell'email
- ✅ Validazione della password con lunghezza minima configurabile
- ✅ Mostra/nascondi password
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

## Esempio Completo

Controlla la cartella `example/` per un esempio completo di utilizzo con diverse personalizzazioni.

Per eseguire l'esempio:

```bash
cd example
flutter pub get
flutter run
```

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
