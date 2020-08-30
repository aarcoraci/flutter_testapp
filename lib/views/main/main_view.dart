import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/viewmodels/app/test_app_viewmodel.dart';
import 'package:testapp/widgets/shared/app_drawer.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Screen')),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Main View"),
            Consumer<TestAppViewModel>(
              builder: (context, value, child) => RaisedButton(
                child: Text("logout"),
                onPressed: () => {value.clearAuthToken()},
              ),
            )
          ],
        ),
      ),
    );
  }
}
