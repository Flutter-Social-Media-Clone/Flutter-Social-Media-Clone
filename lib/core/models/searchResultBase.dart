import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';

abstract class SearchResultBase extends StatelessWidget {
  final String text;
  SearchResultBase({this.text});
}

class PeopleSearchResult extends SearchResultBase {
  final NetworkImage image;
  PeopleSearchResult({text, this.image}) : super(text: text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/thirdPersonProfile",
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: this.image,
                backgroundColor: Colors.grey[400],
                radius: 30,
              ),
              SizedBox(width: 30),
              Text(
                text,
                style: searchResultTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopicSearchResult extends SearchResultBase {
  TopicSearchResult({text}) : super(text: text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "#$text",
                style: searchResultTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationSearchResult extends SearchResultBase {
  LocationSearchResult({text}) : super(text: text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_pin),
              Text(
                "$text",
                style: searchResultTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  final List<SearchResultBase> items;
  SearchResult(this.items);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        // padding: const EdgeInsets.all(8),
        children: this.items,
        //shrinkWrap: true,
      ),
    );
  }
}
