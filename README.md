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




This is the offical Github Repository for the decentproof app. Here you can find the whole codebase if you want to inspect it or contribute to it.

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

TODO



## Helpfull Ressources
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
