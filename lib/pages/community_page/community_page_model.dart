import '/backend/backend.dart';
import '/components/custom_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunityPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for customAppBar component.
  late CustomAppBarModel customAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customAppBarModel = createModel(context, () => CustomAppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    customAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
