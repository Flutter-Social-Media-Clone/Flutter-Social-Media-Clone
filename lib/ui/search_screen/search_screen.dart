import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/ui/main_app_screen/main_app_viewmodel.dart';
import 'package:cs310insta/ui/search_screen/search_viewmodel.dart';
import 'package:cs310insta/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WrapSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, model, child) => Expanded(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  child: Text(
                    "Location",
                    style: login_signupButtonTextStyle,
                  ),
                  style: login_signupButtonStyle,
                  onPressed: () {
                    model.setMode("locations");
                  },
                ),
                OutlinedButton(
                  child: Text(
                    "Topic",
                    style: login_signupButtonTextStyle,
                  ),
                  style: login_signupButtonStyle,
                  onPressed: () {
                    model.setMode("topics");
                  },
                ),
                OutlinedButton(
                  child: Text(
                    "People",
                    style: login_signupButtonTextStyle,
                  ),
                  style: login_signupButtonStyle,
                  onPressed: () {
                    model.setMode("peoples");
                  },
                ),
              ],
            ),
            SearchResult(
              model.getContent(),
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
