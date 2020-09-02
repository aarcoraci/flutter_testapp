import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/locator/service_locator.dart';
import 'package:testapp/viewmodels/app/auth_viewmodel.dart';
import 'package:testapp/views/login/login_view.dart';
import 'package:testapp/views/main/main_view.dart';

class TestApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return buildWithProviderStructure();
  }

  Widget buildWithProviderStructure() {
    final AuthViewModel authViewModel = locator<AuthViewModel>();

    return MultiProvider(
      providers: [buildAuthProvider(authViewModel)], // list of global providers
      child: buildApp(),
    );
  }

  // providers
  Widget buildAuthProvider(AuthViewModel viewModel) {
    return ChangeNotifierProvider<AuthViewModel>(
        create: (context) => viewModel);
  }

  Widget _getCurrentPage(AuthViewModel authViewModel) {
    if (authViewModel.authToken == null) {
      return LoginView();
    } else {
      return MainView();
    }
  }

// app
  Widget buildApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Consumer<AuthViewModel>(
        builder: (context, value, child) => _getCurrentPage(value),
      ),
    );
  }
}
