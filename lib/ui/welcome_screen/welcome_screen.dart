import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'welcome_viewmodel.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      viewModelBuilder: () => WelcomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Welcome Page",
              ),
              CircleAvatar(
                backgroundColor: Colors.amber[800],
                backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/women/43.jpg",
                ),
                radius: 140,
              ),
              Text(
                "My Welcome sub text",
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      child: Text(
                        "Login",
                      ),
                      onPressed: () => model.navigate_login(context),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      child: Text(
                        "Signup",
                      ),
                      onPressed: () => model.navigate_signup(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
