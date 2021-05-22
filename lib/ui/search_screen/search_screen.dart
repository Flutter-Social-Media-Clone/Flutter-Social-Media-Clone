import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/core/state/states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrapSearch extends StatelessWidget {
  final SearchState searchState = Get.put(SearchState());

  @override
  Widget build(BuildContext context) {
    // searchState.getPeopleForSearch();
    // searchState.getPeopleForSearch();

    var elementToDisplay;

    // if (searchState.selectedMode.value == "peoples" ||
    //     searchState.selectedMode.value == "locations") {
    //   elementToDisplay = Obx(
    //     () => SearchResult(
    //       searchState.getSearchResult(),
    //     ),
    //   );
    // } else {
    //   elementToDisplay = Obx(() => (searchState.getSearchTopicResult()));
    // }

    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Obx(
              () => searchState.getSearchResult(),
            ),
          ],
        ),
      ),
    );

    // Container(
    //   child: SearchResult(model.peoples),
    // );
  }
}

// class PeopleSearchResultList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SearchResult(
//       [
//         PeopleSearchResult(
//           text: "deneme",
//           image: NetworkImage(
//             "https://randomuser.me/api/portraits/women/3.jpg",
//           ),
//         ),
//         PeopleSearchResult(
//           text: "deneme",
//           image: NetworkImage(
//             "https://randomuser.me/api/portraits/women/3.jpg",
//           ),
//         ),
//         PeopleSearchResult(
//           text: "deneme",
//           image: NetworkImage(
//             "https://randomuser.me/api/portraits/women/3.jpg",
//           ),
//         ),
//       ],
//     );
//   }
// }

// class TopicSearchResultList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SearchResult(
//       [
//         TopicSearchResult(
//           text: "deneme",
//         ),
//         TopicSearchResult(
//           text: "deneme",
//         ),
//         TopicSearchResult(
//           text: "deneme",
//         ),
//       ],
//     );
//   }
// }

// class LocationSearchResultList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SearchResult(
//       [
//         LocationSearchResult(
//           text: "deneme",
//         ),
//         LocationSearchResult(
//           text: "deneme",
//         ),
//         LocationSearchResult(
//           text: "deneme",
//         ),
//       ],
//     );
//   }
// }
