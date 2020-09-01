import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/locator/service_locator.dart';
import 'package:testapp/viewmodels/app/auth_viewmodel.dart';
import 'package:testapp/widgets/shared/app_drawer.dart';
import 'package:testapp/widgets/shared/custom_app_bar.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Main View fer y franco"),
            RaisedButton(
              child: Text("logout"),
              onPressed: () => {locator<AuthViewModel>().clearAuthToken()},
            )
          ],
        ),
      ),
    );
  }
}
