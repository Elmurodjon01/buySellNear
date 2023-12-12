import '/flutter_flow/flutter_flow_util.dart';
import 'village_post_widget.dart' show VillagePostWidget;
import 'package:flutter/material.dart';

class VillagePostModel extends FlutterFlowModel<VillagePostWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
