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
            final double height = model.getHeight(context) - 28;

            return Container(
              decoration: BoxDecoration(
                color: appBackgroundColor,
                image: DecorationImage(
                  image: AssetImage("assets/images/login_background.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                            //margin: EdgeInsets.fromLTRB(0, 40, 0, 80),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(height: 1),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child: Container(
                                              height: 200,
                                              width: 200,
                                              child: Image.asset(
                                                item,
                                                fit: BoxFit.cover,
                                                height: height,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        model.headerList[model.current],
                                        style: walkthroughScreenHeader,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 50,
                                        ),
                                        child: Text(
                                          model.subheaderList[model.current],
                                          textAlign: TextAlign.center,
                                          style: walkthroughScreenSubHeader,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          model.current == model.page_count - 1
                                              ? OutlinedButton(
                                                  onPressed: () {
                                                    model.setSeenTrue();
                                                    Navigator
                                                        .restorablePopAndPushNamed(
                                                            context,
                                                            "/welcome");
                                                  },
                                                  child: Text(
                                                    "Get Started",
                                                    style:
                                                        login_signupButtonTextStyle,
                                                  ),
                                                  style:
                                                      login_signupButtonStyle,
                                                )
                                              : SizedBox(height: 48)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: model.imgList.map((url) {
                      int index = model.imgList.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.fromLTRB(2, 0, 2, 20),
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
            );
          },
        ),
      ),
    );
  }
}
