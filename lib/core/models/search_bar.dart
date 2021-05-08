import 'package:cs310insta/core/models/search_bar.dart';
import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cs310insta/utils/style.dart';

class SearchBar extends StatefulWidget {
  SearchBar({
    Key key,
  }) : super(key: key);

  @override
  _SearchBar createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  List fooList = ['John Doe', 'Jane Doe', 'Izmir', 'Mahmut', 'Cats'];
  List filteredList = List();
  @override
  void initState() {
    super.initState();
    filteredList = fooList;
  }

  void filter(String inputString) {
    filteredList =
        fooList.where((i) => i.toLowerCase().contains(inputString)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_outlined),
        toolbarHeight: 66, // default is 56
        //toolbarOpacity: 1,
        backgroundColor: bottomNavBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: Text('Search'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search ',
              hintStyle: TextStyle(
                fontSize: 14,
              ),
            ),
            onChanged: (text) {
              text = text.toLowerCase();
              filter(text);
            },
          ),
          Expanded(
            child: Container(
              height: 150,
              child: Column(children: <Widget>[
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlinedButton(
                          child: Text(
                            "Location",
                            style: login_signupButtonTextStyle,
                          ),
                          style: login_signupButtonStyle,
                          onPressed: () {}),
                      OutlinedButton(
                        child: Text(
                          "Topic",
                          style: login_signupButtonTextStyle,
                        ),
                        style: login_signupButtonStyle,
                        onPressed: () {},
                      ),
                      OutlinedButton(
                        child: Text(
                          "People",
                          style: login_signupButtonTextStyle,
                        ),
                        style: login_signupButtonStyle,
                        onPressed: () {},
                      ),
                    ]),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                      title: Text(filteredList[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Display(
                              text: filteredList[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class Display extends StatelessWidget {
  final String text;

  const Display({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text),
      ),
    );
  }
}
