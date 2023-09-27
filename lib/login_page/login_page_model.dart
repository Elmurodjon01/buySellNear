import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for logemailAddress widget.
  TextEditingController? logemailAddressController;
  String? Function(BuildContext, String?)? logemailAddressControllerValidator;
  // State field(s) for logpassword widget.
  TextEditingController? logpasswordController;
  late bool logpasswordVisibility;
  String? Function(BuildContext, String?)? logpasswordControllerValidator;
  // State field(s) for signimage widget.
  TextEditingController? signimageController;
  String? Function(BuildContext, String?)? signimageControllerValidator;
  // State field(s) for signemailadd widget.
  TextEditingController? signemailaddController;
  String? Function(BuildContext, String?)? signemailaddControllerValidator;
  // State field(s) for signname widget.
  TextEditingController? signnameController;
  String? Function(BuildContext, String?)? signnameControllerValidator;
  // State field(s) for signpass widget.
  TextEditingController? signpassController;
  late bool signpassVisibility;
  String? Function(BuildContext, String?)? signpassControllerValidator;
  // State field(s) for signpassCheck widget.
  TextEditingController? signpassCheckController;
  late bool signpassCheckVisibility;
  String? Function(BuildContext, String?)? signpassCheckControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    logpasswordVisibility = false;
    signpassVisibility = false;
    signpassCheckVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    logemailAddressController?.dispose();
    logpasswordController?.dispose();
    signimageController?.dispose();
    signemailaddController?.dispose();
    signnameController?.dispose();
    signpassController?.dispose();
    signpassCheckController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
