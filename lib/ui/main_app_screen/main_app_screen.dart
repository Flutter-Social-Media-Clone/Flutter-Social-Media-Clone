import 'package:cs310insta/ui/components/bottom_bar/bottom_bar.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';
import 'main_app_viewmodel.dart';

class MainAppScreen extends StatelessWidget {
  //const NotificationScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<MainAppViewModel>.reactive(
      viewModelBuilder: () => MainAppViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: feedBackgroundColor,
        resizeToAvoidBottomInset: false,

        // appBar: AppBar(
        //   title: Text('Flutter Demo Home Page'),
        // ),
        body: model.widgetOptions.elementAt(model.getSelectedIndex()),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
