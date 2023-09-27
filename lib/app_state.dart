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
  set bottomaction(String _value) {
    _bottomaction = _value;
  }

  String _mainmenu = '0';
  String get mainmenu => _mainmenu;
  set mainmenu(String _value) {
    _mainmenu = _value;
  }

  int _galleryHeight = 100;
  int get galleryHeight => _galleryHeight;
  set galleryHeight(int _value) {
    _galleryHeight = _value;
  }

  bool _ex = false;
  bool get ex => _ex;
  set ex(bool _value) {
    _ex = _value;
  }

  bool _likeToggle = false;
  bool get likeToggle => _likeToggle;
  set likeToggle(bool _value) {
    _likeToggle = _value;
    prefs.setBool('ff_likeToggle', _value);
  }

  int _isFamous = 4;
  int get isFamous => _isFamous;
  set isFamous(int _value) {
    _isFamous = _value;
    prefs.setInt('ff_isFamous', _value);
  }

  DocumentReference? _comments;
  DocumentReference? get comments => _comments;
  set comments(DocumentReference? _value) {
    _comments = _value;
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
