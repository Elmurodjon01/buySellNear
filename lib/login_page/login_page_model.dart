import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for logemailAddress widget.
  FocusNode? logemailAddressFocusNode;
  TextEditingController? logemailAddressController;
  String? Function(BuildContext, String?)? logemailAddressControllerValidator;
  // State field(s) for logpassword widget.
  FocusNode? logpasswordFocusNode;
  TextEditingController? logpasswordController;
  late bool logpasswordVisibility;
  String? Function(BuildContext, String?)? logpasswordControllerValidator;
  // State field(s) for signemailadd widget.
  FocusNode? signemailaddFocusNode;
  TextEditingController? signemailaddController;
  String? Function(BuildContext, String?)? signemailaddControllerValidator;
  // State field(s) for signname widget.
  FocusNode? signnameFocusNode;
  TextEditingController? signnameController;
  String? Function(BuildContext, String?)? signnameControllerValidator;
  // State field(s) for phoneNum widget.
  FocusNode? phoneNumFocusNode;
  TextEditingController? phoneNumController;
  String? Function(BuildContext, String?)? phoneNumControllerValidator;
  // State field(s) for signpass widget.
  FocusNode? signpassFocusNode;
  TextEditingController? signpassController;
  late bool signpassVisibility;
  String? Function(BuildContext, String?)? signpassControllerValidator;
  // State field(s) for signpassCheck widget.
  FocusNode? signpassCheckFocusNode;
  TextEditingController? signpassCheckController;
  late bool signpassCheckVisibility;
  String? Function(BuildContext, String?)? signpassCheckControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    logpasswordVisibility = false;
    signpassVisibility = false;
    signpassCheckVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    logemailAddressFocusNode?.dispose();
    logemailAddressController?.dispose();

    logpasswordFocusNode?.dispose();
    logpasswordController?.dispose();

    signemailaddFocusNode?.dispose();
    signemailaddController?.dispose();

    signnameFocusNode?.dispose();
    signnameController?.dispose();

    phoneNumFocusNode?.dispose();
    phoneNumController?.dispose();

    signpassFocusNode?.dispose();
    signpassController?.dispose();

    signpassCheckFocusNode?.dispose();
    signpassCheckController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
