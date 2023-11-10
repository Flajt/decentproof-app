<p align="center">
     <img src="https://raw.githubusercontent.com/flajt/decentproof-app/master/assets/icon/icon.png" height=150 alt="Decentproof Logo" />
</p>
<p align="center">
     <a href="https://api.codemagic.io/apps/6392139eb2014893a05ed729/654bb4200d6fe202fa7ddce6/status_badge.svg" ><img alt="tests" src="https://api.codemagic.io/apps/6392139eb2014893a05ed729/654bb4200d6fe202fa7ddce6/status_badge.svg"/> 
     </a>
     <a href="https://api.codemagic.io/apps/6392139eb2014893a05ed729/6392139eb2014893a05ed728/status_badge.svg"><img alt="release" src="https://api.codemagic.io/apps/6392139eb2014893a05ed729/6392139eb2014893a05ed728/status_badge.svg"/> 
     </a>
     <a href="https://www.contributor-covenant.org/"> <img src="https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg"/>
     </a>
     <a href="https://inlang.com/editor/github.com/Flajt/decentproof-app"><img alt="inlang translation stats" src="https://inlang.com/badge?url=github.com/Flajt/decentproof-app"/></a>
     
</p>

For general information please checkout the [wiki](https://github.com/Flajt/decentproof-app/wiki) tab . I will update the README soon!

## About

Decentproof is an app to allow you the creation of temper proof files. The app supports: aac, mp3, mkv and png files. 
File hashes are securely and privacy friendly stored in the Bitcoin and Etherium blockchain and can easily and *independantly* verified. 

## "Design Choices"
- State Management: [bloc](https://bloclibrary.dev/#/) + setState (the latter in some rare cases)
- Dependency Injection: [get_it](https://pub.dev/packages/get_it)
- Architecture: Layered (not perfectly)
- DB: None
- Auth Service: None
- Device Integrity: [AppCheck](https://firebase.google.com/docs/app-check?hl=en) (I'm considering replacing it with [freerasp](https://www.talsec.app/freerasp-in-app-protection-security-talsec))
- Translation Tool: [Inlang](https://inlang.com)
- Env Var management: (TODO: Envied)

## Getting Started
A guide on how to get started with everything
### Required tooling
The following things are required to get started:
- Flutter sdk (see [below](#helpfull-ressources) to get it)
- Android Studio & XCode (if MacOS)
- A Code editor (e.g. VSCode, JetBrains, Sublime, Vim) etc.
- The backend [repository](https://github.com/Flajt/decentproof-backend)

### Let's Go
1. Setup backend by following the README
2. Install dependencies via: `flutter pub get`
3. A firebase account with a project and appcheck enabled
4. Create a `.env` file as seen below
5. Checkout the [CONTRIBUTING](/CONTRIBUTING.md) file
6. Either you setup firebase appcheck with this project or comment out the code related to that while debugging [AppCheck.dart](/lib/shared/Integrety/AppCheck.dart)
7. You are good to go just use: `flutter run` to run the app

### Testing

The tests folder structure is the same as the one under `lib`. If you create new tests place them accordingly.
All files needs to end in `**_test.dart` the `_test` part is important!

>Integration tests need to be placed under `integration_test` folder ! And are run via `flutter test integraton_test`.

#### Running tests
- Run: `flutter test` in your console and you should be good to go


### .env
Point these to your urls
```env
SIGN_URL=url-for-signature-requests
CHECK_KEY_URL=url-to-check-for-new-key
GET_KEY_URL=url-to-get-new-key
VERIFY_URL=url-to-verify-stuff
```

## Helpfull Ressources
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
