import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/locator/service_locator.dart';
import 'package:testapp/viewmodels/app/auth_viewmodel.dart';
import 'package:testapp/viewmodels/login/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: buildLoginContents(),
    );
  }

  Widget buildLoginContents() {
    return ChangeNotifierProvider<LoginViewModel>(
        create: (context) => locator<LoginViewModel>(),
        child: Consumer<LoginViewModel>(
            builder: (context, model, child) => buildCenter(model)));
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
          RaisedButton(
            onPressed: () {
              if (viewModel.login("123")) {
                var authViewModel = locator<AuthViewModel>();
                authViewModel.setAuthToken("123");
              }

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MainView()),
              // );
            },
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
