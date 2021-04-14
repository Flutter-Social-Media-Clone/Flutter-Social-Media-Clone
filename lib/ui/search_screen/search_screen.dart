import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:flutter/material.dart';

class PeopleSearchResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchResult(
      [
        PeopleSearchResult(
          text: "deneme",
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/3.jpg",
          ),
        ),
        PeopleSearchResult(
          text: "deneme",
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/3.jpg",
          ),
        ),
        PeopleSearchResult(
          text: "deneme",
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/3.jpg",
          ),
        ),
      ],
    );
  }
}

class TopicSearchResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchResult(
      [
        TopicSearchResult(
          text: "deneme",
        ),
        TopicSearchResult(
          text: "deneme",
        ),
        TopicSearchResult(
          text: "deneme",
        ),
      ],
    );
  }
}

class LocationSearchResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchResult(
      [
        LocationSearchResult(
          text: "deneme",
        ),
        LocationSearchResult(
          text: "deneme",
        ),
        LocationSearchResult(
          text: "deneme",
        ),
      ],
    );
  }
}
