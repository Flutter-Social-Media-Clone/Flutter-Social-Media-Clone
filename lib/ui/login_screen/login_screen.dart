import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Form(
                key: model.formKey,
                child: Column(
                  children: [
                    KFormFieldWidget(
                      kFormField: model.emailField,
                      validator: validator.emailValidator,
                      save: model.handleSaveEmail,
                    ),
                    SizedBox(height: 10),
                    KFormFieldWidget(
                      kFormField: model.passwordField,
                      validator: validator.passwordValidator,
                      save: model.handleSavePass,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: model.handleLogin,
                          child: Text("Login"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
