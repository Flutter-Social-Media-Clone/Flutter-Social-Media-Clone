import 'package:carousel_slider/carousel_slider.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Since the state was moved to the view model, this is now a StatelessWidget.
class WalkthroughScreen extends StatelessWidget {
  final WalkthroughState walkthroughState = Get.put(WalkthroughState());

  @override
  Widget build(BuildContext context) {
    // ViewModelBuilder is what provides the view model to the widget tree.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('Flutter Demo Home Page'),
      // ),
      body: Builder(
        builder: (context) {
          final double height = walkthroughState.getHeight() - 28;

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
                        walkthroughState.setCurrent(index);
                      }
                      // autoPlay: false,
                      ),
                  items: walkthroughState.imgList
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
                                child: Obx(
                                  () => Column(
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
                                        walkthroughState.headerList[
                                            walkthroughState.current.value],
                                        style: walkthroughScreenHeader,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 50,
                                        ),
                                        child: Text(
                                          walkthroughState.subheaderList[
                                              walkthroughState.current.value],
                                          textAlign: TextAlign.center,
                                          style: walkthroughScreenSubHeader,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          walkthroughState.current.value ==
                                                  walkthroughState.pageCount - 1
                                              ? OutlinedButton(
                                                  onPressed: () {
                                                    walkthroughState
                                                        .setSeenTrue();
                                                    Get.offAllNamed("/welcome");
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
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: walkthroughState.imgList.map((url) {
                    int index = walkthroughState.imgList.indexOf(url);
                    return Obx(
                      () => Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.fromLTRB(2, 0, 2, 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: walkthroughState.current.value == index
                              ? Color.fromRGBO(255, 255, 255, 1)
                              : Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
