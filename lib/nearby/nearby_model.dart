import '/components/custom_appbar_widget.dart';
import '/components/nearby_card_widget.dart';
import '/components/nearby_post_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nearby_widget.dart' show NearbyWidget;
import 'package:flutter/material.dart';

class NearbyModel extends FlutterFlowModel<NearbyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // Model for nearbyCard component.
  late NearbyCardModel nearbyCardModel;
  // Model for nearbyPostBox component.
  late NearbyPostBoxModel nearbyPostBoxModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    nearbyCardModel = createModel(context, () => NearbyCardModel());
    nearbyPostBoxModel = createModel(context, () => NearbyPostBoxModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customAppbarModel.dispose();
    nearbyCardModel.dispose();
    nearbyPostBoxModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
