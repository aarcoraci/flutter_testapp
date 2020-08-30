import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/locator/service_locator.dart';
import 'package:testapp/viewmodels/app/test_app_viewmodel.dart';
import 'package:testapp/views/login/login_view.dart';
import 'package:testapp/views/main/main_view.dart';

class TestApp extends StatelessWidget {
  // This widget is the root of your application.
  final TestAppViewModel viewModel = locator<TestAppViewModel>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: buildTestAppContents(viewModel),
    );
  }

  Widget buildTestAppContents(TestAppViewModel viewModel) {
    return ChangeNotifierProvider<TestAppViewModel>(
      create: (context) => viewModel,
      child: Consumer<TestAppViewModel>(
        builder: (context, value, child) =>
            value.authToken == null ? LoginView() : MainView(),
      ),
    );
  }
}
