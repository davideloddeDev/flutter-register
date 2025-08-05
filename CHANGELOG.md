# Changelog

Tutte le modifiche notevoli a questo progetto saranno documentate in questo file.

Il formato è basato su [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
e questo progetto aderisce al [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-08-05

### Aggiunto
- **Controllo larghezza massima**: Parametro `maxWidth` per limitare la larghezza del form (default: 400px)
- **Gestione endpoint backend**: Support per endpoint globali e personalizzati per form specifici
- Funzioni `setGlobalRegisterEndpoint()` e `getGlobalRegisterEndpoint()` per gestione endpoint
- Parametro `customEndpoint` per endpoint specifici per singolo form
- Centraggio automatico del form con design responsive
- App di test completa (`test_app/`) con esempi avanzati

### Modificato
- Form ora centrati automaticamente con ConstrainedBox
- Migliorata la struttura di debug con informazioni sull'endpoint
- Rimossa cartella `example/` in favore di `test_app/` più completa
- Aggiornata documentazione con nuovi parametri e esempi

### Caratteristiche
- Design responsive con larghezza controllata
- Integrazione backend semplificata
- Maggiore flessibilità di personalizzazione

## [1.0.0] - 2025-08-05

### Aggiunto
- Componente RegisterForm con campi email, password, nome e cognome
- Validazione automatica per email e password
- Funzionalità mostra/nascondi password
- Personalizzazione completa di stili, etichette e decorazioni
- Modello RegisterData per gestire i dati del form
- Esempio di utilizzo completo
- Documentazione dettagliata
- Support per Material Design 3

### Caratteristiche
- Validazione email con regex
- Validazione password con lunghezza minima configurabile
- Navigazione automatica tra campi con TextInputAction
- Gestione responsive del layout
- Callback onRegister per gestire i dati validati
- Parametri opzionali per personalizzazione completa
