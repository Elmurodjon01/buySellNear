import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_page_widget.dart' show CommunityPageWidget;
import 'package:flutter/material.dart';

class CommunityPageModel extends FlutterFlowModel<CommunityPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customAppbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
