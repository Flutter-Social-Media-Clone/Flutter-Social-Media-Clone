import 'package:carousel_slider/carousel_slider.dart';
import 'package:cs310insta/core/models/KFormField.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:cs310insta/utils/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'walkthrough_viewmodel.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class WalkthroughScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return ViewModelBuilder<WalkthroughViewModel>.reactive(
      viewModelBuilder: () => WalkthroughViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: Text('Flutter Demo Home Page'),
        // ),
        body: Builder(
          builder: (context) {
            final double height = MediaQuery.of(context).size.height - 180;
            return Container(
              decoration: BoxDecoration(
                color: appBackgroundColor,
              ),
              child: Container(
                margin: loginSignupMargin,
                padding: walkthroughPadding,
                decoration: backgroundDecoration,
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: height,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            model.setCurrent(index);
                          }
                          // autoPlay: false,
                          ),
                      items: model.imgList
                          .map(
                            (item) => Container(
                              margin: EdgeInsets.fromLTRB(0, 40, 0, 80),
                              child: Center(
                                // child: Text(item)
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        child: Image.asset(
                                          item,
                                          fit: BoxFit.cover,
                                          height: height,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      model.headerList[model.current],
                                      style: walkthroughScreenHeader,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      child: Text(
                                        model.subheaderList[model.current],
                                        style: walkthroughScreenSubHeader,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      model.current == model.page_count - 1
                          ? OutlinedButton(
                              onPressed: () {
                                model.setSeenTrue();
                                // Navigator.restorablePopAndPushNamed(
                                //     context, "/");
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/'));
                              },
                              child: Text(
                                "Get Started",
                                style: login_signupButtonTextStyle,
                              ),
                              style: login_signupButtonStyle,
                            )
                          : SizedBox(height: 48)
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: model.imgList.map((url) {
                        int index = model.imgList.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: model.current == index
                                ? Color.fromRGBO(255, 255, 255, 1)
                                : Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
