import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _likeToggle = prefs.getBool('ff_likeToggle') ?? _likeToggle;
    });
    _safeInit(() {
      _isFamous = prefs.getInt('ff_isFamous') ?? _isFamous;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _bottomaction = '0';
  String get bottomaction => _bottomaction;
  set bottomaction(String value) {
    _bottomaction = value;
  }

  String _mainmenu = '0';
  String get mainmenu => _mainmenu;
  set mainmenu(String value) {
    _mainmenu = value;
  }

  int _galleryHeight = 100;
  int get galleryHeight => _galleryHeight;
  set galleryHeight(int value) {
    _galleryHeight = value;
  }

  bool _ex = false;
  bool get ex => _ex;
  set ex(bool value) {
    _ex = value;
  }

  bool _likeToggle = false;
  bool get likeToggle => _likeToggle;
  set likeToggle(bool value) {
    _likeToggle = value;
    prefs.setBool('ff_likeToggle', value);
  }

  int _isFamous = 4;
  int get isFamous => _isFamous;
  set isFamous(int value) {
    _isFamous = value;
    prefs.setInt('ff_isFamous', value);
  }

  DocumentReference? _comments;
  DocumentReference? get comments => _comments;
  set comments(DocumentReference? value) {
    _comments = value;
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int value) {
    _pageIndex = value;
  }

  List<String> _locations = ['용현 1, 4 동', '연수구 123', '제물포', '도화', '서추동 '];
  List<String> get locations => _locations;
  set locations(List<String> value) {
    _locations = value;
  }

  void addToLocations(String value) {
    _locations.add(value);
  }

  void removeFromLocations(String value) {
    _locations.remove(value);
  }

  void removeAtIndexFromLocations(int index) {
    _locations.removeAt(index);
  }

  void updateLocationsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _locations[index] = updateFn(_locations[index]);
  }

  void insertAtIndexInLocations(int index, String value) {
    _locations.insert(index, value);
  }

  int _villageChoice = 0;
  int get villageChoice => _villageChoice;
  set villageChoice(int value) {
    _villageChoice = value;
  }

  List<String> _isImage = [
    'https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg'
  ];
  List<String> get isImage => _isImage;
  set isImage(List<String> value) {
    _isImage = value;
  }

  void addToIsImage(String value) {
    _isImage.add(value);
  }

  void removeFromIsImage(String value) {
    _isImage.remove(value);
  }

  void removeAtIndexFromIsImage(int index) {
    _isImage.removeAt(index);
  }

  void updateIsImageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _isImage[index] = updateFn(_isImage[index]);
  }

  void insertAtIndexInIsImage(int index, String value) {
    _isImage.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
