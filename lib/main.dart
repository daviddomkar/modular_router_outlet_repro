import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
  ));
}

class AppModule extends MainModule {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AppPage(), children: [
      ModuleRoute('/', module: AuthModule()),
    ]),
  ];

  @override
  final Widget bootstrap = AppWidget();
}

class AuthModule extends ChildModule {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage(), children: [
      ChildRoute('/', child: (_, args) => WelcomePage()),
    ]),
  ];
}

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ).modular();
  }
}

class AppPage extends StatelessWidget {
  const AppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
    );
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RouterOutlet(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome'),
    );
  }
}
