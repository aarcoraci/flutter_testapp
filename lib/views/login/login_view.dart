import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/locator/service_locator.dart';
import 'package:testapp/viewmodels/app/auth_viewmodel.dart';
import 'package:testapp/viewmodels/login/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel viewModel = locator<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: buildLoginContents(viewModel),
    );
  }

  Widget buildLoginContents(LoginViewModel viewModel) {
    return ChangeNotifierProvider<LoginViewModel>(
        create: (context) => viewModel,
        child: Consumer<LoginViewModel>(
            builder: (context, model, child) => buildCenter(viewModel)));
  }

  Center buildCenter(LoginViewModel viewModel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Login'),
          TextField(
            decoration: InputDecoration(labelText: "enter your user Id"),
          ),
          Consumer<AuthViewModel>(
            builder: (context, value, child) => RaisedButton(
              onPressed: () {
                viewModel.login("123");
                value.setAuthToken("bla");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MainView()),
                // );
              },
              child: Text("Login"),
            ),
          )
        ],
      ),
    );
  }
}
