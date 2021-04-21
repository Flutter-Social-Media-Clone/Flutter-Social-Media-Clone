import 'package:cs310insta/core/models/postBase.dart';
import 'package:cs310insta/core/models/searchResultBase.dart';
import 'package:cs310insta/core/models/shareBase.dart';
import 'package:cs310insta/ui/search_screen/search_screen.dart';
import 'package:cs310insta/ui/share_screen/share_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "dart:io";
import 'package:image_picker/image_picker.dart';

class MainAppViewModel extends ChangeNotifier {
  List<SearchResultBase> peoples = [];
  List<SearchResultBase> locations = [];
  List<SearchResultBase> topics = [];

  List<PostBase> myMedias = [];
  List<PostBase> myLocations = [];
  List<PostBase> myPosts = [];

  PickedFile _image;

  Widget placeholder = Text("A");

  MainAppViewModel() {
    peoples = [
      PeopleSearchResult(
        id: "thirdPersonProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      PeopleSearchResult(
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      PeopleSearchResult(
        id: "hiddenProfile",
        text: "deneme",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];

    topics = [
      TopicSearchResult(
        id: "thirdPersonProfile",
        text: "deneme",
      ),
      TopicSearchResult(
        id: "thirdPersonProfile",
        text: "deneme",
      ),
      TopicSearchResult(
        id: "hiddenProfile",
        text: "deneme",
      )
    ];
    locations = [
      LocationSearchResult(
        id: "thirdPersonProfile",
        text: "deneme",
      ),
      LocationSearchResult(
        id: "thirdPersonProfile",
        text: "deneme",
      ),
      LocationSearchResult(
        id: "hiddenProfile",
        text: "deneme",
      ),
    ];

    myMedias = [
      ImagePost(
        username: "Kaya",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      ImagePost(
        username: "Kaya",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
      ImagePost(
        username: "Kaya",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];

    myPosts = [
      TextPost(
        username: "Kaya",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
      ),
      TextPost(
        username: "Kaya",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
      ),
      TextPost(
        username: "Kaya",
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        text: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
      ),
    ];
    myLocations = [
      ImagePost(
        username: "Kaya",
        image: NetworkImage(
          "https://randomuser.me/api/portraits/women/4.jpg",
        ),
        profileImage: NetworkImage(
          "https://randomuser.me/api/portraits/women/3.jpg",
        ),
      ),
    ];
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  String _myShareIndex = "media";
  String get myShareIndex => _myShareIndex;

  String _myselectedIndex = "posts";
  String get myselectedIndex => _myselectedIndex;

  String _selectedMode = "peoples";
  String get selectedMode => _selectedMode;

  File get image => _image != null ? File(_image.path) : null;

  // int getSelectedIndex2() {
  //   print("called 2 ==> $selectedIndex");
  //   return selectedIndex;
  // }
  //
  //
  //

  final _picker = ImagePicker();

  void imgFromCamera() async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    _image = image;
    notifyListeners();
  }

  void imgFromGallery() async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    _image = image;
    notifyListeners();
  }

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners(); // <-- notify listeners
  }

  void onItemNavigatorTapped(int index) {
    _selectedIndex = index;
    notifyListeners(); // <-- notify listeners
  }

  void setMode(String index) {
    _selectedMode = index;
    notifyListeners();
  }

  void setmyIndex(String index) {
    _myselectedIndex = index;
    notifyListeners(); // <-- notify listeners
  }

  void setShareIndex(String index) {
    _myShareIndex = index;
    notifyListeners(); // <-- notify listeners
  }

  void removeImage() {
    _image = null;
    notifyListeners();
  }

  List<SearchResultBase> getSearchResult() {
    if (_selectedMode == "peoples") {
      return peoples;
    } else if (_selectedMode == "locations") {
      return locations;
    } else if (_selectedMode == "topics") {
      return topics;
    }
  }

  List<PostBase> getMyResults() {
    if (_myselectedIndex == "posts") {
      return myPosts;
    } else if (_myselectedIndex == "medias") {
      return myMedias;
    } else if (_myselectedIndex == "locations") {
      return myLocations;
    }
  }

  Widget getShareResults() {
    if (_myShareIndex == "media") {
      return PostImage();
    } else if (_myShareIndex == "post") {
      return PostPost();
    } else if (_myShareIndex == "location") {
      return MediaShare();
    }
  }

  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  //Widget get pageWidget => _widgetOptions.elementAt(_selectedIndex);

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // <-- notify listeners
  }
}
